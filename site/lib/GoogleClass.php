<?php

require BASE_DIR . '/vendor/autoload.php';

use Google\Cloud\Storage\StorageClient;

class GoogleClass
{
    public $bucket;
    public $duration;

    public function __construct($cloudData)
    {
        $storage = new StorageClient([
            'keyFilePath' => BASE_DIR . $cloudData['GOOGLE_JSON_FILE'],
        ]);
        $this->bucket = $storage->bucket($cloudData['BUCKET_NAME']);
        $this->duration = $cloudData['DOWNLOAD_DURATION'];
    }

    public function getBucketInfo()
    {
        return $this->bucket->info();
    }

    public function download($location, $file)
    {
        $dest = $_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file;
        $object = $this->bucket->object($location . $file);
        $object->downloadToFile($dest);
        header('Content-Description: File Transfer');
        header('Content-Disposition: attachment; filename=' . basename($dest));
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        // header('Content-Length: ' . filesize($fileWithPath));
        // header('Content-Length: ' . $headers['Content-Length']);
        // header("Content-Type: " . $headers['Content-Type']);
        readfile($dest);
        return;
    }

    public function getDownloadUrl($location, $file)
    {
        $object = $this->bucket->object($location . $file);
        return $object->signedUrl(
            new \DateTime('+' . $this->duration . ' seconds'), // Expiry time
            [
                'version' => 'v4',
            ]
        );
    }

    public function uploadFile($location, $file)
    {
        return $this->bucket->upload(
            fopen($file['tmp_name'], 'r'),
            [
                'name' => $location .  $file['name'],
            ]
        );
    }
}
