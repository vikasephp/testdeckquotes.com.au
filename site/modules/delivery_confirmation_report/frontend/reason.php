<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('delivery_confirmation_report');
$dc_id = $fwRequest->getParam('dc_id', 0);
 
 
$reasondetail = $fwRequest->getParam('reasondetail', '');

$dc_id = $fwRequest->getParam('dc_id', 0);
$fwViewData['dc_id']= $dc_id;
if($reasondetail)
{
	$dc_id = $fwRequest->getParam('dc_id', '');
	$reasonData = $fwRequest->getParam('reason', '');
	
	
	$table->setWhere('dc_id = '.$dc_id);
	if($table->rowExists())
	{
		$reason['dc_traffic_light_reason'] = $reasonData;
		$detail = $table->updateRow($reason);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select delivery_confirmation_report.dc_traffic_light_reason   from  delivery_confirmation_report
	           where delivery_confirmation_report.dc_id = ".$dc_id;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['reasonData'] = $reasonData['dc_traffic_light_reason'];
	 
		 
 