<?php
$fwMainView = 'file:' . getcwd() . '/alerts.tpl';
$tableAlerts = new Fw_Db_Table('business_alert');
$bsn_id = $fwRequest->getParam('bsn_id', 0);

	 $sqlalert = "Select business_alert.* , users.user_name  from  business_alert
	              Inner Join users on business_alert.be_user = users.user_id
		         where be_business_id = ".$bsn_id . " AND business_alert.be_alert_active = 'Yes' ";
     $alertData = $fwDb->query($sqlalert);
	
	 $fwViewData['alertData'] = $alertData;
	 
		 
    $fwViewData['title'] = 'Active Alerts';

	
	