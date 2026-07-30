<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('business_sellers');

$traffic['bs_cou_tl_user'] = $_SESSION['user']['user_name'];
$traffic['bs_cou_tl_date'] = date("d-m-Y");


$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$bsn_id = $fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id']= $bsn_id;
if($green)
{
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	
	$table->setWhere('bs_business_id = '.$bsn_id);
	if($table->rowExists())
	{
		$traffic['bs_cou_traffic_light'] = 1;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($orange)
{
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	
	$table->setWhere('bs_business_id = '.$bsn_id);
	if($table->rowExists())
	{
		$traffic['bs_cou_traffic_light'] = 2;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($red)
{
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	
	$table->setWhere('bs_business_id = '.$bsn_id);
	if($table->rowExists())
	{
		$traffic['bs_cou_traffic_light'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;


