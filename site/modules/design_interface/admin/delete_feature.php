<?php

$value = $fwRequest->getparam('value', '');
$id = $fwRequest->getparam('id', 0);

    $thisTable = new Fw_Db_Table('design_interface_keyfeatures');
	
	if(!empty($value))
	{
    $thisTable->setWhere("dik_keyfeature = '". $value. "'");
    $thisTable->deleteRow();
	}
	
	if(!empty($id))
	{
    $thisTable->setWhere("dik_id = ". $id);
    $thisTable->deleteRow();
	}
	

exit;

//Location(BASE_URL . $XFA['detail'].'/bst_id/'. $bst_id);