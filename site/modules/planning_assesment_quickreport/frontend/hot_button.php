<?php
$fwMainView = 'file:' . getcwd() . '/hot_button.tpl';
$bcust_id = $fwRequest->getParam('bcust_id', '');
$bsn_id = $fwRequest->getParam('bsn_id', '');
$text_cust = $fwRequest->getParam('text_cust', '');


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