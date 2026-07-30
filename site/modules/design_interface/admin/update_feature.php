<?php
$tabledif = new Fw_Db_Table('design_interface_features');
//$di_id = $fwRequest->getParam('di_id', '');
$key = $fwRequest->getParam('key', 0);
$number = $fwRequest->getParam('number', 0);
$notes = $fwRequest->getParam('notes', 0);
$value = $fwRequest->getparam('value', '');

$feature = $fwRequest->getparam('feature', '');

if(!empty($key))
{
	$detail['dif_di_id'] = $key;
	$detail['dif_key_feature'] = $value;
	
	$tabledif->setWhere("dif_di_id = ".$key. " And dif_key_feature Like '".$value."'");
					
	 if(!$tabledif->rowExists())
	 {
			$tabledif->insertRow($detail); 
	 }
}

if(!empty($number))
{
	$detail['dif_di_id'] = $number;
	$detail['dif_number'] = $value;
	
	$tabledif->setWhere("dif_di_id = ".$number. " And dif_key_feature Like '".$feature."'");
					
	 if($tabledif->rowExists())
	 {
			$tabledif->updateRow($detail); 
	 }
}

if(!empty($notes))
{
	$detail['dif_di_id'] = $notes;
	$detail['dif_notes'] = $value;
	
	$tabledif->setWhere("dif_di_id = ".$notes. " And dif_key_feature Like '".$feature."'");
					
	 if($tabledif->rowExists())
	 {
			$tabledif->updateRow($detail); 
	 }
}

			

 exit;