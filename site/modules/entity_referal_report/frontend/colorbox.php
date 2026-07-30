<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('document_proposal_name');

$traffic['dpn_err_traffic_light_user'] = $_SESSION['user']['user_name'];
$traffic['dpn_err_traffic_light_date'] = date("d-m-Y");

$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', 0);
$fwViewData['dpn_unique_id']= $bsn_id;
if($green)
{
	$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', '');
	
	$table->setWhere('dpn_unique_id = '.$dpn_unique_id);
	if($table->rowExists())
	{
		$traffic['dpn_err_traffic_light'] = 1;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($orange)
{
	$bsn_id = $fwRequest->getParam('dpn_unique_id', '');
	
	$table->setWhere('dpn_unique_id = '.$dpn_unique_id);
	if($table->rowExists())
	{
		$traffic['dpn_err_traffic_light'] = 2;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($red)
{
	$bsn_id = $fwRequest->getParam('dpn_unique_id', '');
	
	$table->setWhere('dpn_unique_id = '.$dpn_unique_id);
	if($table->rowExists())
	{
		$traffic['dpn_err_traffic_light'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}

$fwViewData['id']= $id;
