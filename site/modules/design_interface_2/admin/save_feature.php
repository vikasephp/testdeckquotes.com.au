<?php
$tabledif = new Fw_Db_Table('design_interface_keyfeatures');

$value = $fwRequest->getparam('value', '');
$insert = $fwRequest->getparam('insert', '');
$id = $fwRequest->getparam('id', 0);

$fvalue = $fwRequest->getparam('fvalue', '');

if($insert)
{
	$detail['dik_keyfeature'] = '';
	$tabledif->insertRow($detail);	
}


if(!empty($value))
{
	//$tabledif->setWhere("dik_keyfeature = ''");
	//$detail['dik_keyfeature'] = $value;
	//$tabledif->updateRow($detail); 
	
	$sql = "Update design_interface_keyfeatures set dik_keyfeature = '".$value ."' Order by dik_id DESC Limit 1 ";	 
	$fwDb -> queryOne($sql);
	
}

if(!empty($id))
{
	$tabledif->setWhere("dik_id = ".$id);
	$detail['dik_keyfeature'] = $fvalue;
	$tabledif->updateRow($detail); 
}

			

 exit;