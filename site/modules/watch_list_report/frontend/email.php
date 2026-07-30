<?php
$fwMainView = 'file:' . getcwd() . '/email.tpl';
$fname = $fwRequest->getParam('fname', '');
$email_id = $fwRequest->getParam('email_id', '');
$address = $fwRequest->getParam('address', '');

$fwViewData['title'] = 'Send Email';
$fwViewData['fname'] = $fname;
$fwViewData['email_id'] = $email_id;
$fwViewData['address'] = $address;


	$bus_id = $fwRequest->getparamget('bus_id', 0);
	$submit = $fwRequest->getparam('sendemail','');
	
	
	
	if(!empty($submit))
	{
		
		$detail = $fwRequest->getparam('send',array());
		//$detail['sf_notes'] = stripslashes($detail['sf_notes']);
		
		$toname = $detail['name'];
		$to = $detail['to'];
		$fromname = 'CGFB';
		$from = 'info@cgfb.com.au';
		$subject = $detail['subject'];
		$email_body = $detail['message'];
		$attachment ='';
		
		//$to = "manojsoniephp@gmail.com";
		
		if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachment))
				{
					$fwViewData['opr'] = "Email Has been sent successfully!";
				}
		
		send_email('Frank Walmsley','clientservices@cgfb.com.au', $fromname, $from, $subject, $email_body, $attachment);
    	
		
	}
