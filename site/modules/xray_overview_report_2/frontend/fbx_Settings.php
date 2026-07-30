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
$MODULE_SINGULAR = 'XRay Overview Report 2.0';
$MODULE_PLURAL = 'XRay Overview Report 2.0';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;


$PPTABLE = 'pp_weekly_turnover_report';
$PPID = 'pr_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

$BASEFOLDER = 'xray_overview_report_2';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['home'] = $Fusebox['circuit'] . '.home';

$ATTRIBUTES = [
	'status' => [
		'name' => 'Status',
		'table' => 'warranty_log_inspection_status',
		'id' => 'wlis_id',
		'option_col' => 'wlis_option',
		'foreign_id' => 'wa_wlis_id',
		'add_file' => 'add_inspection_status.tpl',
		'add_file_name' => 'add_inspection_status',
		'view_file' => 'view_inspection_status.tpl',
		'view_file_name' => 'view_inspection_status',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_inspection_status',
		'delete_file_name' => 'delete_inspection_status',
	],
	'schedule_datetime' => [
		'name' => 'Schedule Datetime',
		'table' => 'warranty_log_inspection_schedule_datetime',
		'id' => 'wlisd_id',
		'option_col' => 'wlisd_option',
		'foreign_id' => 'wa_is_inspection_fee_required_scheduled',
		'add_file' => 'add_schedule_datetime.tpl',
		'add_file_name' => 'add_schedule_datetime',
		'view_file' => 'view_schedule_datetime.tpl',
		'view_file_name' => 'view_schedule_datetime',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_schedule_datetime',
		'delete_file_name' => 'delete_schedule_datetime',
	],
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

// $query = 'SELECT * FROM warranty_log_inspection_status ORDER BY wlis_option ASC;';
// $query = 'SELECT * FROM warranty_log_inspection_status;';
// $result = $fwDb->query($query);
// $fwViewData['warranty_log_inspection_status'] = $result;

// $query = 'SELECT * FROM warranty_log_inspection_schedule_datetime ORDER BY wlisd_order ASC;';
// $result = $fwDb->query($query);
// $fwViewData['warranty_log_inspection_schedule_datetime'] = $result;

function upload($filename, $tmpname, $module)
{
	require_once(LIB_DIR . 'CloudEphpClass.php');
    $obj = new CloudEphpClass($module);
    return $obj->upload($filename, $tmpname);
}
