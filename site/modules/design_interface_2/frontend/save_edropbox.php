<?php
$tabledropbox =  new Fw_Db_Table('design_interface_edropbox_2');

$value = $fwRequest->getparam('value', '');
$row = $fwRequest->getParam('row', 0);
$di_id = $fwRequest->getParam('di_id', '');
$col = $fwRequest->getParam('col', 0);
$insert = $fwRequest->getparam('insert', '');
$fdv = $fwRequest->getparam('fdv', '');
$edf_value = $fwRequest->getparam('edf_value', '');
$qed_value = $fwRequest->getparam('qed_value', '');
$fp_value = $fwRequest->getparam('fp_value', '');

//$value = str_replace('=','\\', $value);

if($insert)
{
	$detail['didb_di_id'] = $di_id;
	$tabledropbox->insertRow($detail);	
}

if(!empty($value))
{
	$sql = "Update design_interface_edropbox_2 set didb_foldername  = '".$value ."' Order by didb_id DESC Limit 1 ";	 
	$fwDb -> queryOne($sql);
}

if(!empty($edf_value))
{
	$sql = "Update design_interface_edropbox_2 set didb_edf_available  = ".$edf_value ." where didb_foldername = '". $fdv ."'";	 
	$fwDb -> queryOne($sql);
}

if(!empty($qed_value))
{
	$sql = "Update design_interface_edropbox_2 set didb_qed  = ".$qed_value ." where didb_foldername = '". $fdv ."'";	 
	$fwDb -> queryOne($sql);
}

if(!empty($fp_value))
{
	
	//$fp_value2 = str_replace("=",'+', $fp_value);
	$sql = "Update design_interface_edropbox_2 set didb_filepath  = '".$fp_value ."' where didb_foldername = '". $fdv ."'";	 
	$fwDb -> queryOne($sql);
}




 exit;