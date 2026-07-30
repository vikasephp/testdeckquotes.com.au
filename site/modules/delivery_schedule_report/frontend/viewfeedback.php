<?php
$fwMainView = 'file:' . getcwd() . '/viewfeedback.tpl';
$tableFeedback = new Fw_Db_Table('sales_followup');
$submit = $fwRequest->getParam('subAddDetail', '');
$ds_id = $fwRequest->getParam('ds_id', 0);

	 $sql = "Select ds_feedback from delivery_schedule_report where ds_id = ".$ds_id;
	
	$fwViewData['detail'] = $fwDb->queryOne($sql);

   	$fwViewData['title'] = 'View Feedback';
	

	
	
	
	