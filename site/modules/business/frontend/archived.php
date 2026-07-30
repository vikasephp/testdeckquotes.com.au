<?php
$fwMainView = 'file:' . getcwd() . '/archived.tpl';
$tableTask = new Fw_Db_Table('procedure_panel_30day');

$bus_id = (int)$fwRequest->getParam('bus_id', 0);
$dpn_proposal_number = (int)$fwRequest->getParam('dpn_pn', 0);
db($dpn_proposal_number);

$fwViewData['un'] = (int)$fwRequest->getParam('un', 0);

$sql = "select dpn_unique_id from document_proposal_name where dpn_bsn_id = ".$bus_id. " And dpn_proposal_number = ".$dpn_proposal_number;
$data = $fwDb->queryOne($sql);

 $fwViewData['dpn_unique_id'] = $data['dpn_unique_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
   
    $un = (int)$fwRequest->getParam('un', 0);
	
	if(!empty($un)) {
	
    	$sqlAr = "Update  document_proposal_name 
	             set dpn_archived = 0  where dpn_bsn_id = ".$bus_id. " And dpn_proposal_number = ".$dpn_proposal_number;
				 $fwViewData['msg']  = "This checklist has been UN Archived"; 
	} else {
		
		$sqlAr = "Update  document_proposal_name 
	             set dpn_archived = 1  where dpn_bsn_id = ".$bus_id. " And dpn_proposal_number = ".$dpn_proposal_number;
				 $fwViewData['msg']  = "This checklist has been archived"; 
	}
			  
    $id= $fwDb->queryOne($sqlAr);
    
    		
	
		
	
}

