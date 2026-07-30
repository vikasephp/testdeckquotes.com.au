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
$MODULE_SINGULAR = 'Our Claims';
$MODULE_PLURAL =   'Our Claims';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'legal_dispute_database';
$ID = 'ldd_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;
$DEFAULT_TYPE_ID = 6;
$fwViewData['DEFAULT_TYPE_ID'] = $DEFAULT_TYPE_ID;

$PPTABLE = 'pp_our_claims';
$PPID = 'pr_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

// FOR ADMIN OPTIONS
$ATTRIBUTES = [
	'type' => [
		'name' => 'Type',
		'table' => 'legal_dispute_database_type',
		'id' => 'lddt_id',
		'option_col' => 'lddt_option',
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
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

$BASEFOLDER = 'our_claims';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['add_new'] = $Fusebox['circuit'] . '.add_new';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';