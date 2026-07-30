<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('delivery_confirmation_report');

$traffic['dc_traffic_light_user'] = $_SESSION['user']['user_name'];
$traffic['dc_traffic_light_date'] = date("d-m-Y");

$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$dc_id = $fwRequest->getParam('dc_id', 0);
$fwViewData['dc_id']= $dc_id;
if($green)
{
	$dc_id = $fwRequest->getParam('dc_id', '');
	
	$table->setWhere('dc_id = '.$dc_id);
	if($table->rowExists())
	{
		$traffic['dc_traffic_light'] = 1;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($orange)
{
	$dc_id = $fwRequest->getParam('dc_id', '');
	
	$table->setWhere('dc_id = '.$dc_id);
	if($table->rowExists())
	{
		$traffic['dc_traffic_light'] = 2;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($red)
{
	$dc_id = $fwRequest->getParam('dc_id', '');
	
	$table->setWhere('dc_id = '.$dc_id);
	if($table->rowExists())
	{
		$traffic['dc_traffic_light'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}

$fwViewData['id']= $id;