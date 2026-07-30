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


if(!check_module()){ Location(BASE_URL."site.disable");}

// module names
$MODULE_SINGULAR = 'Comparable Market Analysis';
$MODULE_PLURAL = 'Comparable Market Analysis';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'cma';
$ID = 'c_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['upload'] = $Fusebox['circuit'] . '.upload';
$XFA['docdelete'] = $Fusebox['circuit'] . '.docdelete';
$XFA['view'] = $Fusebox['circuit'] . '.view';
$XFA['report'] = $Fusebox['circuit'] . '.report';
$XFA['doclist'] = $Fusebox['circuit'] . '.doclist';
$XFA['docdelete'] = $Fusebox['circuit'] . '.docdelete';
$XFA['disable'] = $Fusebox['circuit'] . '.disable';
$XFA['setting'] = $Fusebox['circuit'] . '.setting';


$tableStatus = new Fw_Db_Table('busness_status');
$tablelocation = new Fw_Db_Table('states');
//$tableindustry = new Fw_Db_Table('business_interest');
$tableindustry = new Fw_Db_Table('industry');


$tablelocation->setWhere("s_parent_state = '0' ");
$fwViewData['states'] = $tablelocation->getRows();
$fwViewData['status'] = $tableStatus->getRows();
//$tableindustry->setWhere("bi_parent = 0 ");
$fwViewData['industries'] = $tableindustry->getRows();

