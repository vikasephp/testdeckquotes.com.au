<?php
$tablebsst = new Fw_Db_Table('renovation_task_list_subtask');
$bsst_id = $fwRequest->getParam('bsst_id', '');
$detail['bsst_task_name'] = $fwRequest->getparam('value', '');

		
	 $tablebsst->setWhere("bsst_id = ".$bsst_id);
			
	 if($tablebsst->rowExists())
	 {
			$tablebsst->updateRow($detail);
	 }
			



 exit;