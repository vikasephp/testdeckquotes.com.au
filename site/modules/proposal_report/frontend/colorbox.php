<?php
$fwMainView = 'file:' . getcwd() . '/colorbox.tpl';
$table= new Fw_Db_Table('document_proposal_name');

$traffic['dpn_pcp_tl_user'] = $_SESSION['user']['user_name'];
$traffic['dpn_pcp_tl_date'] = date("d-m-Y");

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
		$traffic['dpn_pcp_trafic_light'] = 1;
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
		$traffic['dpn_pcp_trafic_light'] = 2;
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
		$traffic['dpn_pcp_trafic_light'] = 3;
		$detail = $table->updateRow($traffic);
	}	
	$fwViewData['opr'] = "Close";	
}


$fwViewData['id']= $id;

