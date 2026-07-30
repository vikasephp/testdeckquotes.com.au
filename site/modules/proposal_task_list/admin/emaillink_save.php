<?php
$tablebsst = new Fw_Db_Table('proposal_task_list_email_link');
$pel_id = $fwRequest->getParam('pel_id', '');
$detail['pel_email_linked'] = $fwRequest->getparam('value', '');

		
	 $tablebsst->setWhere("pel_id = ".$pel_id);
			
	 if($tablebsst->rowExists())
	 {
			$tablebsst->updateRow($detail);
	 }
			



 exit;