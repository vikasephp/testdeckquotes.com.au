<?php
$fwMainView = 'file:' . getcwd() . '/viewfeedback.tpl';
//$tableBusiness = new Fw_Db_Table('business');
$tableFeedback = new Fw_Db_Table('sales_followup');
$submit = $fwRequest->getParam('subAddDetail', '');
$bsn_id = $fwRequest->getParam('bsn_id', 0);
//$user_name = $_SESSION['user']['user_name'];


	 $sql = "Select sales_followup.*,  sales_followup_options.sfo_name, sales_followup_types.tfo_name, users.user_name
	        from sales_followup 
		Left join sales_followup_options on sales_followup.sf_source = sales_followup_options.sfo_id
		Left join sales_followup_types on  sales_followup.sf_types  = 	sales_followup_types.tfo_id
		Inner join users on sales_followup.sf_user_id = users.user_id
		where sales_followup.sf_pid = ".$bsn_id;
	
	$fwViewData['detail'] = $fwDb->query($sql);

   	$fwViewData['title'] = 'View Feedback';
	
	//$fwViewData['user_name'] = $user_name;
	
	
	
	