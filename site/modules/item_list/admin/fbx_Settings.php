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
$MODULE_SINGULAR = 'Item List';
$MODULE_PLURAL = 'Item List';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'item_list';
$ID = 'il_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';

$ATTRIBUTES = [
	'category' => [
		'name' => 'Category',
		'table' => 'item_categories',
		'id' => 'ic_id',
		'option_col' => 'ic_name',
		'add_file' => 'add_category.tpl',
		'add_fle_name' => 'add_category',
		'view_file' => 'view_category.tpl',
		'view_fle_name' => 'view_category',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_category',
		'delete_fle_name' => 'delete_category',
	],
	'room' => [
		'name' => 'Room',
		'table' => 'pm_room',
		'id' => 'pmr_id',
		'option_col' => 'pmr_name',
		'add_file' => 'add_room.tpl',
		'add_fle_name' => 'add_room',
		'view_file' => 'view_room.tpl',
		'view_fle_name' => 'view_room',
		'view_url' => BASE_URL . $BASEFOLDER . '.view_room',
		'delete_fle_name' => 'delete_room',
	]
];
$fwViewData['ATTRIBUTES'] = $ATTRIBUTES;

$BASEFOLDER = 'itemAdmin';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;