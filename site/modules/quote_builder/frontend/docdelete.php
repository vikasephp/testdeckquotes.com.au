<?php
$this_id = $fwRequest->getparamget('id', '');
$p = $fwRequest->getparamget('p', '');		

if($this_id > 0)
	{


		$thisTable = new Fw_Db_Table('quote_builder');
		$thisTable->setWhere("qb_id = ".$this_id);
		
		if($p == 1) {
			$delData['qb_attachment_1']='';	
		}elseif($p == 2) {
			$delData['qb_attachment_2']='';	
		}elseif($p == 3) {
			$delData['qb_attachment_3']='';	
		}elseif($p == 4) {
			$delData['qb_attachment_4']='';	
		}elseif($p == 5) {
			$delData['qb_attachment_5']='';	
		}elseif($p == 6) {
			$delData['qb_attachment_6']='';	
		}elseif($p == 7) {
			$delData['qb_attachment_7']='';	
		}elseif($p == 8) {
			$delData['qb_attachment_8']='';	
		}elseif($p == 9) {
			$delData['qb_attachment_9']='';	
		}elseif($p == 10) {
			$delData['qb_attachment_10']='';	
		}
		
		$thisTable->updateRow($delData);

		Location(BASE_URL . $XFA['detail'].'/qb_id/'.$this_id);
	}
exit;