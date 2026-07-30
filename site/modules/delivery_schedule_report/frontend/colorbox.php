<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('delivery_schedule_report');

$traffic['ds_tl_user'] = $_SESSION['user']['user_name'];
$traffic['ds_tl_date'] = date("d-m-Y");

$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$ds_id = $fwRequest->getParam('ds_id', 0);
$fwViewData['ds_id']= $ds_id;
if($green)
{
	$ds_id = $fwRequest->getParam('ds_id', '');
	
	$table->setWhere('ds_id = '.$ds_id);
	if($table->rowExists())
	{
		$traffic['ds_traffic_light'] = 1;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($orange)
{
	$ds_id = $fwRequest->getParam('ds_id', '');
	
	$table->setWhere('ds_id = '.$ds_id);
	if($table->rowExists())
	{
		$traffic['ds_traffic_light'] = 2;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($red)
{
	$ds_id = $fwRequest->getParam('ds_id', '');
	
	$table->setWhere('ds_id = '.$ds_id);
	if($table->rowExists())
	{
		$traffic['ds_traffic_light'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;

