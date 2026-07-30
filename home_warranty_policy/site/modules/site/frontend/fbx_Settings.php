<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/

require_once(MODULES_DIR . 'frontend.init.php');

$XFA['force-download'] = 'site.force-download';
$XFA['disable'] = 'disable';


// module names
$MODULE_SINGULAR = 'Home Warranty Policy';
$MODULE_PLURAL =   'Home Warranty Policy';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'home_warranty_database';
$ID = 'hw_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;