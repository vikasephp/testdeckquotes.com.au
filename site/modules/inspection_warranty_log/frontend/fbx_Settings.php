<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/

require_once(MODULES_DIR . 'frontend.init.php');
require_once(MODULES_DIR . 'inspection_warranty_log/frontend/ServiceClass.php');
$fwAuthGroup->forceLogin();


// module names
$MODULE_SINGULAR = 'Inspection Warranty Log';
$MODULE_PLURAL = 'Inspection Warranty Logs';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
// $TABLE = 'inspection_warranty_log';
// $ID = 'iwl_id';
// $fwViewData['TABLE'] = $TABLE;
// $fwViewData['ID'] = $ID;

$PPTABLE = 'pp_inspection_warranty_log';
$PPID = 'pr_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

$BASEFOLDER = 'inspection_warranty_log';
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
$query = 'SELECT * FROM warranty_log_inspection_status WHERE wlis_active = 1;';
$result = $fwDb->query($query);
$fwViewData['warranty_log_inspection_status'] = $result;

$query = 'SELECT * FROM warranty_log_inspection_schedule_datetime ORDER BY wlisd_order ASC;';
$result = $fwDb->query($query);
$fwViewData['warranty_log_inspection_schedule_datetime'] = $result;

function upload($filename, $tmpname, $module)
{
	require_once(LIB_DIR . 'CloudEphpClass.php');
    $obj = new CloudEphpClass($module);
    return $obj->upload($filename, $tmpname);
}

function setInspectionDatetime($warrantyLog, $isHtml = true)
{
	$schedule = '';
	if($warrantyLog['wa_is_inspection_fee_required_scheduled_day'] && $warrantyLog['wa_is_inspection_fee_required_scheduled_date'] && $warrantyLog['wa_is_inspection_fee_required_scheduled_actual_start_time'] && $warrantyLog['wa_is_inspection_fee_required_scheduled_actual_end_time']) {
		$schedule = date('d F Y', strtotime($warrantyLog['wa_is_inspection_fee_required_scheduled_date']));
		$schedule .= ($isHtml ? '<br>' : ' ');
		$schedule .= ucfirst($warrantyLog['wa_is_inspection_fee_required_scheduled_day']) . ', ' . date('h:i A', strtotime($warrantyLog['wa_is_inspection_fee_required_scheduled_actual_start_time'])) . ' - ' . date('h:i A', strtotime($warrantyLog['wa_is_inspection_fee_required_scheduled_actual_end_time']));
	}
	return $schedule;
}
