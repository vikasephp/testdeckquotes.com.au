<?php
$this_id = $fwRequest->getparamget('id', '');
$p = $fwRequest->getparamget('p', '');		

if($this_id > 0)
	{


		$thisTable = new Fw_Db_Table('construction_alert_report');
		$thisTable->setWhere("car_id = ".$this_id);
		
		if($p == 1) {
			$delData['car_image1']='';	
		}
		elseif($p == 2) {
			$delData['car_image2']='';	
		}
		elseif($p == 3) {
			$delData['car_image3']='';	
		}elseif($p == 4) {
			$delData['car_image4']='';	
		}elseif($p == 5) {
			$delData['car_image5']='';	
		}
		
		$thisTable->updateRow($delData);

		Location(BASE_URL . $XFA['detail'].'/car_id/'.$this_id);
	}
exit;