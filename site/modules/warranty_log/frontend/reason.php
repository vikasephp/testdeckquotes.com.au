<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('warranty_log');
$wa_id = $fwRequest->getParam('wa_id', 0);
 
 
$reasondetail = $fwRequest->getParam('reasondetail', '');

$wa_id = $fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id']= $wa_id;
if($reasondetail)
{
	$wa_id = $fwRequest->getParam('wa_id', '');
	$reasonData = $fwRequest->getParam('reason', '');
	
	
	$table->setWhere('wa_id = '.$wa_id);
	if($table->rowExists())
	{
		$reason['wa_tl_reason'] = $reasonData;
		$detail = $table->updateRow($reason);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select warranty_log.wa_tl_reason   from  warranty_log where warranty_log.wa_id = ".$wa_id;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['reasonData'] = $reasonData['wa_tl_reason'];
	 
		 
 