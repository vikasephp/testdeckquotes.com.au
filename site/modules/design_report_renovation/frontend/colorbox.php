<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('document_renovation_name');

$traffic['dpn_dr_tl_user'] = $_SESSION['user']['user_name'];
$traffic['dpn_dr_tl_date'] = date("d-m-Y");

$green = $fwRequest->getParam('green', '');
$orange = $fwRequest->getParam('orange', '');
$red = $fwRequest->getParam('red', '');
$chk_no = $fwRequest->getParam('chk_no', 0);
$fwViewData['chk_no']= $chk_no;
if($green)
{
	$chk_no = $fwRequest->getParam('chk_no', '');
	
	$table->setWhere('dpn_unique_id = '.$chk_no);
	if($table->rowExists())
	{
		$traffic['dpn_dr_traffic_light'] = 1;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($orange)
{
	$chk_no = $fwRequest->getParam('chk_no', '');
	
	$table->setWhere('dpn_unique_id = '.$chk_no);
	if($table->rowExists())
	{
		$traffic['dpn_dr_traffic_light'] = 2;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}
if($red)
{
	$chk_no = $fwRequest->getParam('chk_no', '');
	
	$table->setWhere('dpn_unique_id = '.$chk_no);
	if($table->rowExists())
	{
		$traffic['dpn_dr_traffic_light'] = 3;
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