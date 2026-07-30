<?php
$tabledi = new Fw_Db_Table('design_interface_pricing_2');
$di_id = $fwRequest->getParam('di_id', '');
$dip_id = $fwRequest->getparam('dip_id', '');
$detail['dip_approved'] = $fwRequest->getparam('value', '');

		
	 $tabledi->setWhere("dip_id = ".$dip_id. " And di_id = ". $di_id);
			
	 if($tabledi->rowExists())
	 {
			$tabledi->updateRow($detail);
	 }
			


 exit;