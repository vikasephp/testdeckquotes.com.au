<?php
$fwMainView = 'file:' . getcwd() . '/status_color.tpl';
$table= new Fw_Db_Table('delivery_schedule_status');

$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$st_id = $fwRequest->getParam('st_id', 0);
$fwViewData['st_id']= $st_id;
if($green)
{
	$st_id = $fwRequest->getParam('st_id', '');
	
	$table->setWhere('st_id = '.$st_id);
	if($table->rowExists())
	{
		$traffic['st_color'] = 1;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($orange)
{
	$st_id = $fwRequest->getParam('st_id', '');
	
	$table->setWhere('st_id = '.$st_id);
	if($table->rowExists())
	{
		$traffic['st_color'] = 2;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($red)
{
	$st_id = $fwRequest->getParam('st_id', '');
	
	$table->setWhere('st_id = '.$st_id);
	if($table->rowExists())
	{
		$traffic['st_color'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;

