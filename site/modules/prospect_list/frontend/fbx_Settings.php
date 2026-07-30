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
$MODULE_SINGULAR = 'Prospect List';
$MODULE_PLURAL = 'Prospect List';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

$BASEFOLDER = 'prospect_list';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// module table and id
$TABLE = 'prospect_list';
$ID = 'pl_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// FOR ADMIN OPTIONS
$ATTRIBUTES = [
	'status' => [
		'name' => 'Status',
		'table' => 'prospect_status',
		'id' => 'ps_id',
		'option_col' => 'ps_option',
		'add_file' => 'add_status.tpl',
		'add_fle_name' => 'add_status',
		'view_file' => 'view_status.tpl',
		'view_fle_name' => 'view_status',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_status',
		'delete_fle_name' => 'delete_status',
	],
	'service_type' => [
		'name' => 'Service Type',
		'table' => 'prospect_service_type',
		'id' => 'pst_id',
		'option_col' => 'pst_option',
		'add_file' => 'add_service_type.tpl',
		'add_fle_name' => 'add_service_type',
		'view_file' => 'view_service_type.tpl',
		'view_fle_name' => 'view_service_type',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_service_type',
		'delete_fle_name' => 'delete_service_type',
	],
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';

function upload($filename, $tmpname)
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
					$s3 = new S3(ACCESS_KEY, SECRET_KEY);
            
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/prospect_list/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
                if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/prospect_list/'.$zipfile, S3::ACL_PRIVATE))
					$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}