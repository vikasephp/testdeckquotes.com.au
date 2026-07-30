<?php
$tabledcl = new Fw_Db_Table('document_check_list');
$bsn_id = $fwRequest->getParam('bsn_id', '');
$doc_id = $fwRequest->getparam('doc_id', '');
$detail['doc_not_required'] = $fwRequest->getparam('value', '');

		
	 $tabledcl->setWhere("doc_bsn_id = ".$bsn_id. " And doc_id = ". $doc_id);
			
	 if($tabledcl->rowExists())
	 {
			$tabledcl->updateRow($detail);
	 }
			


 //$answer = new Fw_Db_Table('dossier_answer');

// $answer->setWhere("bs_id = $business_id");
 
 //$detailAns = $answer->getRows();
 
 //$fwViewData['detailAns'] = $detailAns;

 //Location(BASE_URL . 'customer.dossier_questionaire/bs_id/'.$business_id.'/pagenum/'.$pagenum);
 exit;