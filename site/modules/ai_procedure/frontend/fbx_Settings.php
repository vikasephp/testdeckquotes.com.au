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
$MODULE_SINGULAR = 'AI PROCEDURE IN PROGRESS';
$MODULE_PLURAL =   'AI PROCEDURE IN PROGRESS';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'template_docs';
$ID = 'dh_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

$BASEFOLDER = 'ai_procedure';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['replay'] = $Fusebox['circuit'] . '.replay';

$XFA['add_steps']  = $Fusebox['circuit'] . '.add_steps';
$XFA['edit_steps'] = $Fusebox['circuit'] . '.edit_steps';