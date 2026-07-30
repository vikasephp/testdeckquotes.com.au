<?php
$table = new Fw_Db_Table('construction_schedular_assignto');

$value = $fwRequest->getparam('value', '');
$insert = $fwRequest->getparam('insert', '');
$id = $fwRequest->getparam('id', 0);

$fvalue = $fwRequest->getparam('fvalue', '');

$value = str_replace("%20", ' ',$value);

if($insert)
{
	
	$detail['at_assign_to'] = '';
	$detail['at_cs_id'] = $id;
	$table->insertRow($detail);	
}


if(!empty($value))
{
	//$tabledif->setWhere("dik_keyfeature = ''");
	//$detail['dik_keyfeature'] = $value;
	//$tabledif->updateRow($detail); 
	
	$sql = "Update construction_schedular_assignto set at_assign_to = '".$value ."' where  ";	 
	$fwDb -> queryOne($sql);
	
}

//if(!empty($id))
//{
//	$tabledif->setWhere("dik_id = ".$id);
//	$detail['dik_keyfeature'] = $fvalue;
//	$tabledif->updateRow($detail); 
//}

			

 exit;