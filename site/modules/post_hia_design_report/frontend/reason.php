<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('post_hia_design_report');
$ph_id = $fwRequest->getParam('ph_id', 0);
 
$reasondetail = $fwRequest->getParam('reasondetail', '');

$ph_id = $fwRequest->getParam('ph_id', 0);
$fwViewData['ph_id']= $ph_id;
if($reasondetail)
{
	$ph_id = $fwRequest->getParam('ph_id', '');
	$reasonData = $fwRequest->getParam('reason', '');
	
	
	$table->setWhere('ph_id = '.$ph_id);
	if($table->rowExists())
	{
		$reason['ph_tl_reason'] = $reasonData;
		$detail = $table->updateRow($reason);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select ph_tl_reason  from  post_hia_design_report
	           where ph_id = ".$ph_id;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['reasonData'] = $reasonData['ph_tl_reason'];
	 
		 
 