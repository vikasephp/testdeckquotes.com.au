<?php
$tablebtsub = new Fw_Db_Table('business_tasks_sub');
$bts_id = $fwRequest->getParam('bts_id', '');

$detail['bts_not_required'] = $fwRequest->getparam('value', '');

		
	 $tablebtsub->setWhere("bts_id = ".$bts_id);
			
	 if($tablebtsub->rowExists())
	 {
			$tablebtsub->updateRow($detail);
	 }
			

 exit;