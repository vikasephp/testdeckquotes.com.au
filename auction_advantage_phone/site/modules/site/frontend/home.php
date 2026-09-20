<?php
$table = new Fw_Db_Table('auction_advantage_phone_log');
date_default_timezone_set("Australia/Sydney");
$submit = $fwRequest->getParam('phonesubmit', '');
if(!empty($submit))
{
	
    $phonedetail = $fwRequest->getParam('phone', array());
	
	$detail['aapl_name'] = $phonedetail['name'];
	$detail['aapl_phone'] = $phonedetail['number'];
	$detail['aapl_email'] = $phonedetail['email'];
	$detail['aapl_message'] = $phonedetail['message'];
	$detail['aapl_date_time'] = date("d-m-Y h:i:sa");
	$detail['aapl_company'] = $phonedetail['company'];
	$detail['aapl_address'] = $phonedetail['address'];
	$opr = $table->insertRow($detail); 
	
	$html = "<html>";
	$html .= "<p>Hi</p>";
	$html .="<p>New record is created in Auction Advantage Phone Log</p>";
	$html .="<p>Here is the details:</p><br>";
	
	$html .= "<p>Name : ". $phonedetail['name']. "</p>";
	$html .= "<p>Number : ". $phonedetail['number']. "</p>";
	$html .= "<p>Email : ". $phonedetail['email']. "</p>";
	$html .= "<p>Message : ". $phonedetail['message']. "</p>";
	$html .= "<p>Company : ". $phonedetail['company']. "</p><br>";
	$html .= "<p>Address : ". $phonedetail['address']. "</p><br>";
	
	$html .= "<p>Thank You</br>";
	
	$to_name = "CGFB";
	/*$to = "info@cgfb.com.au";*/
	$to = "contact@auctionadvantage.com.au";
	
	$from_name = "Auction Advantage Phone Log";
	$from = "contact@auctionadvantage.com.au";
	
	$subject = "New Auction Advantage phone log entry";
	
    /*$to2 = "manojsoniephp@gmail.com";*/
	$to2 = "rahul@ephpsolutions.com";
	send_email($to_name, $to, $from_name, $from, $subject, $html, $attachment='');
	send_email($to_name, $to2, $from_name, $from, $subject, $html, $attachment='');
	
	$fwViewData['message'] = "Your details has been saved successfully....";
	
}

