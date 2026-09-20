<?php
$tableprd = new Fw_Db_Table('person_responsible_detail');
$prd_id = $fwRequest->getParam('prd_id', '');
$detail['prd_name'] = $fwRequest->getParam('value', '');

			 
			  $tableprd->setWhere("prd_id = " .$prd_id);
			 
			
			 if($tableprd->rowExists())
			 {
					$tableprd->updateRow($detail);
			 }
			 



// $answer = new Fw_Db_Table('dossier_answer');
//
// $answer->setWhere("bs_id = $business_id");
// 
// $detailAns = $answer->getRows();
// 
// $fwViewData['detailAns'] = $detailAns;
//
// Location(BASE_URL . 'customer.dossier_questionaire/bs_id/'.$business_id.'/pagenum/'.$pagenum);
 exit;