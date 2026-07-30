<?php
$this_id = $fwRequest->getparamget('id', '');
$p = $fwRequest->getparamget('p', '');		

if($this_id > 0)
	{


		$thisTable = new Fw_Db_Table('warranty_log');
		$thisTable->setWhere("wa_id = ".$this_id);
		
		if($p == 1) {
			$delData['wa_image_1']='';	
		}
		elseif($p == 2) {
			$delData['wa_image_2']='';	
		}
		elseif($p == 3) {
			$delData['wa_image_3']='';	
		}elseif($p == 4) {
			$delData['wa_image_4']='';	
		}elseif($p == 5) {
			$delData['wa_image_5']='';	
		}
		
		$thisTable->updateRow($delData);

		Location(BASE_URL . $XFA['detail'].'/wa_id/'.$this_id);
	}
exit;