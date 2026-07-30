<?php
$tabledif = new Fw_Db_Table('design_interface_bfpl');
$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);
	$detail['dib_notes'] = $value;
	
	$tabledif->setWhere("dib_id  = ".$id);
					
	 if($tabledif->rowExists())
	 {
			$tabledif->updateRow($detail); 
	 }

		

 exit;