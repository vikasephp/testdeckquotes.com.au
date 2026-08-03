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
	'letter_log' => [
		'name' => 'Letter Log',
		'table' => 'letter_email_log',
		'id' => 'letter_log_id',
		'option_col' => 'sent_date',
		'add_file' => 'add_letter_log.tpl',
		'add_fle_name' => 'add_letter_log',
		'view_file' => 'view_letter_log.tpl',
		'view_fle_name' => 'view_letter_log',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_letter_log',
		'delete_fle_name' => 'delete_letter_log',
	],
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

$BASEFOLDER = 'central_letter_database';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['home'] = $Fusebox['circuit'] . '.home';
// $XFA['add_new'] = $Fusebox['circuit'] . '.add_new';
// $XFA['delete'] = $Fusebox['circuit'] . '.delete';
function get_file_data($object_name)
{
    $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
    include_once $filetoinclude;  
    $folder_path = "files/central_letter_database/";
    $bucket_name  = BUCKET_NAME;     
    $my_file_name = $object_name;
    // Safe local filename (S3 key stays as stored; spaces/special chars break local path/email attach).
    $safe_local_name = preg_replace('/[^A-Z0-9._-]/i', '_', basename((string)$object_name));
    $safe_local_name = preg_replace('/_+/', '_', $safe_local_name);
    $safe_local_name = trim($safe_local_name, '._');
    if ($safe_local_name === '') {
        $safe_local_name = 'attachment_' . date('Ymd_His');
    }
    $s3 = new S3(ACCESS_KEY, SECRET_KEY);
    try {
        $file_data = $s3->getObject($bucket_name, $folder_path.$object_name, $saveTo = false); 
        $file_raw_data = $file_data->body;
        $file = $safe_local_name;
        $txt = fopen($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file, "w") or die("Unable to open file!");
        fwrite($txt, $file_raw_data);
        fclose($txt);
        return $_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file ;
    } catch (ErrorException $ex) {
        return false;
    }
}

function upload($filename, $tmpname)
{
	global $BASEFOLDER;
	$path = getcwd(); //echo "<br> path :: ".$path;

	// Sanitize: spaces and special chars break S3 / download / email attachments.
	$filename = basename((string)$filename);
	$filename = preg_replace('/[^A-Z0-9._-]/i', '_', $filename);
	$filename = preg_replace('/_+/', '_', $filename);
	$filename = trim($filename, '._');
	if ($filename === '' || $filename === '.') {
		$filename = 'attachment_' . date('Ymd_His');
	}

	$explodeFile = explode(".", $filename);
	$totalExplosion = count($explodeFile);
	$extension = strtolower($explodeFile[$totalExplosion - 1]);
	if ($totalExplosion < 2 || $extension === '') {
		$extension = 'bin';
		$name = $filename;
	} else {
		$name = substr($filename, 0, -(strlen($extension) + 1));
		$name = trim($name, '._');
		if ($name === '') {
			$name = 'attachment';
		}
	}
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

/**
 * Map Central Letter Database letter type name -> document_check_list.doc_name_id
 * Planning Approvals Only shares the same Planning Approvals Update Letter slot (456).
 */
function cld_letter_type_to_doc_name_id($letterTypeName)
{
	$map = [
		'Customer Design Update Letter' => 458,
		'Planning Approvals Update Letter' => 456,
		'Construction Report Update Letter' => 455,
		'Inclusions Progress Update Letter' => 457,
		'Planning Approvals Only Update Letter' => 456,
	];
	$letterTypeName = trim((string)$letterTypeName);
	return isset($map[$letterTypeName]) ? (int)$map[$letterTypeName] : 0;
}

/**
 * Copy a CLD file on S3 into the Document Check List folder so trackers/checklist can download it.
 */
function copy_cld_file_to_document_checklist($fileName)
{
	$fileName = basename((string)$fileName);
	if ($fileName === '') {
		return false;
	}

	$filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
	include_once $filetoinclude;

	$s3 = new S3(ACCESS_KEY, SECRET_KEY);
	$safeLocalName = preg_replace('/[^A-Z0-9._-]/i', '_', $fileName);
	$safeLocalName = preg_replace('/_+/', '_', $safeLocalName);
	$safeLocalName = trim($safeLocalName, '._');
	if ($safeLocalName === '') {
		$safeLocalName = 'attachment_' . date('Ymd_His');
	}
	$localPath = $_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $safeLocalName;

	try {
		$fileData = $s3->getObject(BUCKET_NAME, 'files/central_letter_database/' . $fileName, false);
		if (empty($fileData) || empty($fileData->body)) {
			return false;
		}
		if (file_put_contents($localPath, $fileData->body) === false) {
			return false;
		}
		$ok = $s3->putObjectFile($localPath, BUCKET_NAME, 'files/document_check_list_files/' . $fileName, S3::ACL_PRIVATE);
		@unlink($localPath);
		return (bool)$ok;
	} catch (Exception $ex) {
		@unlink($localPath);
		return false;
	}
}

/**
 * After a CLD letter is saved, push the file into the matching Project Document Checklist slot.
 * Only updates that one doc_name_id for the project (does not touch other checklist documents).
 */
function sync_cld_letter_to_document_checklist($bsnId, $letterTypeId, $fileName)
{
	global $fwDb;

	$bsnId = (int)$bsnId;
	$letterTypeId = (int)$letterTypeId;
	$fileName = basename((string)$fileName);

	if ($bsnId <= 0 || $letterTypeId <= 0 || $fileName === '') {
		return false;
	}

	$typeRow = $fwDb->queryOne('SELECT cld_type FROM central_letter_database_letter_type WHERE cld_id = ' . $letterTypeId);
	if (empty($typeRow['cld_type'])) {
		return false;
	}

	$docNameId = cld_letter_type_to_doc_name_id($typeRow['cld_type']);
	if ($docNameId <= 0) {
		return false;
	}

	// Ensure checklist download path has the file (CLD stores under central_letter_database/)
	copy_cld_file_to_document_checklist($fileName);

	$update = [
		'doc_file_name' => $fileName,
		'doc_user_name' => isset($_SESSION['user']['user_id']) ? $_SESSION['user']['user_id'] : 0,
		'doc_date_uploaded' => date('Y-m-d H:i'),
	];

	$table = new Fw_Db_Table('document_check_list');
	$table->setWhere('doc_name_id = ' . $docNameId . ' AND doc_bsn_id = ' . $bsnId);
	if ($table->rowExists()) {
		$table->updateRow($update);
	} else {
		$admin = $fwDb->queryOne('SELECT admin_doc_upload_to_dossier FROM admin_document_check_list WHERE admin_doc_id = ' . $docNameId);
		$insert = $update;
		$insert['doc_bsn_id'] = $bsnId;
		$insert['doc_name_id'] = $docNameId;
		$insert['doc_upload_to_dossier'] = !empty($admin['admin_doc_upload_to_dossier']) ? $admin['admin_doc_upload_to_dossier'] : 0;
		$table->insertRow($insert);
	}

	return true;
}
