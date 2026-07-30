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
	'stage' => [
		'name' => 'Stage',
		'table' => 'property_sale_project_stage',
		'id' => 'st_id',
		'option_col' => 'st_option',
		'add_file' => 'add_type.tpl',
		'add_fle_name' => 'add_type',
		'view_file' => 'view_type.tpl',
		'view_fle_name' => 'view_type',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_type',
		'delete_fle_name' => 'delete_type',
	],
	'status' => [
		'name' => 'Status',
		'table' => 'legal_dispute_database_status',
		'id' => 'ldds_id',
		'option_col' => 'ldds_option',
		'add_file' => 'add_status.tpl',
		'add_fle_name' => 'add_status',
		'view_file' => 'view_status.tpl',
		'view_fle_name' => 'view_status',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_status',
		'delete_fle_name' => 'delete_status',
	],
	'severity' => [
		'name' => 'Severity',
		'table' => 'legal_dispute_database_severity',
		'id' => 'lddse_id',
		'option_col' => 'lddse_option',
		'add_file' => 'add_severity.tpl',
		'add_fle_name' => 'add_severity',
		'view_file' => 'view_severity.tpl',
		'view_fle_name' => 'view_severity',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_severity',
		'delete_fle_name' => 'delete_severity',
	],
	'claim' => [
		'name' => 'Number of Claims',
		'table' => 'legal_dispute_database_claims',
		'id' => 'lddc_id',
		'option_col' => 'lddc_option',
		'add_file' => 'add_claim.tpl',
		'add_fle_name' => 'add_claim',
		'view_file' => 'view_claim.tpl',
		'view_fle_name' => 'view_claim',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_claim',
		'delete_fle_name' => 'delete_claim',
	],
	'manage' => [
		'name' => 'Who is Managing',
		'table' => 'legal_dispute_database_manages',
		'id' => 'lddm_id',
		'option_col' => 'lddm_option',
		'add_file' => 'add_manage.tpl',
		'add_fle_name' => 'add_manage',
		'view_file' => 'view_manage.tpl',
		'view_fle_name' => 'view_manage',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_manage',
		'delete_fle_name' => 'delete_manage',
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