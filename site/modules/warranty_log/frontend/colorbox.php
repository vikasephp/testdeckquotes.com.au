<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('warranty_log');

$traffic['wa_tl_user'] = $_SESSION['user']['user_name'];

$traffic['wa_tl_date'] = date("d-m-Y");

$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$wa_id = $fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id']= $wa_id;
if($green)
{
	$wa_id = $fwRequest->getParam('wa_id', '');
	
	$table->setWhere('wa_id = '.$wa_id);
	if($table->rowExists())
	{
		$traffic['wa_tl'] = 1;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($orange)
{
	$wa_id = $fwRequest->getParam('wa_id', '');
	
	$table->setWhere('wa_id = '.$wa_id);
	if($table->rowExists())
	{
		$traffic['wa_tl'] = 2;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($red)
{
	$wa_id = $fwRequest->getParam('wa_id', '');
	
	$table->setWhere('wa_id = '.$wa_id);
	if($table->rowExists())
	{
		$traffic['wa_tl'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;
