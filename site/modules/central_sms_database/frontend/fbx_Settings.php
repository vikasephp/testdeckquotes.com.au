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
$MODULE_SINGULAR = 'Central SMS Database';
$MODULE_PLURAL =   'Central SMS Database';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// fuseactions
$XFA['home'] = $Fusebox['circuit'] . '.home';

$BASEFOLDER = 'central_sms_database';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// Main Table and ID
$TABLE = 'psr_enquiry_sms_history';
$fwViewData['TABLE'] = $TABLE;
$ID = 'psresh_id';
$fwViewData['ID'] = $ID;

$PPTABLE = 'pp_sms_history';
$PPID = 'pr_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

function upload($filename, $tmpname)
{
	global $BASEFOLDER;
	$path = getcwd(); //echo "<br> path :: ".$path;

	$explodeFile = explode(".", $filename);
	$totalExplosion = count($explodeFile);
	$extension = $explodeFile[$totalExplosion - 1];
	$name = str_replace('.' . $extension, '', $filename);
	$zipfile = $name . '_' . date('d_m_Y_h_i_s_a') . '.' . $extension;
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
