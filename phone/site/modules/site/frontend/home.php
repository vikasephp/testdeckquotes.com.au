<?php
$table = new Fw_Db_Table('phone_log');
date_default_timezone_set("Australia/Sydney");
$submit = $fwRequest->getParam('phonesubmit', '');
if(!empty($submit))
{
	
	$phonedetail = $fwRequest->getParam('phone', array());
	
	$detail['ph_name'] = $phonedetail['name'];
	
	$detail['ph_phone'] = $phonedetail['number'];
	$detail['ph_email'] = $phonedetail['email'];
	$detail['ph_message'] = $phonedetail['message'];
	$detail['ph_date_time'] = date("d-m-Y h:i:sa");
	$detail['ph_company'] = $phonedetail['company'];
	$detail['ph_address'] = $phonedetail['address'];
	$opr = $table->insertRow($detail); 
	
	$html = "<html>";
	$html .= "<p>Hi</p>";
	$html .= "<p>New record is created in Phone Log</p>";
	$html .= "<p>Phone Log Link: <a href='https://www.deckquotes.com.au/phone_log.home'>https://www.deckquotes.com.au/phone_log.home</a></p>";
	$html .= "<p>Here is the details:</p><br>";
	
	$html .= "<p>Name : ". $phonedetail['name']. "</p>";
	$html .= "<p>Number : ". $phonedetail['number']. "</p>";
	$html .= "<p>Email : ". $phonedetail['email']. "</p>";
	$html .= "<p>Message : ". $phonedetail['message']. "</p>";
	$html .= "<p>Company : ". $phonedetail['company']. "</p><br>";
	$html .= "<p>Address : ". $phonedetail['address']. "</p><br>";
	
	$html .= "<p>Thank You</br>";
	
	$to_name = "CGFB";
	$to = "info@cgfb.com.au";
	
	$from_name = "Phone Log";
	$from = "info@cgfb.com.au";
	
	$subject = "New phone log entry";
	
    $to2 = "manojsoniephp@gmail.com";
	
	send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
	send_email($to_name, $to2, $from_name, $from, $subject, $html, $attachment='');
	
	//$fwViewData['message'] = "Your details has been saved successfully....";
	
	$_SESSION['success_message'] = "Your details has been saved successfully....";
	
    $redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
    exit;
	
}

if (!empty($_SESSION['success_message'])) {
	$fwViewData['message'] = $_SESSION['success_message'];
	unset($_SESSION['success_message']);
}
