<?php
$fwMainView = 'file:' . getcwd() . '/viewrecordings.tpl';
$tableFeedback = new Fw_Db_Table('sales_followup');
$submit = $fwRequest->getParam('subAddDetail', '');
$bsn_id = $fwRequest->getParam('bsn_id', 0);


	 $sql = "Select recorded_meeting.* from recorded_meeting where recorded_meeting.rm_bus_id = ".$bsn_id;
	
	$fwViewData['detail'] = $fwDb->query($sql);

   	$fwViewData['title'] = 'Recorded Meetings';
	
	//db($fwViewData['detail']);
	

	
	
	
	