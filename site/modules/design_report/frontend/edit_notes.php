<?php
$tabledif = new Fw_Db_Table('design_interface_features');
$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');

	$detail['dif_notes'] = $value;
	
	$tabledif->setWhere("dif_id = ".$id);
					
	 if($tabledif->rowExists())
	 {
			$tabledif->updateRow($detail); 
	 }

		

 exit;