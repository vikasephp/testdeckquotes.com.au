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
$MODULE_SINGULAR = 'Dual Occupancy Lead Report ';
$MODULE_PLURAL = 'Dual Occupancy Lead Report ';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

$fwViewData['BASEFOLDER'] = $BASEFOLDER = 'dual_occupancy_lead_report';

// module table and id
$TABLE = 'dual_occupancy_lead_report';
$ID = 'dolr_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';

//ATTRIBUTES
$ATTRIBUTES = [
	'zoning' => [
		'name' => 'Zoning',
		'table' => 'dual_occupancy_canberra_zoning',
		'id' => 'docz_id',
		'option_col' => 'docz_option',
		'add_file' => 'add_zoning.tpl',
		'add_file_name' => 'add_zoning',
		'view_file' => 'view_zoning.tpl',
		'view_file_name' => 'view_zoning',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_zoning',
		'delete_file_name' => 'delete_zoning',
	],
	'size_class' => [
		'name' => 'Size Class',
		'table' => 'dual_occupancy_canberra_size_class',
		'id' => 'docsc_id',
		'option_col' => 'docsc_option',
		'add_file' => 'add_sizeclass.tpl',
		'add_file_name' => 'add_sizeclass',
		'view_file' => 'view_sizeclass.tpl',
		'view_file_name' => 'view_sizeclass',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_sizeclass',
		'delete_file_name' => 'delete_sizeclass',
	]
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

function get_file_raw_data($folder_path,$object_name)
{
	$zipfile = $postedData['file_name'];
	$filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	include_once $filetoinclude; $raw_data = "";
	$s3 = new S3(ACCESS_KEY, SECRET_KEY);
	try {
		$bucket_name  = BUCKET_NAME;
		$file_data = $s3->getObject($bucket_name,$folder_path.$object_name, $saveTo = false); 
	//	echo "<pre>";print_r($file_data);  
		$file_data = $file_data->body;
		$type = pathinfo($object_name, PATHINFO_EXTENSION);
		return $raw_data = 'data:image/' . $type . ';base64,' . base64_encode($file_data);
	
	} catch (ErrorException $ex) {
		//$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
		echo $ex->getLine();
	}
}

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
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/dual_occupancy_qa/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/dual_occupancy_qa/'.$zipfile, S3::ACL_PRIVATE))
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

