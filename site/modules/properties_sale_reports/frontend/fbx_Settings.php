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
$MODULE_SINGULAR = 'Property for Sale Report';
$MODULE_PLURAL =   'Properties for Sale Report';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'property_sale_project_tracker';
$ID = 'ps_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

$PPTABLE = 'pp_properties_sale_reports';
$PPID = 'pr_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

// FOR ADMIN OPTIONS
$ATTRIBUTES = [
	'manage_stage' => [
		'name' => 'Stage',
		'table' => 'property_sale_project_stage',
		'id' => 'st_id',
		'option_col' => 'st_option',
		'add_file' => 'add_stage.tpl',
		'add_fle_name' => 'add_stage',
		'view_file' => 'view_stage.tpl',
		'view_fle_name' => 'view_stage',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_stage',
		'delete_fle_name' => 'delete_stage',
	],
	'invoice_type' => [
		'name' => 'Invoice Type',
		'table' => 'properties_sale_reports_invoice_type',
		'id' => 'psrit_id',
		'option_col' => 'psrit_option',
		'add_file' => 'add_invoice_type.tpl',
		'add_fle_name' => 'add_invoice_type',
		'view_file' => 'view_invoice_type.tpl',
		'view_fle_name' => 'view_invoice_type',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_invoice_type',
		'delete_fle_name' => 'delete_invoice_type',
	],
	'lead_conversion_task_list' => [
		'name' => 'Lead Conversion Task List',
		'table' => 'properties_sale_reports_lead_conversion_task_list',
		'id' => 'psrlctl_uid',
		'seq' => 'psrlctl_sequence',
		'procedure_link' => 'psrlctl_procedure_link',
		'task_description' => 'psrlctl_task_description',
		'person_responsible' => 'psrlctl_person_responsible',
		'add_file' => 'add_lead_conversion_task_list.tpl',
		'add_fle_name' => 'add_lead_conversion_task_list',
		'view_file' => 'view_lead_conversion_task_list.tpl',
		'view_fle_name' => 'view_lead_conversion_task_list',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_lead_conversion_task_list',
		'delete_fle_name' => 'delete_lead_conversion_task_list',
	],
	'lead_conversion_task_list_specific' => [
		'name' => 'Lead Conversion Task List',
		'table' => 'properties_sale_reports_lead_conversion_task_list',
		'id' => 'psrlctl_uid',
		'seq' => 'psrlctl_sequence',
		'procedure_link' => 'psrlctl_procedure_link',
		'task_description' => 'psrlctl_task_description',
		'person_responsible' => 'psrlctl_person_responsible',
		'add_file' => 'add_lead_conversion_task_list_specific.tpl',
		'add_fle_name' => 'add_lead_conversion_task_list_specific',
		'view_file' => 'view_lead_conversion_task_list_specific.tpl',
		'view_fle_name' => 'view_lead_conversion_task_list_specific',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_lead_conversion_task_list_specific',
		'delete_fle_name' => 'delete_lead_conversion_task_list_specific',
	],
	'prep_market_task_list' => [
		'name' => 'Preparing for Market Task List',
		'table' => 'properties_sale_reports_prep_market_task_list',
		'id' => 'psrpmtl_uid',
		'seq' => 'psrpmtl_sequence',
		'procedure_link' => 'psrpmtl_procedure_link',
		'task_description' => 'psrpmtl_task_description',
		'person_responsible' => 'psrpmtl_person_responsible',
		'add_file' => 'add_prep_market_task_list.tpl',
		'add_fle_name' => 'add_prep_market_task_list',
		'view_file' => 'view_prep_market_task_list.tpl',
		'view_fle_name' => 'view_prep_market_task_list',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_prep_market_task_list',
		'delete_fle_name' => 'delete_prep_market_task_list',
	],
	'prep_market_task_list_specific' => [
		'name' => 'Preparing for Market Task List',
		'table' => 'properties_sale_reports_prep_market_task_list',
		'id' => 'psrpmtl_uid',
		'seq' => 'psrpmtl_sequence',
		'procedure_link' => 'psrpmtl_procedure_link',
		'task_description' => 'psrpmtl_task_description',
		'person_responsible' => 'psrpmtl_person_responsible',
		'add_file' => 'add_prep_market_task_list_specific.tpl',
		'add_fle_name' => 'add_prep_market_task_list_specific',
		'view_file' => 'view_prep_market_task_list_specific.tpl',
		'view_fle_name' => 'view_prep_market_task_list_specific',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_prep_market_task_list_specific',
		'delete_fle_name' => 'delete_prep_market_task_list_specific',
	],
	'prop_sale_task_list' => [
		'name' => 'Property for Sale Task List',
		'table' => 'properties_sale_reports_prop_sale_task_list',
		'id' => 'psrpstl_uid',
		'seq' => 'psrpstl_sequence',
		'procedure_link' => 'psrpstl_procedure_link',
		'task_description' => 'psrpstl_task_description',
		'person_responsible' => 'psrpstl_person_responsible',
		'add_file' => 'add_prop_sale_task_list.tpl',
		'add_fle_name' => 'add_prop_sale_task_list',
		'view_file' => 'view_prop_sale_task_list.tpl',
		'view_fle_name' => 'view_prop_sale_task_list',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_prop_sale_task_list',
		'delete_fle_name' => 'delete_prop_sale_task_list',
	],
	'prop_sale_task_list_specific' => [
		'name' => 'Property for Sale Task List',
		'table' => 'properties_sale_reports_prop_sale_task_list',
		'id' => 'psrpstl_uid',
		'seq' => 'psrpstl_sequence',
		'procedure_link' => 'psrpstl_procedure_link',
		'task_description' => 'psrpstl_task_description',
		'person_responsible' => 'psrpstl_person_responsible',
		'add_file' => 'add_prop_sale_task_list_specific.tpl',
		'add_fle_name' => 'add_prop_sale_task_list_specific',
		'view_file' => 'view_prop_sale_task_list_specific.tpl',
		'view_fle_name' => 'view_prop_sale_task_list_specific',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_prop_sale_task_list_specific',
		'delete_fle_name' => 'delete_prop_sale_task_list_specific',
	],
	'exchange_task_list' => [
		'name' => 'Exchange Task List',
		'table' => 'properties_sale_reports_exchange_task_list',
		'id' => 'psretl_uid',
		'seq' => 'psretl_sequence',
		'procedure_link' => 'psretl_procedure_link',
		'task_description' => 'psretl_task_description',
		'person_responsible' => 'psretl_person_responsible',
		'add_file' => 'add_exchange_task_list.tpl',
		'add_fle_name' => 'add_exchange_task_list',
		'view_file' => 'view_exchange_task_list.tpl',
		'view_fle_name' => 'view_exchange_task_list',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_exchange_task_list',
		'delete_fle_name' => 'delete_exchange_task_list',
	],
	'exchange_task_list_specific' => [
		'name' => 'Exchange Task List',
		'table' => 'properties_sale_reports_exchange_task_list',
		'id' => 'psretl_uid',
		'seq' => 'psretl_sequence',
		'procedure_link' => 'psretl_procedure_link',
		'task_description' => 'psretl_task_description',
		'person_responsible' => 'psretl_person_responsible',
		'add_file' => 'add_exchange_task_list_specific.tpl',
		'add_fle_name' => 'add_exchange_task_list_specific',
		'view_file' => 'view_exchange_task_list_specific.tpl',
		'view_fle_name' => 'view_exchange_task_list_specific',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_exchange_task_list_specific',
		'delete_fle_name' => 'delete_exchange_task_list_specific',
	],
	'post_settlement_task_list' => [
		'name' => 'Post Settlement Task List',
		'table' => 'properties_sale_reports_post_settlement_task_list',
		'id' => 'psrpstl_uid',
		'seq' => 'psrpstl_sequence',
		'procedure_link' => 'psrpstl_procedure_link',
		'task_description' => 'psrpstl_task_description',
		'person_responsible' => 'psrpstl_person_responsible',
		'add_file' => 'add_post_settlement_task_list.tpl',
		'add_fle_name' => 'add_post_settlement_task_list',
		'view_file' => 'view_post_settlement_task_list.tpl',
		'view_fle_name' => 'view_post_settlement_task_list',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_post_settlement_task_list',
		'delete_fle_name' => 'delete_post_settlement_task_list',
	],
	'post_settlement_task_list_specific' => [
		'name' => 'Post Settlement Task List',
		'table' => 'properties_sale_reports_post_settlement_task_list',
		'id' => 'psrpstl_uid',
		'seq' => 'psrpstl_sequence',
		'procedure_link' => 'psrpstl_procedure_link',
		'task_description' => 'psrpstl_task_description',
		'person_responsible' => 'psrpstl_person_responsible',
		'add_file' => 'add_post_settlement_task_list_specific.tpl',
		'add_fle_name' => 'add_post_settlement_task_list_specific',
		'view_file' => 'view_post_settlement_task_list_specific.tpl',
		'view_fle_name' => 'view_post_settlement_task_list_specific',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_post_settlement_task_list_specific',
		'delete_fle_name' => 'delete_post_settlement_task_list_specific',
	],
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

$BASEFOLDER = 'properties_sale_reports';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';

$query = 'SELECT bsn_id, bsn_name FROM business';
$result = $fwDb->query($query);
$businessData = [];
foreach($result as $row) {
    $businessData[$row['bsn_id']] = $row;
}
$fwViewData['businessData'] = $businessData;

$query = "SELECT * FROM property_sale_project_stage";
$fwViewData['stageData'] = $fwDb->query($query);

function upload_public_doc($filename, $tmpname, $module = 'business.home')
{
    require_once(LIB_DIR . 'CloudEphpClass.php');
    $obj = new CloudEphpClass($module);
    return $obj->upload($filename, $tmpname);
}

function get_file_raw_data($folder_path, $object_name)
{
    $filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
    include_once $filetoinclude;
    $bucket_name = "deckquote";

    $s3 = new S3(ACCESS_KEY, SECRET_KEY);
    try {

        $file_data = $s3->getObject($bucket_name, $folder_path . $object_name, false );
        if (empty($file_data) || !isset($file_data->body)) {
            return false;
        }
        $file_raw_data = $file_data->body;
        $downloadPath = $_SERVER['DOCUMENT_ROOT'] . '/download_files/';

        if (!is_dir($downloadPath)) {
            mkdir($downloadPath, 0777, true);
        }

        $file = basename($object_name);
        $filePath = $downloadPath . $file;

        if (file_put_contents($filePath, $file_raw_data) === false) {
            return false;
        }

        return $filePath;

    } catch (ErrorException $ex) {

        echo $ex->getMessage();
        return false;
    }
}