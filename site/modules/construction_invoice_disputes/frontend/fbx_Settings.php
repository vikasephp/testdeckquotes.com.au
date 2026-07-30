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
$MODULE_SINGULAR = 'Construction Invoice Disputes';
$MODULE_PLURAL =   'Construction Invoice Disputes';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'construction_invoice_disputes';
$ID = 'ldd_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;
$DEFAULT_TYPE_ID = 6;
$fwViewData['DEFAULT_TYPE_ID'] = $DEFAULT_TYPE_ID;

$PPTABLE = 'pp_construction_invoice_disputes';
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
	'invoice_type' => [
		'name' => 'Invoice Type',
		'table' => 'construction_invoice_disputes_invoice_type',
		'id' => 'cidit_id',
		'option_col' => 'cidit_option',
		'add_file' => 'add_invoice_type.tpl',
		'add_fle_name' => 'add_invoice_type',
		'view_file' => 'view_invoice_type.tpl',
		'view_fle_name' => 'view_invoice_type',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_invoice_type',
		'delete_fle_name' => 'delete_invoice_type',
	],
	'status' => [
		'name' => 'Status',
		'table' => 'construction_invoice_disputes_status',
		'id' => 'cids_id',
		'option_col' => 'cids_option',
		'add_file' => 'add_status.tpl',
		'add_fle_name' => 'add_status',
		'view_file' => 'view_status.tpl',
		'view_fle_name' => 'view_status',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_status',
		'delete_fle_name' => 'delete_status',
	],
	'severity' => [
		'name' => 'Severity',
		'table' => 'construction_invoice_disputes_severity',
		'id' => 'cids_id',
		'option_col' => 'cids_option',
		'add_file' => 'add_severity.tpl',
		'add_fle_name' => 'add_severity',
		'view_file' => 'view_severity.tpl',
		'view_fle_name' => 'view_severity',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_severity',
		'delete_fle_name' => 'delete_severity',
	],
	'claim' => [
		'name' => 'Number of Claims',
		'table' => 'construction_invoice_disputes_claims',
		'id' => 'cids_id',
		'option_col' => 'cids_option',
		'add_file' => 'add_claim.tpl',
		'add_fle_name' => 'add_claim',
		'view_file' => 'view_claim.tpl',
		'view_fle_name' => 'view_claim',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_claim',
		'delete_fle_name' => 'delete_claim',
	],
	'manage' => [
		'name' => 'Who is Managing',
		'table' => 'construction_invoice_disputes_manages',
		'id' => 'cids_id',
		'option_col' => 'cids_option',
		'add_file' => 'add_manage.tpl',
		'add_fle_name' => 'add_manage',
		'view_file' => 'view_manage.tpl',
		'view_fle_name' => 'view_manage',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_manage',
		'delete_fle_name' => 'delete_manage',
	],
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

$BASEFOLDER = 'construction_invoice_disputes';
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