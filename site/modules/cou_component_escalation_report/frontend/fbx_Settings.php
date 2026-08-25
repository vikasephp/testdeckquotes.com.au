<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit.
	</responsibilities>
</fusedoc>
*/
require_once(MODULES_DIR . 'frontend.init.php');
$fwAuthGroup->forceLogin();

$MODULE_SINGULAR = 'COU Component Escalation Report';
$MODULE_PLURAL = 'COU Component Escalation Report';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

$TABLE = 'business';
$ID = 'bsn_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';

$BASEFOLDER = 'cou_component_escalation_report';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

$query = 'SELECT user_id, user_name FROM users';
$result = $fwDb->query($query);
$users_array = [];
foreach ($result as $row) {
	$users_array[$row['user_id']] = $row['user_name'];
}
$fwViewData['users_array'] = $users_array;

function upload($filename, $tmpname)
{
	$path = getcwd();
	$zipfile = $filename;
	header('Access-Control-Allow-Origin: *');
	$filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
	include_once $filetoinclude;

	try {
		if (move_uploaded_file($tmpname, $path . '/' . basename($zipfile))) {
			$s3 = new S3(ACCESS_KEY, SECRET_KEY);
			if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/cou_component_escalation_attachment/' . $zipfile, S3::ACL_PRIVATE)) {
			} else {
				sleep(10);
				$s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/cou_component_escalation_attachment/' . $zipfile, S3::ACL_PRIVATE);
			}
		} else {
			echo 'not moved';
			exit;
		}
	} catch (ErrorException $ex) {
		echo $ex->getLine();
		return false;
	}

	$rem = $path . '/' . basename($filename);
	unlink($rem);
}
