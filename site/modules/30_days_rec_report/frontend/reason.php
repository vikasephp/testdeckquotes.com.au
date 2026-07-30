<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('30_days_rec_report');
$td_id = $fwRequest->getParam('td_id', 0);
 
 
$reasondetail = $fwRequest->getParam('reasondetail', '');

$td_id = $fwRequest->getParam('td_id', 0);
$fwViewData['td_id']= $td_id;
if($reasondetail)
{
	$td_id = $fwRequest->getParam('td_id', '');
	$reasonData = $fwRequest->getParam('reason', '');
	
	
	$table->setWhere('td_id = '.$td_id);
	if($table->rowExists())
	{
		$reason['td_tl_reason'] = $reasonData;
		$detail = $table->updateRow($reason);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select 30_days_rec_report.td_tl_reason   from  30_days_rec_report
	           where 30_days_rec_report.td_id = ".$td_id;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['reasonData'] = $reasonData['td_tl_reason'];
	 
		 
 