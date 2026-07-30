<?php
$fwMainView = 'file:' . getcwd() . '/reason.tpl';
$table = new Fw_Db_Table('document_proposal_name');
$chk_no = $fwRequest->getParam('chk_no', 0);
 
$reasondetail = $fwRequest->getParam('reasondetail', '');

$chk_no = $fwRequest->getParam('chk_no', 0);
$fwViewData['chk_no']= $chk_no;
if($reasondetail)
{
	$chk_no = $fwRequest->getParam('chk_no', '');
	$reasonData = $fwRequest->getParam('reason', '');
	
	
	$table->setWhere('dpn_unique_id = '.$chk_no);
	if($table->rowExists())
	{
		$reason['dpn_dr_tl_reason'] = $reasonData;
		$detail = $table->updateRow($reason);
	}	
	$fwViewData['opr'] = "Close";	
}
 
 
     $sqlreason = "Select dpn_dr_tl_reason  from  document_proposal_name
	           where dpn_unique_id = ".$chk_no;
     
     $reasonData = $fwDb->queryOne($sqlreason);
	
     $fwViewData['reasonData'] = $reasonData['dpn_dr_tl_reason'];
	 
		 
 