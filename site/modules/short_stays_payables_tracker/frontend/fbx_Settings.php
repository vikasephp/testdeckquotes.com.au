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

$MODULE_SINGULAR = 'Short Stays Payables Tracker';
$MODULE_PLURAL = 'Short Stays Payables Tracker';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

$TABLE = 'short_stays_payables_tracker';
$ID = 'ssp_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['upload'] = $Fusebox['circuit'] . '.upload';
$XFA['docdelete'] = $Fusebox['circuit'] . '.docdelete';
$XFA['open'] = $Fusebox['circuit'] . '.open';
$XFA['tprint'] = $Fusebox['circuit'] . '.tprint';
$XFA['tdprint'] = $Fusebox['circuit'] . '.tdprint';

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

			if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/short_stays_payables_tracker_invoice/' . $zipfile, S3::ACL_PRIVATE)) {
				// uploaded
			} else {
				sleep(10);
				$s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/short_stays_payables_tracker_invoice/' . $zipfile, S3::ACL_PRIVATE);
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

function fetch_file_raw_data($folder_path, $object_name)
{
	$filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
	include_once $filetoinclude;
	$bucket_name = "deckquote";

	$s3 = new S3(ACCESS_KEY, SECRET_KEY);
	try {
		$file_data = $s3->getObject($bucket_name, $folder_path . $object_name, $saveTo = false);
		$file_raw_data = $file_data->body;
		$file = $object_name;
		file_put_contents($_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file, $file_raw_data);
		return $_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file;
	} catch (ErrorException $ex) {
		echo $ex->getLine();
		return false;
	}
}
