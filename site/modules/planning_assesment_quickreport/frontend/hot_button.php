<?php
$fwMainView = 'file:' . getcwd() . '/hot_button.tpl';
$bcust_id = $fwRequest->getParam('bcust_id', '');
$bsn_id = $fwRequest->getParam('bsn_id', '');
$text_cust = $fwRequest->getParam('text_cust', '');

$fwViewData['bsn_id'] = $bsn_id;


// Text Customer Starts
if(!empty($text_cust)) {
	
	$sql = "Select bcust_fname, bcust_misc_moble from bus_customers where bcust_id = ".$bcust_id;
	$detail = $fwDb->queryOne($sql);

	$mobile = str_replace(' ','',$detail['bcust_misc_moble']);
	
	if($mobile) {
	  
	  $sms = $fwRequest->getParam('message', '');
	  
	  $username = "manojsoniephp";
 	  $password = "jaimatadi108";
      
	 // $message =  $detail['bcust_fname']. "   Thank you for your enquiry about Canberra Granny Flat Builders and Fixed Price Extensions.";
	  $message =  $detail['bcust_fname'].' '. $sms; 
	
	  $type     = "1-way";
	  $senderid = "CGFB"; 
	  $to = $mobile;
	 
	  //$to = "919823868963";	
	
	  $url = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to;

		  $output = file($url);
		
		  $result = explode(":", $output[0]);
		
		  if($result[0] == "id") 
		  {
			echo("Message sent\n");
			$fwViewData['msg'] = "Text Message Has Been Successfully Sent";
			
		  }
		  else
		  {
			echo("Error :- " . $result[1] . "\n");
		  }	
		
	}		
}
// Text Customer Ends

// Email Missing Starts
$email_missing = $fwRequest->getParam('email_missing', '');

if(!empty($email_missing)) {
	
	$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0128'";
	$emaildata = $fwDb->queryOne($sql);
	
	
	
	$sqlcust = "Select bcust_fname, bcust_misc_email1 from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$emaildata['eml_email_content'] = str_replace("[first name]", $custdata['bcust_fname'], $emaildata['eml_email_content']);
	
	$emaildata['eml_email_content'] .= "<p>Yours Sincerely,</p>
		          <p>CGFB and FPE Team</p>";
	
	
	$toname = $custdata['bcust_fname'];
	$to = $custdata['bcust_misc_email1'];
	//$to = "manojsoniephp@gmail.com";
	
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject'];
	$email_body = $emaildata['eml_email_content'];
	
	send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
	$fwViewData['msg'] = "Email Has Been Successfully Sent";
}

// Email Missing Ends


// Survey Link Starts

$survey_link = $fwRequest->getParam('survey_link', '');

if(!empty($survey_link)) {
	
			
		$filepath_url = "https://www.surveymonkey.com/r/DCTG97G";
		echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=900, height=750'); window.focus();</script>"; 
		
}


// Email Survey
$email_survey = $fwRequest->getParam('email_survey', '');

if(!empty($email_survey)) {
	
	$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0515'";
	$emaildata = $fwDb->queryOne($sql);
	
	
	
	$sqlcust = "Select bcust_fname, bcust_misc_email1 from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$emaildata['eml_email_content'] = str_replace("[first name]", $custdata['bcust_fname'], $emaildata['eml_email_content']);
	
	$emaildata['eml_email_content'] .= "<p>Yours Sincerely,</p>
		          <p>CGFB and FPE Team</p>";
	
	
	$toname = $custdata['bcust_fname'];
	$to = $custdata['bcust_misc_email1'];
	
	//$to = "manojsoniephp@gmail.com";
	
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject'];
	$email_body = $emaildata['eml_email_content'];
	
	send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
	$fwViewData['msg'] = "Survey Email Has Been Successfully Sent";
}

// Email Survey Ends

// Task Complete
$task_complete = $fwRequest->getParam('task_complete', '');
if(!empty($task_complete)) {
	
	$data['bt_complete'] = 1;
	$data['bt_completed_date'] = date('Y-m-d h:i:s');
	$data['bt_completed_by'] = $_SESSION['user']['user_id'];
	
	$table = new Fw_Db_Table('business_tasks');
	$table->setWhere("bt_bsn_id = $bsn_id and bt_task_id = 302");
	$table->updateRow($data);
	
	$fwViewData['msg'] = "Task 302 has been mark completed successfully";
}


// Email Meeting Request
$email_meeting = $fwRequest->getParam('email_meeting', '');

if(!empty($email_meeting)) {
	
	$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0026'";
	$emaildata = $fwDb->queryOne($sql);
	
	$sqlcust = "Select bcust_fname, bcust_misc_email1 from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$emaildata['eml_email_content'] = str_replace("[first name]", $custdata['bcust_fname'], $emaildata['eml_email_content']);
	
	$emaildata['eml_email_content'] .= "<p>Yours Sincerely,</p>
		          <p>CGFB and FPE Team</p>";
	
	
	$toname = $custdata['bcust_fname'];
	$to = $custdata['bcust_misc_email1'];
	
	//$to = "manojsoniephp@gmail.com";
	
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject'];
	$email_body = $emaildata['eml_email_content'];
	
	send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
	$fwViewData['msg'] = "Email MS-0026 Has Been Successfully Sent";
}


// Email MS 10
$email_10 = $fwRequest->getParam('email_10', '');

if(!empty($email_10)) {
	
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	$sqlbus = "Select bsn_name, bsn_address, bsn_proj_salu from business where bsn_id = ".$bsn_id;
	$busdata = $fwDb->queryOne($sqlbus);

	$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0128'";
	$emaildata = $fwDb->queryOne($sql);
	
	
	$emaildata['eml_email_content'] = str_replace("[Salutation]", $busdata['bsn_proj_salu'], $emaildata['eml_email_content']);
	
		
	$sqlSign = "Select * from email_signature where es_id = 1" ;
	$signature = $fwDb->query($sqlSign);
	
	$emaildata['eml_email_content'] .=  $signature[0]['es_signature'];
	if ($signature[0]['es_logo']) {
		$emaildata['eml_email_content'] .= "<img src='" . BASE_URL . "files/email_library/" . $signature[0]['es_logo'] . "'>";
	}
	
	
	$tocc = "info@cgfb.com.au";
	
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject'];
	$email_body = $emaildata['eml_email_content'];
	
	$sqlSeller = "select bs_customers_id from business_sellers where bs_business_id = ".$bsn_id;
	$customersdata = $fwDb->query($sqlSeller);
	
	$toLog = '';	
	
	require_once(LIB_DIR . 'EmailClass.php');
	$emailObj = new EmailClass;
	
	$emailObj->subject = $subject;
	$emailObj->message = $email_body;
	$emailObj->addFrom($from, $fromname);
	$emailObj->attachments = $attachmentsend;		
	
	foreach($customersdata as $k => $v)
	{
		
		$sqlcust = "Select bcust_fname, bcust_misc_email1, bcust_misc_email2, bcust_misc_email3, bcust_misc_email4, bcust_misc_email5
		            from bus_customers where bcust_id = ".$v['bs_customers_id'];
		$custdata = $fwDb->queryOne($sqlcust);
		
	
		$toname = $custdata['bcust_fname'];
		$to = $custdata['bcust_misc_email1'];
		$toLog .=  '<br>- '. $custdata['bcust_misc_email1'];
		//$to = "manojs@ephpsolutions.com";
		//send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
		$emailObj->addTo($to, $toname);
		
		if($custdata['bcust_misc_email2'])
		{
			//send_email($toname,$custdata['bcust_misc_email2'], $fromname, $from, $subject, $email_body, $attachmentsend='');	
			$emailObj->addCC($custdata['bcust_misc_email2'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email2'];
		}
		
		if($custdata['bcust_misc_email3'])
		{
			//send_email($toname,$custdata['bcust_misc_email3'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email3'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email3'];	
		}
		
		if($custdata['bcust_misc_email4'])
		{
			//send_email($toname,$custdata['bcust_misc_email4'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email4'], $toname);
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email4'];
				
		}
		
		if($custdata['bcust_misc_email5'])
		{
			//send_email($toname,$custdata['bcust_misc_email5'], $fromname, $from, $subject, $email_body, $attachmentsend='');	
			$emailObj->addCC($custdata['bcust_misc_email5'], $toname);
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email5'];
			
		}
			
	}
	
	
	$emailObj->addCC('emailbackup@cgfb.com.au', $toname);	
	$response = $emailObj->sendEmail();
	if ($response['success']) {
		
		$fwViewData['msg'] = "Email MS-10 Has Been Successfully Sent";
	} else {
		
		$fwViewData['msg'] = 'Email Not Sent';
	}
	
    // send_email($toname,$tocc, $fromname, $from, $subject, $email_body, $attachmentsend='');
	//send_email($toname,'emailbackup@cgfb.com.au', $fromname, $from, $subject, $email_body, $attachmentsend='');
	//$fwViewData['msg'] = "Email MS-10 Has Been Successfully Sent";
	
	$emailLog['elog_eml_code'] = 'MS-0128 - MS 10';
	$emailLog['elog_to'] = $toLog;
	$emailLog['elog_from'] = $from;
	$emailLog['elog_subject'] = $subject;
	$emailLog['elog_email_body'] = $email_body;
	$emailLog['elog_bsn_id'] = $bsn_id;
	$emailLog['elog_business'] = $busdata['bsn_name'];
	
    $email_log_Table = new Fw_Db_Table('email_log');
	$email_log_Table->insertRow($emailLog);
	$fwViewData['ms10'] = 'sent'; 
	
	
}



// Email MS 11
$email_11 = $fwRequest->getParam('email_11', '');

if(!empty($email_11)) {
	
	
	$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0022'";
	$emaildata = $fwDb->queryOne($sql);
	
	$sqlbus = "Select bsn_name, bsn_address, bsn_proj_salu from business where bsn_id = ".$bsn_id;
	$busdata = $fwDb->queryOne($sqlbus);

	$sqlcust = "Select bcust_fname, bcust_misc_email1 from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$emaildata['eml_email_content'] = str_replace("[Salutation]", $busdata['bsn_proj_salu'], $emaildata['eml_email_content']);
	
	
	$sqlSign = "Select * from email_signature where es_id = 76" ;
	$signature = $fwDb->query($sqlSign);
	
	$emaildata['eml_email_content'] .=  $signature[0]['es_signature'];
	if ($signature[0]['es_logo']) {
		$emaildata['eml_email_content'] .= "<img src='" . BASE_URL . "files/email_library/" . $signature[0]['es_logo'] . "'>";
	}
	

	$tocc = "info@cgfb.com.au";
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject']. ' ' . $busdata['bsn_address'];;
	$email_body = $emaildata['eml_email_content'];
	
	
	$sqlSeller = "select bs_customers_id from business_sellers where bs_business_id = ".$bsn_id;
	$customersdata = $fwDb->query($sqlSeller);
	
		$sqlDoc = "select bgd_name from bes_guide_docs where bgd_dh_id =  65";
		$docData = $fwDb->queryOne($sqlDoc);

		$source = "https://deckquote.s3.amazonaws.com/files/cgfb_guide/" . $docData['bgd_name'];
		$destination = BASE_DIR . FILE_PATH . "files/manoj/" . $docData['bgd_name'];
		$source = get_file_data($docData['bgd_name']);
		copy($source, $destination);
		
		
		$finalatta = BASE_URL . FILE_PATH . "files/manoj/" . $docData['bgd_name'];
		$file = BASE_DIR . FILE_PATH . "files/manoj/" . $docData['bgd_name'];

		if (file_exists($file)) {
			$fdata[] = $finalatta;	
		}
		
		if (!empty($fdata)) {
			//$attachmentsend = serialize($fdata);
			$attachmentsend = $fdata;
		}
	
	require_once(LIB_DIR . 'EmailClass.php');
	$emailObj = new EmailClass;
	
	$emailObj->subject = $subject;
	$emailObj->message = $email_body;
	$emailObj->addFrom($from, $fromname);
	$emailObj->attachments = $attachmentsend;
	
	$toLog = '';
	foreach($customersdata as $k => $v)
	{
		
		$sqlcust = "Select bcust_fname, bcust_misc_email1, bcust_misc_email2, bcust_misc_email3, bcust_misc_email4, bcust_misc_email5
		            from bus_customers where bcust_id = ".$v['bs_customers_id'];
		$custdata = $fwDb->queryOne($sqlcust);
		
		$toname = $custdata['bcust_fname'];
		$to = $custdata['bcust_misc_email1'];
		$toLog .= '<br>- '. $custdata['bcust_misc_email1'];
		//$to = "manojs@ephpsolutions.com";
		
		//send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend);
		$emailObj->addTo($to, $toname);
		
		if($custdata['bcust_misc_email2'])
		{
			//send_email($toname,$custdata['bcust_misc_email2'], $fromname, $from, $subject, $email_body, $attachmentsend);
			$emailObj->addCC($custdata['bcust_misc_email2'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email2'];
		}
		
		if($custdata['bcust_misc_email3'])
		{
			//send_email($toname,$custdata['bcust_misc_email3'], $fromname, $from, $subject, $email_body, $attachmentsend);
			$emailObj->addCC($custdata['bcust_misc_email3'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email3'];	
		}
		
		if($custdata['bcust_misc_email4'])
		{
			//send_email($toname,$custdata['bcust_misc_email4'], $fromname, $from, $subject, $email_body, $attachmentsend);
			$emailObj->addCC($custdata['bcust_misc_email4'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email4'];		
		}
		
		if($custdata['bcust_misc_email5'])
		{
			//send_email($toname,$custdata['bcust_misc_email5'], $fromname, $from, $subject, $email_body, $attachmentsend);
			$emailObj->addCC($custdata['bcust_misc_email5'], $toname);		
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email5'];	
		}
			
	}
	
	$emailObj->addCC('emailbackup@cgfb.com.au', $toname);	
	$response = $emailObj->sendEmail();
	if ($response['success']) {
		
		$fwViewData['msg'] = "Email MS-11 Has Been Successfully Sent";
	} else {
		
		$fwViewData['msg'] = 'Email Not Sent';
	}
	
	//send_email($toname,$tocc, $fromname, $from, $subject, $email_body, $attachmentsend);
	//send_email($toname,'emailbackup@cgfb.com.au', $fromname, $from, $subject, $email_body, $attachmentsend);
	//$fwViewData['msg'] = "Email MS-11 Has Been Successfully Sent";
	
	$emailLog['elog_eml_code'] = 'MS-0022 - MS 11';
	$emailLog['elog_to'] = $toLog;
	$emailLog['elog_from'] = $from;
	$emailLog['elog_subject'] = $subject;
	$emailLog['elog_email_body'] = $email_body;
	$emailLog['elog_bsn_id'] = $bsn_id;
	$emailLog['elog_business'] = $busdata['bsn_name'];
	$emailLog['elog_attachment1'] = $docData['bgd_name'];
	
	$email_log_Table = new Fw_Db_Table('email_log');
	$email_log_Table->insertRow($emailLog);
	$fwViewData['ms11'] = 'sent'; 
	
}


// Email MS 17
$email_17 = $fwRequest->getParam('email_17', '');

if(!empty($email_17)) {
	
	
	$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0517'";
	$emaildata = $fwDb->queryOne($sql);
	
	$sqlcust = "Select bcust_fname, bcust_misc_email1 from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$sqlbus = "Select bsn_name, bsn_address,bsn_proj_salu from business where bsn_id = ".$bsn_id;
	$busdata = $fwDb->queryOne($sqlbus);
	
	$emaildata['eml_email_content'] = str_replace("[Salutation]", $busdata['bsn_proj_salu'], $emaildata['eml_email_content']);
	

	$sqlSign = "Select * from email_signature where es_id = 76" ;
	$signature = $fwDb->query($sqlSign);
	
	$emaildata['eml_email_content'] .=  $signature[0]['es_signature'];
	if ($signature[0]['es_logo']) {
		$emaildata['eml_email_content'] .= "<img src='" . BASE_URL . "files/email_library/" . $signature[0]['es_logo'] . "'>";
	}
	

	$tocc = "info@cgfb.com.au";
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject']. ' '.$busdata['bsn_address'];
	$email_body = $emaildata['eml_email_content'];
	
	
	$sqlSeller = "select bs_customers_id from business_sellers where bs_business_id = ".$bsn_id;
	$customersdata = $fwDb->query($sqlSeller);
	
	
	require_once(LIB_DIR . 'EmailClass.php');
	$emailObj = new EmailClass;
	
	$emailObj->subject = $subject;
	$emailObj->message = $email_body;
	$emailObj->addFrom($from, $fromname);
	$emailObj->attachments = $attachmentsend;
	
	$toLog = '';
	
	foreach($customersdata as $k => $v)
	{
		
		$sqlcust = "Select bcust_fname, bcust_misc_email1, bcust_misc_email2, bcust_misc_email3, bcust_misc_email4, bcust_misc_email5
		            from bus_customers where bcust_id = ".$v['bs_customers_id'];
		$custdata = $fwDb->queryOne($sqlcust);
		
		$toname = $custdata['bcust_fname'];
		$to = $custdata['bcust_misc_email1'];
		$toLog .= '<br>- '. $custdata['bcust_misc_email1'];
		//$to = "manojs@ephpsolutions.com";
		//send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
		$emailObj->addTo($to, $toname);
		
		if($custdata['bcust_misc_email2'])
		{
			//send_email($toname,$custdata['bcust_misc_email2'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email2'], $toname);		
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email2'];
		}
		
		if($custdata['bcust_misc_email3'])
		{
			//send_email($toname,$custdata['bcust_misc_email3'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email3'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email3'];	
		}
		
		if($custdata['bcust_misc_email4'])
		{
			//send_email($toname,$custdata['bcust_misc_email4'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email4'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email4'];		
		}
		
		if($custdata['bcust_misc_email5'])
		{
			//send_email($toname,$custdata['bcust_misc_email5'], $fromname, $from, $subject, $email_body, $attachmentsend='');	
			$emailObj->addCC($custdata['bcust_misc_email5'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email5'];	
		}
		
	}
	
	$emailObj->addCC('emailbackup@cgfb.com.au', $toname);	
	$response = $emailObj->sendEmail();
	if ($response['success']) {
		
		$fwViewData['msg'] = "Email MS-17 Has Been Successfully Sent";
	} else {
		
		$fwViewData['msg'] = 'Email Not Sent';
	}
	
	
	//send_email($toname,$tocc, $fromname, $from, $subject, $email_body, $attachmentsend='');
	//send_email($toname,'emailbackup@cgfb.com.au', $fromname, $from, $subject, $email_body, $attachmentsend='');
	//$fwViewData['msg'] = "Email MS-17 Has Been Successfully Sent";
	
	$emailLog['elog_eml_code'] = 'MS-0517 - MS 17';
	$emailLog['elog_to'] = $toLog;
	$emailLog['elog_from'] = $from;
	$emailLog['elog_subject'] = $subject;
	$emailLog['elog_email_body'] = $email_body;
	$emailLog['elog_bsn_id'] = $bsn_id;
	$emailLog['elog_business'] = $busdata['bsn_name'];
	
	$email_log_Table = new Fw_Db_Table('email_log');
	$email_log_Table->insertRow($emailLog);
	
	$fwViewData['ms17'] = 'sent';
		
}
//SMS MS 12.1
$email_121 = $fwRequest->getParam('email_121', '');

if(!empty($email_121)) {
	$sqlcust = "Select bcust_fname, bcust_misc_moble from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$mobile = str_replace(' ', '', $custdata['bcust_misc_moble']);
	
	
	if($mobile) {
	    
	  $sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0515'";
	  $emaildata = $fwDb->queryOne($sql);
	  
	  $sqlbus = "Select bsn_name, bsn_address,bsn_proj_salu from business where bsn_id = ".$bsn_id;
	  $busdata = $fwDb->queryOne($sqlbus);
	  
	 // $sms = str_replace("[first name]", $custdata['bcust_fname'], $emaildata['eml_email_content']);
	  $sms = str_replace("[Salutation]", $busdata['bsn_proj_salu'], $emaildata['eml_email_content']);
	  
	  $sms = strip_tags($sms);
	  $sms = html_entity_decode($sms, ENT_QUOTES | ENT_HTML5, 'UTF-8');	
	  $sms = str_replace("\xC2\xA0", ' ', $sms);
	  $sms = preg_replace('/\s+/', ' ', $sms);
	 
	  $username = "manojsoniephp";
 	  $password = "jaimatadi108";
      
	  $message =   $sms; 
	
	  $type     = "1-way";
	  $senderid = "CGFB"; 
	  $to = $mobile;
	 
	  //$to = "919823868963";	
	
	  $url = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to;

		  $output = file($url);
		
		  $result = explode(":", $output[0]);
		
		  if($result[0] == "id") 
		  {
			echo("Message sent\n");
			$fwViewData['msg'] = "MS-12.1 Text Message Has Been Successfully Sent";
			
		  }
		  else
		  {
			echo("Error :- " . $result[1] . "\n");
		  }	
		
	}	
	$fwViewData['ms121S'] = 'sent';	
	
}

// Ms 12.1 Email Starts


$email_121Email = $fwRequest->getParam('email_121Email', '');

if(!empty($email_121Email)) {
	
	
	$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0515'";
	$emaildata = $fwDb->queryOne($sql);
	
	$sqlcust = "Select bcust_fname, bcust_misc_email1 from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$sqlbus = "Select bsn_name, bsn_address,bsn_proj_salu from business where bsn_id = ".$bsn_id;
	$busdata = $fwDb->queryOne($sqlbus);
	
	$emaildata['eml_email_content'] = str_replace("[Salutation]", $busdata['bsn_proj_salu'], $emaildata['eml_email_content']);
	

	//$sqlSign = "Select * from email_signature where es_id = 76" ;
	//$signature = $fwDb->query($sqlSign);
	
	//$emaildata['eml_email_content'] .=  $signature[0]['es_signature'];
	//if ($signature[0]['es_logo']) {
	//	$emaildata['eml_email_content'] .= "<img src='" . BASE_URL . "files/email_library/" . $signature[0]['es_logo'] . "'>";
	//}
	

	$tocc = "info@cgfb.com.au";
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject']. ' '.$busdata['bsn_address'];
	$email_body = $emaildata['eml_email_content'];
	
	
	$sqlSeller = "select bs_customers_id from business_sellers where bs_business_id = ".$bsn_id;
	$customersdata = $fwDb->query($sqlSeller);
	
	
	require_once(LIB_DIR . 'EmailClass.php');
	$emailObj = new EmailClass;
	
	$emailObj->subject = $subject;
	$emailObj->message = $email_body;
	$emailObj->addFrom($from, $fromname);
	$emailObj->attachments = $attachmentsend;
	
	$toLog = '';
	
	foreach($customersdata as $k => $v)
	{
		
		$sqlcust = "Select bcust_fname, bcust_misc_email1, bcust_misc_email2, bcust_misc_email3, bcust_misc_email4, bcust_misc_email5
		            from bus_customers where bcust_id = ".$v['bs_customers_id'];
		$custdata = $fwDb->queryOne($sqlcust);
		
		$toname = $custdata['bcust_fname'];
		$to = $custdata['bcust_misc_email1'];
		$toLog .= '<br>- '.$custdata['bcust_misc_email1'];
		//$to = "manojs@ephpsolutions.com";
		//send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
		$emailObj->addTo($to, $toname);
		
		
		if($custdata['bcust_misc_email2'])
		{
			//send_email($toname,$custdata['bcust_misc_email2'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email2'], $toname);		
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email2'];
		}
		
		if($custdata['bcust_misc_email3'])
		{
			//send_email($toname,$custdata['bcust_misc_email3'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email3'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email3'];	
		}
		
		if($custdata['bcust_misc_email4'])
		{
			//send_email($toname,$custdata['bcust_misc_email4'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email4'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email4'];		
		}
		
		if($custdata['bcust_misc_email5'])
		{
			//send_email($toname,$custdata['bcust_misc_email5'], $fromname, $from, $subject, $email_body, $attachmentsend='');	
			$emailObj->addCC($custdata['bcust_misc_email5'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email5'];	
		}
		
	}
	
	$emailObj->addCC('emailbackup@cgfb.com.au', $toname);	
	$response = $emailObj->sendEmail();
	if ($response['success']) {
		
		$fwViewData['msg'] = "Email MS-12.1 Has Been Successfully Sent";
	} else {
		
		$fwViewData['msg'] = 'Email Not Sent';
	}
	
	//send_email($toname,$tocc, $fromname, $from, $subject, $email_body, $attachmentsend='');
	//send_email($toname,'emailbackup@cgfb.com.au', $fromname, $from, $subject, $email_body, $attachmentsend='');
	//$fwViewData['msg'] = "Email MS-12.1 Has Been Successfully Sent";
	
	$emailLog['elog_eml_code'] = 'MS-0515 - MS 12.1';
	$emailLog['elog_to'] = $toLog;
	$emailLog['elog_from'] = $from;
	$emailLog['elog_subject'] = $subject;
	$emailLog['elog_email_body'] = $email_body;
	$emailLog['elog_bsn_id'] = $bsn_id;
	$emailLog['elog_business'] = $busdata['bsn_name'];
	
	$email_log_Table = new Fw_Db_Table('email_log');
	$email_log_Table->insertRow($emailLog);
			$fwViewData['ms121E'] = 'sent';
}

// MS 12.1 Email Ends




// Email MS 600
$email_600 = $fwRequest->getParam('email_600', '');
if(!empty($email_600)) {
	
	
	$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0516'";
	$emaildata = $fwDb->queryOne($sql);
	
	$sqlcust = "Select bcust_fname, bcust_misc_email1, bcust_misc_moble from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$sqlbus = "Select bsn_name, bsn_address, bsn_proj_salu from business where bsn_id = ".$bsn_id;	
	$busdata = $fwDb->queryOne($sqlbus);
	
	$sqlComment = "Select bs_comments  from business_sellers where bs_business_id = ".$bsn_id;
	$commentdata = $fwDb->queryOne($sqlComment);
	

	$emaildata['eml_email_content'] = str_replace("[Salutation]", $busdata['bsn_proj_salu'], $emaildata['eml_email_content']);
	$emaildata['eml_email_content'] = str_replace("[Comment]", $commentdata['bs_comments'], $emaildata['eml_email_content']);
	
	
	//$toname = $custdata['bcust_fname'];
	//$to = $custdata['bcust_misc_email1'];
	//$tocc = "info@cgfb.com.au";
	

	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject']. ' '.$busdata['bsn_address'];
	$email_body = $emaildata['eml_email_content'];
	
	$sqlSeller = "select bs_customers_id from business_sellers where bs_business_id = ".$bsn_id;
	$customersdata = $fwDb->query($sqlSeller);
	
	require_once(LIB_DIR . 'EmailClass.php');
	$emailObj = new EmailClass;
	
	$emailObj->subject = $subject;
	$emailObj->message = $email_body;
	$emailObj->addFrom($from, $fromname);
	$emailObj->attachments = $attachmentsend;
	
	$toLog = '';
	
	foreach($customersdata as $k => $v)
	{
		
		$sqlcust = "Select bcust_fname, bcust_misc_email1, bcust_misc_email2, bcust_misc_email3, bcust_misc_email4, bcust_misc_email5
		            from bus_customers where bcust_id = ".$v['bs_customers_id'];
		$custdata = $fwDb->queryOne($sqlcust);
		
		$toname = $custdata['bcust_fname'];
		$to = $custdata['bcust_misc_email1'];
		$toLog .= '<br>- '.$custdata['bcust_misc_email1'];

		//send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
		$emailObj->addTo($to, $toname);
		
		if($custdata['bcust_misc_email2'])
		{
			//send_email($toname,$custdata['bcust_misc_email2'], $fromname, $from, $subject, $email_body, $attachmentsend='');	
			$emailObj->addCC($custdata['bcust_misc_email2'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email2'];
		}
		
		if($custdata['bcust_misc_email3'])
		{
			//send_email($toname,$custdata['bcust_misc_email3'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email3'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email3'];	
		}
		
		if($custdata['bcust_misc_email4'])
		{
			//send_email($toname,$custdata['bcust_misc_email4'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email4'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email4'];		
		}
		
		if($custdata['bcust_misc_email5'])
		{
			//send_email($toname,$custdata['bcust_misc_email5'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email5'], $toname);		
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email5'];	
		}
		
	}
	
	$emailObj->addCC('emailbackup@cgfb.com.au', $toname);	
	$response = $emailObj->sendEmail();
	if ($response['success']) {
		
		$fwViewData['msg'] = "Email MS-600 Has Been Successfully Sent";
	} else {
		
		$fwViewData['msg'] = 'Email Not Sent';
	}
	
	//send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
	//send_email($toname,'emailbackup@cgfb.com.au', $fromname, $from, $subject, $email_body, $attachmentsend='');
	//$fwViewData['msg'] = "Email MS-600 Has Been Successfully Sent";
	
	$emailLog['elog_eml_code'] = 'MS-0516 - MS 600';
	$emailLog['elog_to'] = $toLog;
	$emailLog['elog_from'] = $from;
	$emailLog['elog_subject'] = $subject;
	$emailLog['elog_email_body'] = $email_body;
	$emailLog['elog_bsn_id'] = $bsn_id;
	$emailLog['elog_business'] = $busdata['bsn_name'];
	
	$email_log_Table = new Fw_Db_Table('email_log');
	$email_log_Table->insertRow($emailLog);
	
		$fwViewData['ms600'] = 'sent';
	$mobile = str_replace(' ', '', $custdata['bcust_misc_moble']);
	
	if($mobile) {

	//  $sms = str_replace("[first name]", $custdata['bcust_fname'], $emaildata['eml_email_content']);
	  $sms = str_replace("[Salutation]", $busdata['bsn_proj_salu'], $emaildata['eml_email_content']);
	  
	  $sms = strip_tags($sms);
	  $sms = html_entity_decode($sms, ENT_QUOTES | ENT_HTML5, 'UTF-8');	
	  $sms = str_replace("\xC2\xA0", ' ', $sms);
	  $sms = preg_replace('/\s+/', ' ', $sms);
	 
	  $username = "manojsoniephp";
 	  $password = "jaimatadi108";
      
	  $message =   $sms; 
	
	  $type     = "1-way";
	  $senderid = "CGFB"; 
	  $to = $mobile;
	 
	  //$to = "919823868963";	
	
	  $url = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to;

		  $output = file($url);
		
		  $result = explode(":", $output[0]);
		
		  if($result[0] == "id") 
		  {
			echo("Message sent\n");
			$fwViewData['msg'] = "Text Message Has Been Successfully Sent";
			
		  }
		  else
		  {
			echo("Error :- " . $result[1] . "\n");
		  }	
		
	}	
	
		
}



// Email MS 0868
$email_0768 = $fwRequest->getParam('email_0768', '');

if(!empty($email_0768)) {
	
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	$sqlbus = "Select bsn_name, bsn_address,bsn_proj_salu from business where bsn_id = ".$bsn_id;
	$busdata = $fwDb->queryOne($sqlbus);

	$sql = "Select eml_email_content, eml_subject  from emaillibrary where eml_code = 'MS-0768'";
	$emaildata = $fwDb->queryOne($sql);
	
	$sqlcust = "Select bcust_fname, bcust_misc_email1 from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$emaildata['eml_email_content'] = str_replace("[Salutation]", $busdata['bsn_proj_salu'], $emaildata['eml_email_content']);
	
	
	$sqlSign = "Select * from email_signature where es_id = 1" ;
	$signature = $fwDb->query($sqlSign);
	
	$emaildata['eml_email_content'] .=  $signature[0]['es_signature'];
	if ($signature[0]['es_logo']) {
		$emaildata['eml_email_content'] .= "<img src='" . BASE_URL . "files/email_library/" . $signature[0]['es_logo'] . "'>";
	}
	
	
	//$toname = $custdata['bcust_fname'];
	//$to = $custdata['bcust_misc_email1'];
	//$to = "manojs@ephpsolutions.com";
	$tocc = "info@cgfb.com.au";
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject'];
	$email_body = $emaildata['eml_email_content'];
	
	
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	
	$subject = $emaildata['eml_subject']. ' '.$busdata['bsn_address'];
	$email_body = $emaildata['eml_email_content'];
	
	$sqlSeller = "select bs_customers_id from business_sellers where bs_business_id = ".$bsn_id;
	$customersdata = $fwDb->query($sqlSeller);
	
	require_once(LIB_DIR . 'EmailClass.php');
	$emailObj = new EmailClass;
	
	$emailObj->subject = $subject;
	$emailObj->message = $email_body;
	$emailObj->addFrom($from, $fromname);
	$emailObj->attachments = $attachmentsend;
	
	$toLog = '';
	
	foreach($customersdata as $k => $v)
	{
		
		$sqlcust = "Select bcust_fname, bcust_misc_email1, bcust_misc_email2, bcust_misc_email3, bcust_misc_email4, bcust_misc_email5
		            from bus_customers where bcust_id = ".$v['bs_customers_id'];
		$custdata = $fwDb->queryOne($sqlcust);
		
		$toname = $custdata['bcust_fname'];
		$to = $custdata['bcust_misc_email1'];
		$toLog .= '<br>- '.$custdata['bcust_misc_email1'];

		//send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
		$emailObj->addTo($to, $toname);
		
		if($custdata['bcust_misc_email2'])
		{
			//send_email($toname,$custdata['bcust_misc_email2'], $fromname, $from, $subject, $email_body, $attachmentsend='');	
			$emailObj->addCC($custdata['bcust_misc_email2'], $toname);
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email2'];
		}
		
		if($custdata['bcust_misc_email3'])
		{
			//send_email($toname,$custdata['bcust_misc_email3'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email3'], $toname);
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email3'];	
		}
		
		if($custdata['bcust_misc_email4'])
		{
			//send_email($toname,$custdata['bcust_misc_email4'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email4'], $toname);
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email4'];		
		}
		
		if($custdata['bcust_misc_email5'])
		{
			//send_email($toname,$custdata['bcust_misc_email5'], $fromname, $from, $subject, $email_body, $attachmentsend='');
			$emailObj->addCC($custdata['bcust_misc_email5'], $toname);	
			$toLog = $toLog . '<br>- '. $custdata['bcust_misc_email5'];	
		}
		
	}
	
	
	$emailObj->addCC('emailbackup@cgfb.com.au', $toname);	
	$response = $emailObj->sendEmail();
	if ($response['success']) {
		
		$fwViewData['msg'] = "Email MS-768 Has Been Successfully Sent";
	} else {
		
		$fwViewData['msg'] = 'Email Not Sent';
	}
	//send_email($toname,$tocc, $fromname, $from, $subject, $email_body, $attachmentsend='');
    //send_email($toname,'emailbackup@cgfb.com.au', $fromname, $from, $subject, $email_body, $attachmentsend='');
	//$fwViewData['msg'] = "Email MS-768 Has Been Successfully Sent";
	
	$emailLog['elog_eml_code'] = 'MS-0768';
	$emailLog['elog_to'] = $toLog;
	$emailLog['elog_from'] = $from;
	$emailLog['elog_subject'] = $subject;
	$emailLog['elog_email_body'] = $email_body;
	$emailLog['elog_bsn_id'] = $bsn_id;
	$emailLog['elog_business'] = $busdata['bsn_name'];
	
	$email_log_Table = new Fw_Db_Table('email_log');
	$email_log_Table->insertRow($emailLog);
	
	$fwViewData['ms768'] = 'sent';
}




// Email Meeting Request Ends

// Email Remainder
$survey_remainder = $fwRequest->getParam('survey_remainder', '');

if(!empty($survey_remainder)) {

    $sqlcust = "Select bcust_fname, bcust_misc_email1,bcust_misc_moble from bus_customers where bcust_id = ".$bcust_id;
	$custdata = $fwDb->queryOne($sqlcust);
	
	$email_body = "<html>";	
	$email_body .= "<p>".$custdata['bcust_fname']."</p>";
	$email_body .= "<p>Thank you for your enquiry about Canberra Granny Flat Builders and Fixed Price Extensions.</p>"; 
	$email_body .= "<p>Please complete this survey so we can assist you:</p>";
	$email_body .= "<p><a href='https://www.surveymonkey.com/r/DCTG97G'>Customer Project Needs Survey</a><br>";
	$email_body .= "<a href='https://www.surveymonkey.com/r/DCTG97G'>(surveymonkey.com)</a></p>";
	$email_body .= "<p>Call 1300 979 658</p>";
	$email_body .= "<p>Yours Sincerely,</p>
		           <p>CGFB and FPE Team</p>";
				   
	$toname = $custdata['bcust_fname'];
	$to = $custdata['bcust_misc_email1'];
	$fromname = "CGFB and FPE Team";
	$from = "info@cgfb.com.au";
	$subject = "Survey Remainder";	
	
	//$to = "manojsoniephp@gmail.com";
	
	send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend='');
			   
	
	$mobile = str_replace(' ','',$custdata['bcust_misc_moble']);
	
	if($mobile) {
	  
	  $sms = $fwRequest->getParam('message', '');
	  
	  $username = "manojsoniephp";
 	  $password = "jaimatadi108";
 	
	  $message =  $custdata['bcust_fname'] . "\nThank you for your enquiry about Canberra Granny Flat Builders and Fixed Price Extensions.\n"; 
      $message .= "Please complete this survey so we can assist you:\n";
	  $message .= "https://www.surveymonkey.com/r/DCTG97G\n";
	  $message .= "CGFB and FPE Team";
	
	  $type     = "1-way";
	  $senderid = "CGFB"; 
	  $to = $mobile;
	 
	  //$to = "919823868963";	
	
	  $url = "http://api.directsms.com.au/s3/http/send_message?" .
			 "username=" . $username . "&" .
			 "password=" . $password . "&" .
			 "message="  . urlencode($message) . "&" .
			 "type="     . $type . "&" .
			 "senderid=" . urlencode($senderid) . "&" .
			 "to="       . $to;

		  $output = file($url);
		  $result = explode(":", $output[0]);
		
		  if($result[0] == "id") 
		  {
			echo("Message sent\n");
			$fwViewData['msg'] = "Survey Remainder Email and SMS Has Been Sent Successfully";
			
		  }
		  else
		  {
			echo("Error :- " . $result[1] . "\n");
		  }	
		
	}			
}