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
$MODULE_SINGULAR = 'Checklist';
$MODULE_PLURAL = 'Checklist';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'checklist';
$ID = 'cl_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';



function upload_pp_doc($filename, $tmpname)
{
	
	
	$path = getcwd();
	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');

        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
					{  
            //$s3 = new S3('AKIA2AMNCYNN7O5EFUFK', 'VEZHhG7ktp6XuszgBHV/V4GESsxHNIsfVHzYlkzz');
	     $s3 = new S3('AKIA2AMNCYNN5VRBSNNU', '5ys4bfLGJQDLgX/Pc+E66/2Yo8jpMgjcdAn1jGKg');
		
      
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote', 'files/progress_payment_doc/'.$zipfile, S3::ACL_PUBLIC_READ)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote',  'files/progress_payment_doc/'.$zipfile, S3::ACL_PUBLIC_READ))
		$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'Document not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}

