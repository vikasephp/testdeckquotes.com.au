<?php
$tabledi = new Fw_Db_Table('design_interface');
$di_id = $fwRequest->getParam('di_id', '');
$detail['di_price_approved'] = $fwRequest->getparam('value', '');

		
	 $tabledi->setWhere("di_id = ".$di_id);
			
	 if($tabledi->rowExists())
	 {
			$tabledi->updateRow($detail);
	 }
			

 exit;