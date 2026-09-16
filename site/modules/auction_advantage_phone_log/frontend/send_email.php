<?php
$fwMainView = 'file:' . getcwd() . '/send_email.tpl';
$this_id = (int)$fwRequest->getParam('aapl_id', 0);


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $to = $fwRequest->getParam('email', array());
	$textmsg = $fwRequest->getParam('textmsg', '');
	
	
	$tablePhone = new Fw_Db_Table('auction_advantage_phone_log');
	$tablePhone->setWhere("aapl_id = $this_id");
	$detail = $tablePhone->getRow();

	$html = "<html>";
	$html .= "<p>Hi</p>";
	$html .= "<p>Here is the Auction Advantage phone log details:</p>";
	$html .= "<p>Name : ".$detail['aapl_name']."</p>";
	$html .= "<p>Company : ".$detail['aapl_company']."</p>";
	$html .= "<p>Phone : ".$detail['aapl_phone']."</p>";
	$html .= "<p>Email : ".$detail['aapl_email']."</p>";
	$html .= "<p>Message : ".$detail['aapl_message']."</p><br>";
	$html .= "<p>Text Message : ".$textmsg."</p><br>";
	
	$html .="<p>Thank You<br>";
	$html .= "CCBS & Auction Advantage Team</p>";
	$html .= "</html>";
	
	$toname = "Hi";
	
	//send_email($toname, $to, 'CGFB', 'info@cgfb.com.au', 'Phone Log Details', $html, $attachment='');
	send_email($toname, $to, 'Auction Advantage', 'contact@auctionadvantage.com.au', 'Auction Advantage Phone Log Details', $html, $attachment='');
	
	$fwViewData['opr'] = 'Email has been send succcessfully....';
		
	
}


$sqlc = "select cs_primary_email from contacts where cs_company =  2 order by cs_primary_email ";
$fwViewData['email_list'] = $fwDb->query($sqlc);
