<?php
$tabledi = new Fw_Db_Table('design_interface_pricing');
$di_id = $fwRequest->getParam('di_id', '');
$dip_id = $fwRequest->getparam('dip_id', '');
$detail['dip_approved'] = $fwRequest->getparam('value', '');

		
	 $tabledi->setWhere("dip_id = ".$dip_id. " And di_id = ". $di_id);
			
	 if($tabledi->rowExists())
	 {
			$tabledi->updateRow($detail);
	 }
			


 //$answer = new Fw_Db_Table('dossier_answer');

// $answer->setWhere("bs_id = $business_id");
 
 //$detailAns = $answer->getRows();
 
 //$fwViewData['detailAns'] = $detailAns;

 //Location(BASE_URL . 'customer.dossier_questionaire/bs_id/'.$business_id.'/pagenum/'.$pagenum);
 exit;