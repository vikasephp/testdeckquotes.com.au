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
$MODULE_SINGULAR = 'Client Alerts';
$MODULE_PLURAL =   'Client Alerts';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'planning_client_alerts';
$ID = 'pca_id';
$HIDE_COL = 'dpml_hide';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;
$fwViewData['HIDE_COL'] = $HIDE_COL;

// FOR PROCEDURE PANEL
$PPTABLE = 'pp_planning_client_alerts';
$PPID = 'pr_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

// FOR ADMIN OPTIONS
$ATTRIBUTES = [
	'0' => [
		'name' => 'Type',
		'table' => 'design_plans_mistake_log_type',
		'id' => 'dpmlt_id',
		'option_col' => 'dpmlt_option',
		'add_file' => 'add_type.tpl',
		'add_fle_name' => 'add_type',
		'view_file' => 'view_type.tpl',
		'view_fle_name' => 'view_type',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_type',
		'delete_fle_name' => 'delete_type',
	],
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;


$BASEFOLDER = 'planning_client_alerts';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['home'] = $Fusebox['circuit'] . '.home';

// db($fwViewData);


// function upload($filename, $tmpname)
// {
//     $path = getcwd();
//     $zipfile = $filename;

//     $resource_id = 1;
//     $error_type = "File Uploading to AWS Bucket";

//     header('Access-Control-Allow-Origin: *');

//     $filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
//     include_once $filetoinclude;

//     $date = date("Y-m-d H:i:s");

//     try {
//         if (move_uploaded_file($tmpname, $path . '/' .  basename($zipfile))) {
//             $s3 = new S3(ACCESS_KEY, SECRET_KEY);
//             $flag = 0;
//             if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote', 'files/design_plans_mistake_log/' . $zipfile, S3::ACL_PRIVATE)) {
//                 $flag = 1; //die('in putobject');
//             } else {
//                 sleep(10);
//                 if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote',  'files/design_plans_mistake_log/' . $zipfile, S3::ACL_PRIVATE))
//                     $flag = 1;
//                 //die('in putobject in 10');
//             }
//         } else {
//             // echo 'not moved';
//             // exit;
//         }
//     } catch (ErrorException $ex) {
//         //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
//         echo $ex->getLine();
//         return false;
//     }

//     $rem = $path . '/' .  basename($filename);
//     unlink($rem);
//     return $flag;
// }