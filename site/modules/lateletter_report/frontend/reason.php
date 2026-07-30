<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('work_in_progress_report');
 
$reason = $fwRequest->getParam('reasonsave', '');

$wp_id = $fwRequest->getParam('wp_id', 0);
$fwViewData['wp_id']= $wp_id;
if($reason)
{
	$wp_id = $fwRequest->getParam('wp_id', '');
	$reasonText = $fwRequest->getParam('reasontext', '');
	
	
	$table->setWhere("wp_id = $wp_id");
	if($table->rowExists())
	{
		$reasonDetail['wp_reason'] = $reasonText;
		
		$detail = $table->updateRow($reasonDetail);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select wp_reason  from  work_in_progress_report where wp_id = ".$wp_id;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['reasonData'] = $reasonData['wp_reason'];
	 