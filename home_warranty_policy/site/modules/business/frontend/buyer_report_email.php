<?php
$fwMainView = 'file:' . getcwd() . '/buyer_report_email.tpl';
$tableTemp = new Fw_Db_Table('email_template');
$email = $_SESSION['attach']['email_name'];
$bsn_id = $fwRequest->getParam('bsn_id', 0); 

$sellers_data_sql = "SELECT business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, business.bsn_name FROM business_sellers 
			LEFT JOIN bus_customers ON bus_customers.bcust_id = business_sellers.bs_customers_id
			LEFT JOIN business ON business.bsn_id = business_sellers.bs_business_id
			 WHERE business_sellers.bs_business_id = ".$bsn_id;
		
			$sellers = $fwDb->query($sellers_data_sql);	
			$fwViewData['seller_count'] = count($sellers);
			$fwViewData['sellers'] = $sellers;	
			$tableTemp = new Fw_Db_Table('email_template'); 
			$tableTemp->setWhere('et_section = '.BUYER_REPORT_EMAIL_SECTION.' AND et_status = 1');
			$email_template_data = $tableTemp->getRow();
			
			
	$fwViewData['subject']=$email_template_data['et_subject'];
	$fwViewData['body'] =$email_template_data['et_body']; 
	
			
			
			
$logged_usename = $_SESSION['user']['user_name'];
$send_email = $fwRequest->getParam('send_email', '');

if($send_email)
	{
	$seller_id = $fwRequest->getParam('seller_name', array());
	$subject = trim($fwRequest->getParam('subject', ''));
	$email_body = $fwRequest->getParam('email_body', '');
	$fromname = FROM_NAME;
	$from= SITE_EMAIL_SEND;
	$type = BUYER_REPORT_EMAIL_SECTION;
	$count = 0;
	$attachment = "None";		
	if($_SESSION['attach']['file_name'])
		{
		$attachmentpath[] = BASE_URL."reports/".$_SESSION['attach']['file_name'];
		$attachment = serialize($attachmentpath);
		}
	$fwViewData['sent_mail'] = "Email hasn't sent successfully.";		
	if($sellers)	
		{			
	foreach($sellers as $sk => $sv)
			{
			  	foreach($seller_id as $k => $v)
						{
						 if($sv['bs_customers_id'] == $v)
							{
								$email_body = str_replace("{{sellerfname}}", $sv['bcust_fname'], $email_body);
								$email_body = str_replace("{{sellerlname}}", $sv['bcust_lname'], $email_body);
								$email_body = str_replace("{{businessname}}", $sv['bsn_name'], $email_body);
	
								$toname = $sv['bcust_fname']." ".$sv['bcust_lname'];
								$email = $sv['bcust_misc_email1'];

								if(send_email($toname, $email, $fromname, $from, $subject, $email_body, $attachment))
									{
									email_tracking($toname, $email, $fromname, $from, $subject, $email_body, $attachment, $type);
									}
							$count++;
							
							}
						
						}
			
			
			}
	$fwViewData['sent_mail'] = "Email has sent successfully.";
			
		}

}

if($_SESSION['attach']['file_name'])
	{
	$fwViewData['attach_file'] = $_SESSION['attach']['file_name'];
	}
else{
$fwViewData['attach_file']="";
}
$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['title'] = "Send Email";
