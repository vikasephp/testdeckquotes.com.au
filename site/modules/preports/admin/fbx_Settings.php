<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/

require_once(MODULES_DIR . 'admin.init.php');

// module names
$MODULE_SINGULAR = 'Production Report';
$MODULE_PLURAL = 'Production Reports';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;


// module table and id
$TABLE = 'user_reports';
$ID = 'ur_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;
// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['buslist'] = $Fusebox['circuit'] . '.buslist';