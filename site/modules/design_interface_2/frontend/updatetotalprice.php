<?php
$tabledi = new Fw_Db_Table('design_interface_2');
$di_id = $fwRequest->getParam('di_id', '');
$detail['di_total_price'] = $fwRequest->getparam('value', '');

		
	 $tabledi->setWhere("di_id = ".$di_id);
			
	 if($tabledi->rowExists())
	 {
			$tabledi->updateRow($detail);
	 }
			

 exit;