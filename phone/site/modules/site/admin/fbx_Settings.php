<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/

require_once(MODULES_DIR . 'admin.init.php');

// force login
$fwAuthGroup->_options['redirect'] = 'admin.home';
$fwAuthGroup->requireAtLeast('Administrators', 'QA');

// fuseactions
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['changePassword'] = $Fusebox['circuit'] . '.changePassword';
$XFA['images'] = $Fusebox['circuit'] . '.images';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';