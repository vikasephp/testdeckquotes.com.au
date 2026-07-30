<?php
$fwMainView = 'file:' . getcwd() . '/audit_link.tpl';
$table = new Fw_Db_Table('design_interface');
$di_id = $fwRequest->getParam('di_id', 0);
 
$mtdetail = $fwRequest->getParam('mtdetail', '');

$di_id = $fwRequest->getParam('di_id', 0);
$fwViewData['di_id']= $di_id;
if($mtdetail)
{
	$di_id = $fwRequest->getParam('di_id', '');
	$mtData = $fwRequest->getParam('audit_link', '');
	
	
	$table->setWhere('di_id = '.$di_id);
	if($table->rowExists())
	{
		$master['di_pricing_audit_link'] = $mtData;
		$detail = $table->updateRow($master);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select design_interface.di_pricing_audit_link from  design_interface
	           where design_interface.di_id = ".$di_id;
     
     $mtData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['mtData'] = $mtData['di_pricing_audit_link'];
	 
		 
 