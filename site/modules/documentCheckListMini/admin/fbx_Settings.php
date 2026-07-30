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

$MODULE_SINGULAR = 'Document Check List Mini';
$MODULE_PLURAL = 'Document Check Lists Mini';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id

$TABLE = 'admin_document_check_list_mini';
$ID = 'admin_doc_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions

$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['docDelete'] = $Fusebox['circuit'] . '.docDelete';