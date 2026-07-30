<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('delivery_schedule_report');
$ds_id = $fwRequest->getParam('ds_id', 0);
  
$reasondetail = $fwRequest->getParam('reasondetail', '');

$ds_id = $fwRequest->getParam('ds_id', 0);
$fwViewData['ds_id']= $ds_id;
if($reasondetail)
{
	$ds_id = $fwRequest->getParam('ds_id', '');
	$reasonData = $fwRequest->getParam('reason', '');
	
	
	$table->setWhere('ds_id = '.$ds_id);
	if($table->rowExists())
	{
		$reason['ds_reason'] = $reasonData;
		$detail = $table->updateRow($reason);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select delivery_schedule_report.ds_reason  from delivery_schedule_report
	           where delivery_schedule_report.ds_id = ".$ds_id;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['reasonData'] = $reasonData['ds_reason'];
	 
		 
 