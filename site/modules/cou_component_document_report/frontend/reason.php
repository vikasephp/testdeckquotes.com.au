<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('business_sellers');
$bsn_id = $fwRequest->getParam('bsn_id', 0);
 
 
$reasondetail = $fwRequest->getParam('reasondetail', '');

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id']= $bsn_id;
if($reasondetail)
{
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	$reasonData = $fwRequest->getParam('reason', '');
	
	
	$table->setWhere('bs_business_id = '.$bsn_id);
	if($table->rowExists())
	{
		$reason['bs_cou_tl_reason'] = $reasonData;
		$detail = $table->updateRow($reason);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select business_sellers.bs_cou_tl_reason   from  business_sellers
	           where business_sellers.bs_business_id = ".$bsn_id;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['reasonData'] = $reasonData['bs_cou_tl_reason'];
	 
		 
 