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
$MODULE_SINGULAR = 'Buyer Enquiry Search';
$MODULE_PLURAL = 'Buyer Enquiry Searches';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'bus_customers';
$ID = 'bcust_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['deletecust'] = $Fusebox['circuit'] . '.deletecust';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['listdata'] = $Fusebox['circuit'] . '.listdata';
$XFA['detaildata'] = $Fusebox['circuit'] . '.detaildata';
$XFA['date'] = $Fusebox['circuit'] . '.date';
$XFA['sale'] = $Fusebox['circuit'] . '.sale';
$XFA['buyerenquiry_detail'] = $Fusebox['circuit'] . '.buyerenquiry_detail';
