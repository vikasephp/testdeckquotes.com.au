<?php
$table = new Fw_Db_Table('business');
$submit = $fwRequest->getParam('updateselect', '');



if($submit) {



	$data = $fwRequest->getParam('projects', array());
	
	
	

	foreach($data as $k => $v)
	{
		if($v == 'on') {
			 $detail['bsn_show_documentclick'] = 1; 
		} else {
			$detail['bsn_show_documentclick'] = 0;	
		}
		
		
			
		$table->setWhere('bsn_id = '.$k);
		$table->updateRow($detail);
			
	}
	

}

$tablePages = new Fw_Db_Table('business');
$tablePages->setOrderBy('bsn_id'.' DESC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;