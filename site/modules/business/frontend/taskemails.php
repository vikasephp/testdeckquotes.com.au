<?php
$fwMainView = 'file:' . getcwd() . '/taskemails.tpl';
$tableTemp = new Fw_Db_Table('email_template');
$opr = $fwRequest->getparam('opr', '');
$bt_id = $fwRequest->getparam('bt_id', '');
$bid = $fwRequest->getparam('bid', '');
$fwViewData['close_win'] = 0;
$sens_email = $fwRequest->getparam('send_email', '');

if($sens_email)
	{
if($bid)
{
$email_sql = "SELECT business_sellers.bs_business_id, business.bsn_id, business.bsn_name, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2 FROM business_sellers 
				LEFT JOIN business ON business.bsn_id = business_sellers.bs_business_id 
				LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id WHERE  business_sellers.bs_business_id = ".$bid;
$email_data = $fwDb->query($email_sql);

if($bt_id > 0)
	{
	$tableTemp->setWhere('et_id = '.$bt_id." AND et_status = 1");
	$temp_data= $tableTemp->getRow();
	$fwViewData['temp_id']=$temp_data['et_id'];
	$fwViewData['subject']=$temp_data['et_subject'];	
	}
if(!empty($temp_data))
	{
	$from = SITE_EMAIL_SEND;
	$fromname = FROM_NAME;
	

		$attachmentsend2 = '';
   // MAIL HEADERS with attachment
if(!empty($temp_data['et_attachment']))
{
	$attdata = unserialize($temp_data['et_attachment']);

	if($attdata && is_array($attdata))
		{
	foreach($attdata as $k => $v)
		{
			$finalatta = BASE_URL.FILE_PATH."files/template_files/".$v;
			$attachmentsend[] = $finalatta;
		}
	}	
}


foreach($email_data as $k => $v)
{
	$to = $v['bcust_misc_email1'];
	//$to = "dhirephp@gmail.com";
	$toname = $v['bcust_fname']." ".$v['bcust_lname'];


	$fwViewData['body'] = str_replace("{{customerfname}}", $v['bcust_fname'], $temp_data['et_body']);
	$fwViewData['body'] = str_replace("{{customerfname}}", $v['bcust_lname'], $fwViewData['body']);
	
	$fwViewData['body'] = str_replace("{{projectname}}", $v['bsn_name'], $fwViewData['body']);
	$fwViewData['body'] = str_replace("{{logourl}}", $LOGO, $fwViewData['body']);
	$fwViewData['body'] = str_replace("{{currenttime}}", $cur_dt, $fwViewData['body']);
	$subject = $fwViewData['subject'];
	$email_body = $fwViewData['body'];
	

	if($attachmentsend)
		{
			$attachmentsend2 = serialize($attachmentsend);	
		}
	
		
    if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend2))
	 	{
		email_tracking($toname,$to, $fromname, $from, $subject, $email_body,$attachmentsend2, 2);
		$fwViewData['sent_mail'] = "Message has sent successfully.";
		}else
		{
		$fwViewData['sent_mail'] = "Message hasn't sent successfully.";
		}
	}
}else{$fwViewData['sent_mail'] = "Message couldn't sent.";}			
		
		
$fwViewData['close_win'] = 1;
}
}
$fwViewData['bt_id'] =  $bt_id;
$fwViewData['bid'] =  $bid;

$fwViewData['title'] = "Send Task Email";
