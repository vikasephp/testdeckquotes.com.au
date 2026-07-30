<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/

require_once(MODULES_DIR . 'frontend.init.php');

// module table and id
$TABLE = 'bus_enquires';
$ID = 'be_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['summary_list'] = $Fusebox['circuit'] . '.summary_list';
$XFA['detail_list'] = $Fusebox['circuit'] . '.detail_list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['property'] = $Fusebox['circuit'] . '.property';
$XFA['agent'] = $Fusebox['circuit'] . '.agent';
$XFA['search'] = $Fusebox['circuit'] . '.search';
$XFA['regional'] = $Fusebox['circuit'] . '.regional';
$XFA['welcome'] = $Fusebox['circuit'] . '.welcome';
$XFA['profile'] = $Fusebox['circuit'] . '.profile';

