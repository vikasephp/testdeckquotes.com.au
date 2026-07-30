<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('business_sellers');

$traffic['bs_tl_user_incl'] = $_SESSION['user']['user_name'];

$traffic['bs_tl_date_incl'] = date("d-m-Y");

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
		$traffic['bs_traffic_light_incl'] = 1;
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
		$traffic['bs_traffic_light_incl'] = 2;
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
		$traffic['bs_traffic_light_incl'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;



$id = $fwRequest->getParam('wa_id', 0);

if($id > 0)
{

$sql = "SELECT warranty_log_notes.*, users.user_name from warranty_log_notes 
        inner join users on warranty_log_notes.wn_user =  users.user_id
	where warranty_log_notes.wn_log_id = ".$id;	

$fwViewData['notesData'] = $fwDb->query($sql);

}