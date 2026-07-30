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
$MODULE_SINGULAR = 'Planning Definitions Database';
$MODULE_PLURAL =   'Planning Definitions Database';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'planning_defination_database';
$ID = 'pdd_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

$PPTABLE = 'pp_defination_database';
$PPID = 'pr_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

// FOR ADMIN OPTIONS
$ATTRIBUTES = [
	'type' => [
		'name' => 'Type',
		'table' => 'construction_invoice_disputes_type',
		'id' => 'cids_id',
		'option_col' => 'cids_option',
		'add_file' => 'add_type.tpl',
		'add_fle_name' => 'add_type',
		'view_file' => 'view_type.tpl',
		'view_fle_name' => 'view_type',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_type',
		'delete_fle_name' => 'delete_type',
	],
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

$BASEFOLDER = 'planning_definations_database';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['add_new'] = $Fusebox['circuit'] . '.add_new';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';

function upload($filename, $tmpname)
{
	global $BASEFOLDER;
	require_once(LIB_DIR . 'CloudEphpClass.php');
    $obj = new CloudEphpClass($BASEFOLDER . '.home');
    return $obj->upload($filename, $tmpname);
}

function showUrl($folder_path, $object_name)
{
	$filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
	include_once $filetoinclude;
	$s3 = new S3(ACCESS_KEY, SECRET_KEY);
	$bucket_name = BUCKET_NAME;
	$file_data = $s3->getObject($bucket_name, $folder_path . $object_name, $saveTo = false);
	$file_raw_data = $file_data->body;

	$file = $object_name;
	$txt = fopen($_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file, "w") or die("Unable to open file!");
	fwrite($txt, $file_raw_data);
	fclose($txt);

	return BASE_URL . 'download_files/' . $file;
}