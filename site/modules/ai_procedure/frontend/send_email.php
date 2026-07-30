<?php
$fwMainView = 'file:' . getcwd() . '/send_email.tpl';
$this_id = (int)$fwRequest->getParam('ph_id', 0);


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$to = $fwRequest->getParam('email', array());
	$textmsg = $fwRequest->getParam('textmsg', '');
	
	
	$tablePhone = new Fw_Db_Table('phone_log');
	$tablePhone->setWhere("ph_id = $this_id");
	$detail = $tablePhone->getRow();

	$html = "<html>";
	$html .= "<p>Hi</p>";
	$html .= "<p>Here is the phone log details:</p>";
	$html .= "<p>Name : ".$detail['ph_name']."</p>";
	$html .= "<p>Company : ".$detail['ph_company']."</p>";
	$html .= "<p>Phone : ".$detail['ph_phone']."</p>";
	$html .= "<p>Email : ".$detail['ph_email']."</p>";
	$html .= "<p>Message : ".$detail['ph_message']."</p><br>";
	$html .= "<p>Text Message : ".$textmsg."</p><br>";
	
	$html .="<p>Thank You<br>";
	$html .= "Canberra Granny Flat Builders</p>";
	$html .= "</html>";
	
	$toname = "Hi";
	
	send_email($toname, $to, 'CGFB', 'info@cgfb.com.au', 'Phone Log Details', $html, $attachment='');
	
	$fwViewData['opr'] = 'Email has been send succcessfully....';
		
	
}


$sqlc = "select cs_primary_email from contacts where cs_company =  2 order by cs_primary_email ";
$fwViewData['email_list'] = $fwDb->query($sqlc);
