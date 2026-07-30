<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('document_proposal_name');
$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', 0);
 
$reasondetail = $fwRequest->getParam('reasondetail', '');

$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', 0);
$fwViewData['dpn_unique_id']= $dpn_unique_id;
if($reasondetail)
{
	$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', '');
	$reasonData = $fwRequest->getParam('reason', '');
	
	$table->setWhere('dpn_unique_id = '.$dpn_unique_id);
	if($table->rowExists())
	{
		$reason['dpn_err_traffic_reason'] = $reasonData;
		$detail = $table->updateRow($reason);
	}	
	$fwViewData['opr'] = "Close";	
}
 
     $sqlreason = "Select dpn_err_traffic_reason   from  document_proposal_name
	           where dpn_unique_id = ".$dpn_unique_id;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['reasonData'] = $reasonData['dpn_err_traffic_reason'];
	 