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
$MODULE_SINGULAR = 'Event Log Clearing Center';
$MODULE_PLURAL =   'Event Log Clearing Center';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'event_log_clearing_center';
$ID = 'elcc_id';
$fwViewData['TABLE'] = $TABLE;

$PPTABLE = 'pp_event_log_clearing_center';
$PPID = 'pelcc_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

$BASEFOLDER = 'event_log_clearing_center';
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