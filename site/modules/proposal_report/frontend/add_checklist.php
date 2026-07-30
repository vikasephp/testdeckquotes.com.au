<?php
$fwMainView = 'file:' . getcwd() . '/add_checklist.tpl';
$tabledpn = new Fw_Db_Table('document_proposal_name');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $chkno = $fwRequest->getParam('chkno', 0);
    $detail['dpn_pcp_show'] = 1;
	
    if($chkno > 0)
    	{
       		 $tabledpn->setWhere("dpn_unique_id = $chkno");
	     	 $opr = $tabledpn->updateRow($detail);   
    	}
		 	
	    	 $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}
	

$sql = "Select  dpn_unique_id from document_proposal_name order by dpn_unique_id";
$fwViewData['chkdata'] = $fwDb->query($sql);


