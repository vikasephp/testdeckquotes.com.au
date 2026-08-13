<?php
$postedData = $_GET; //echo "<pre>"; print_r($postedData); 
$folder_path = "";

if (!empty($postedData['file_name']) && !empty($postedData['module_name'])) {

    if ($postedData['module_name'] == $BASEFOLDER.".home") {
        $folder_path = "files/" . $BASEFOLDER . "/";
    }

    $filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
    include_once $filetoinclude;
    $bucket_name  = "deckquote";
    $object_name  = $postedData['file_name'];
    $my_file_name = $postedData['file_name'];
    $s3 = new S3(ACCESS_KEY, SECRET_KEY);
    try {
        $file_data = $s3->getObject($bucket_name, $folder_path . $object_name, $saveTo = false);
        	// echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
        $file_raw_data = $file_data->body;



        $file = $my_file_name;
        $txt = fopen($_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file, "w") or die("Unable to open file!");
        fwrite($txt, $file_raw_data);
        fclose($txt);

        $safeName = str_replace(array('"', "\r", "\n"), '', basename($file));
        $contentType = !empty($file_data->headers['type']) ? $file_data->headers['type'] : 'application/octet-stream';

        /* view=1 => redirect to /download_files/{filename} so browser PDF toolbar shows the real name
           (Chrome uses the URL path, not Content-Disposition, for the PDF title) */
        $viewInline = !empty($postedData['view']) && ($postedData['view'] == '1' || $postedData['view'] == 'inline');

        if ($viewInline) {
            $base = defined('BASE_URL') ? rtrim(BASE_URL, '/') : '';
            header('Location: ' . $base . '/download_files/' . rawurlencode($safeName));
            exit();
        }

        header('Content-Description: File Transfer');
        header('Content-Disposition: attachment; filename="' . $safeName . '"');
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . filesize($_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file));
        header('Content-Type: ' . $contentType);
        readfile($_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file);
        exit();
    } catch (ErrorException $ex) {
        //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
        return false;
    }
} else {
    echo "file_name or module name is missing";
}
