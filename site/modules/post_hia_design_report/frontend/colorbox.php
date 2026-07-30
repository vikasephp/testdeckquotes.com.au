<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('post_hia_design_report');

$traffic['ph_tl_user'] = $_SESSION['user']['user_name'];
$traffic['ph_tl_date'] = date("d-m-Y");

$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$ph_id = $fwRequest->getParam('ph_id', 0);
$fwViewData['ph_id']= $ph_id;
if($green)
{
	$ph_id = $fwRequest->getParam('ph_id', '');
	
	$table->setWhere('ph_id = '.$ph_id);
	if($table->rowExists())
	{
		$traffic['ph_traffic_light'] = 1;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($orange)
{
	$ph_id = $fwRequest->getParam('ph_id', '');
	
	$table->setWhere('ph_id = '.$ph_id);
	if($table->rowExists())
	{
		$traffic['ph_traffic_light'] = 2;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($red)
{
	$ph_id = $fwRequest->getParam('ph_id', '');
	
	$table->setWhere('ph_id = '.$ph_id);
	if($table->rowExists())
	{
		$traffic['ph_traffic_light'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;


//
//$id = $fwRequest->getParam('wa_id', 0);
//
//if($id > 0)
//{
//
//$sql = "SELECT warranty_log_notes.*, users.user_name from warranty_log_notes 
//        inner join users on warranty_log_notes.wn_user =  users.user_id
//	where warranty_log_notes.wn_log_id = ".$id;	
//
//$fwViewData['notesData'] = $fwDb->query($sql);
//
//}