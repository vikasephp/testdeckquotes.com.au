<?php
$tabledif = new Fw_Db_Table('design_interface_features');
$key = $fwRequest->getParam('key', 0);
$number = $fwRequest->getParam('number', 0);
$notes = $fwRequest->getParam('notes', 0);
$value = $fwRequest->getparam('value', '');
//$icon = $fwRequest->getparam('icon', '');
$kfid = $fwRequest->getParam('kfid', 0);

$feature = $fwRequest->getparam('feature', '');

if(!empty($key))
{
	$detail['dif_di_id'] = $key;
	$detail['dif_key_feature'] = $value;
	
	$sql_1 = "Select ic_icon_image from icon_list where ic_icon_name = '".$value ."'";	
	$data  = $fwDb -> queryOne($sql_1);
	if(!empty($data['ic_icon_image'])) {
		$detail['dif_icon_file'] = $data['ic_icon_image'];
	}
	$tabledif->insertRow($detail); 
	
	 //$tabledif->setWhere("dif_di_id = ".$key. " And dif_key_feature Like '".$value."'");
	 //if(!$tabledif->rowExists())
	 //{
			//$tabledif->insertRow($detail); 
	 //}
}


if(!empty($number))
{
	$detail['dif_di_id'] = $number;
	$detail['dif_number'] = $value;

    $sql = "Update design_interface_features set dif_number = ".$value ." where dif_key_feature Like '".$feature."' Order by dif_id DESC Limit 1 ";	 
	$fwDb -> queryOne($sql);
}

if(!empty($notes))
{
	$detail['dif_di_id'] = $notes;
	$detail['dif_notes'] = $value;
		
$sql = "Update design_interface_features set dif_notes = '".$value ."' where dif_key_feature Like '".$feature."' Order by dif_id DESC Limit 1 ";	 
$fwDb -> queryOne($sql);
}


if(!empty($kfid))
{
	$detail['dif_key_feature'] = $value;
	$sql_2 = "Select ic_icon_image from icon_list where ic_icon_name = '".$value ."'";	
	$data  = $fwDb -> queryOne($sql_2);
	$detail['dif_icon_file'] = $data['ic_icon_image'];
	
	
	$tabledif->setWhere("dif_id = ".$kfid);
	$tabledif->updateRow($detail); 
}
			

 exit;