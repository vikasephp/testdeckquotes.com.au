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
$MODULE_SINGULAR = 'Central Letter Database';
$MODULE_PLURAL =   'Central Letter Database';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// Main Table and ID
$TABLE = 'central_letter_database';
$fwViewData['TABLE'] = $TABLE;
$ID = 'cld_id';
$fwViewData['ID'] = $ID;


$PPTABLE = 'pp_central_letter_database';
$PPID = 'pr_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

// FOR ADMIN OPTIONS
$ATTRIBUTES = [
	'type' => [
		'name' => 'Letter Type',
		'table' => 'central_letter_database_letter_type',
		'id' => 'cld_id',
		'option_col' => 'cld_type',
		'add_file' => 'add_letter_type.tpl',
		'add_fle_name' => 'add_letter_type',
		'view_file' => 'view_letter_type.tpl',
		'view_fle_name' => 'view_letter_type',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_letter_type',
		'delete_fle_name' => 'delete_letter_type',
	],
	'status' => [
		'name' => 'Status',
		'table' => 'central_letter_database_status',
		'id' => 'cld_id',
		'option_col' => 'cld_status',
		'add_file' => 'add_status.tpl',
		'add_fle_name' => 'add_status',
		'view_file' => 'view_status.tpl',
		'view_fle_name' => 'view_status',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_status',
		'delete_fle_name' => 'delete_status',
	],
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

$BASEFOLDER = 'central_letter_database';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['home'] = $Fusebox['circuit'] . '.home';
// $XFA['add_new'] = $Fusebox['circuit'] . '.add_new';
// $XFA['delete'] = $Fusebox['circuit'] . '.delete';

function upload($filename, $tmpname)
{
	global $BASEFOLDER;
	$path = getcwd(); //echo "<br> path :: ".$path;

	$explodeFile = explode(".", $filename);
	$zipfile = $explodeFile[0] . '_' . date('d_m_Y_h_i_s_a') . '.' . $explodeFile[1];
	// echo $zipfile; die();
	// $zipfile = $filename;

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
			try {
				if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/' . $BASEFOLDER . '/' . $zipfile, S3::ACL_PRIVATE)) {
					$flag = 1; //die('in putobject');
				} else {
					sleep(10);
					if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/' . $BASEFOLDER . '/' . $zipfile, S3::ACL_PRIVATE))
						$flag = 1;
					//die('in putobject in 10');
				}
			} catch (ErrorException $ex) {
				//$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
				echo $ex->getLine();
				return false;
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


	$rem = $path . '/' .  basename($zipfile);
	unlink($rem);
	return $zipfile;
}
