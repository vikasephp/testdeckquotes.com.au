<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('30_days_rec_report');

$traffic['td_tl_user'] = $_SESSION['user']['user_name'];

$traffic['td_tl_date'] = date("d-m-Y");


$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$td_id = $fwRequest->getParam('td_id', 0);
$fwViewData['td_id']= $td_id;
if($green)
{
	$td_id = $fwRequest->getParam('td_id', '');
	
	$table->setWhere('td_id = '.$td_id);
	if($table->rowExists())
	{
		$traffic['td_traffic_light'] = 1;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($orange)
{
	$td_id = $fwRequest->getParam('td_id', '');
	
	$table->setWhere('td_id = '.$td_id);
	if($table->rowExists())
	{
		$traffic['td_traffic_light'] = 2;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($red)
{
	$td_id = $fwRequest->getParam('td_id', '');
	
	$table->setWhere('td_id = '.$td_id);
	if($table->rowExists())
	{
		$traffic['td_traffic_light'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;



$id = $fwRequest->getParam('td_id', 0);

if($id > 0)
{

$sql = "SELECT warranty_log_notes.*, users.user_name from warranty_log_notes 
        inner join users on warranty_log_notes.wn_user =  users.user_id
	where warranty_log_notes.wn_log_id = ".$id;	

$fwViewData['notesData'] = $fwDb->query($sql);

}