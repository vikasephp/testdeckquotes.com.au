<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/
require_once(MODULES_DIR . 'frontend.init.php');
$fwAuthGroup->forceLogin();

// module names
$MODULE_SINGULAR = 'Brief Builder';
$MODULE_PLURAL =   'Brief Builder';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'brief_builder';
$ID = 'bb_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['catergory'] = $Fusebox['catergory'] . '.catergory';

function upload($filename, $tmpname)
{
    $path = getcwd();
    $zipfile = $filename;
    $resource_id = 1;
    $error_type = "File Uploading to AWS Bucket";

    header('Access-Control-Allow-Origin: *');

    $filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
    include_once $filetoinclude;

    $date = date("Y-m-d H:i:s");

    try {
        if (move_uploaded_file($tmpname, $path . '/' .  basename($zipfile))) {
            $s3 = new S3(ACCESS_KEY, SECRET_KEY);

            $flag = 0;

            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/brief_builder/' . $zipfile)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
                if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/brief_builder/' . $zipfile))
                    $flag = 1;
                //die('in putobject in 10');
            }
        } else {
            echo 'not moved';
            exit;
        }
    } catch (ErrorException $ex) {
        //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
        return false;
    }


    $rem = $path . '/' .  basename($filename);
    unlink($rem);
}

function get_file_raw_data($folder_path, $object_name)
{

    $filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
    include_once $filetoinclude;
    $bucket_name  = BUCKET_NAME;
    $s3 = new S3(ACCESS_KEY, SECRET_KEY);
    try {
        $file_data = $s3->getObject($bucket_name, $folder_path . $object_name, $saveTo = false);
        //	echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
        $file_raw_data = $file_data->body;
        $file = $object_name;
        $txt = fopen($_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file, "w") or die("Unable to open file!");
        fwrite($txt, $file_raw_data);
        fclose($txt);
        return $file_path = BASE_URL . 'download_files/' . $file;
    } catch (ErrorException $ex) {
        //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
        return false;
    }
}
