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
$MODULE_SINGULAR = 'Mistake Log';
$MODULE_PLURAL = 'Mistake Log';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'mistake_log';
$ID = 'ml_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// FOR ADMIN OPTIONS
$ATTRIBUTES = [
	'mistake_log_category' => [
		'name' => 'Category',
		'table' => 'mistake_log_category',
		'id' => 'mlc_id',
		'option_col' => 'mlc_option',
		'add_file' => 'add_category.tpl',
		'add_fle_name' => 'add_category',
		'view_file' => 'view_category.tpl',
		'view_fle_name' => 'view_category',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_category',
		'delete_fle_name' => 'delete_category',
	],
	'mistake_log_process_stage' => [
		'name' => 'Process Stage',
		'table' => 'mistake_log_process_stage',
		'id' => 'mlps_id',
		'option_col' => 'mlps_option',
		'add_file' => 'add_process_stage.tpl',
		'add_fle_name' => 'add_process_stage',
		'view_file' => 'view_process_stage.tpl',
		'view_fle_name' => 'view_process_stage',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_process_stage',
		'delete_fle_name' => 'delete_process_stage',
	],
	'mistake_log_repeat' => [
		'name' => 'Repeat',
		'table' => 'mistake_log_repeat',
		'id' => 'mlr_id',
		'option_col' => 'mlr_option',
		'add_file' => 'add_repeat.tpl',
		'add_fle_name' => 'add_repeat',
		'view_file' => 'view_repeat.tpl',
		'view_fle_name' => 'view_repeat',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_repeat',
		'delete_fle_name' => 'delete_repeat',
	],
	'mistake_log_stream' => [
		'name' => 'Stream',
		'table' => 'mistake_log_stream',
		'id' => 'mls_id',
		'option_col' => 'mls_option',
		'manager_col' => 'mls_managers',
		'add_file' => 'add_stream.tpl',
		'add_fle_name' => 'add_stream',
		'view_file' => 'view_stream.tpl',
		'view_fle_name' => 'view_stream',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_stream',
		'delete_fle_name' => 'delete_stream',
	],
	'mistake_log_status' => [
		'name' => 'Status',
		'table' => 'mistake_log_status',
		'id' => 'mls_id',
		'option_col' => 'mls_option',
		'color_col' => 'mls_color',
		'add_file' => 'add_status.tpl',
		'add_fle_name' => 'add_status',
		'view_file' => 'view_status.tpl',
		'view_fle_name' => 'view_status',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_status',
		'delete_fle_name' => 'delete_status',
	],
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

$BASEFOLDER = 'mistake_log';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['replay'] = $Fusebox['circuit'] . '.replay';

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
            $s3 = new S3('AKIA2AMNCYNN7O5EFUFK', 'VEZHhG7ktp6XuszgBHV/V4GESsxHNIsfVHzYlkzz');

            //print_r($s3);exit;
            
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote', 'files/mistake_log/'.$zipfile, S3::ACL_PUBLIC_READ)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote',  'files/mistake_log/'.$zipfile, S3::ACL_PUBLIC_READ))
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