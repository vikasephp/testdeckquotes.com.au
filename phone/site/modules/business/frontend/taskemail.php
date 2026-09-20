<?php
$tableTemp = new Fw_Db_Table('email_template');
$bid = $_SESSION['attach']['bus_email_id'];
$opr = $fwRequest->getparam('opr', '');
$temp_id = $fwRequest->getparam('temp_id', '');
$fwViewData['from'] = "sales@businessbuys.com.au";

if($bid)
{
$email_sql = "SELECT business_sellers.bs_business_id, business.bsn_id, business.bsn_name, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2 FROM business_sellers 
				LEFT JOIN business ON business.bsn_id = business_sellers.bs_business_id 
				LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id WHERE business_sellers.bs_business_id = ".$bid;

$email_data = $fwDb->queryOne($email_sql);

$fwViewData['to'] = $email_data['bcust_misc_email1'];
$fwViewData['to_name'] = $email_data['bcust_fname']." ".$email_data['bcust_lname'] ;
}
$logged_usename = $_SESSION['user']['user_name'];
$load_temp = $fwRequest->getParam('load_temp', '');
$attachment = $fwRequest->getParam('attachment', '');

$removeattachment = $fwRequest->getParam('removeattachment', '');
$send_email = $fwRequest->getParam('send_email', '');

$fwViewData['close_win'] = 0;
if($opr)
	{
	unset($_SESSION['attach']);
	$fwViewData['close_win'] = 1;
	}
if($send_email)
	{
	$to = $fwRequest->getParam('to', '');
	$toname = $email_data['bcust_fname']." ".$email_data['bcust_lname'];
	$from = $fwRequest->getParam('from', '');
	$fromname = "Sales";
	$subject = $fwRequest->getParam('subject', '');
	$email_body = $fwRequest->getParam('email_body', '');

   // MAIL HEADERS with attachment
$strattach =  TMP_DIR . 'email_attchment/'.$_SESSION['attach']['file_name'];
$attachmentsend = "None";
if($_SESSION['attach']['file_name'])
{
$attachmentsend = BASE_URL.'site/tmp/email_attchment/'.$_SESSION['attach']['file_name'];
}


     if(call_mail($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
	 	{
		 email_tracking($toname,$to, $fromname, $from, $subject, $email_body,$attachmentsend, 3);
		$fwViewData['sent_mail'] = "Message has sent successfully.";
		}else
		{
		$fwViewData['sent_mail'] = "Message hasn't sent successfully.";
		}
}
	
if($attachment)
	{

	$temp_id = $fwRequest->getParam('temp_id', '');	
$remove =  $fwRequest->getParam('remove_attach', '');

	
				if($_FILES['attachment']['error'] == 0)
					{
						$docfile = $_FILES['attachment']['name'];
						$file_type = $_FILES['attachment']['type'];
						
						//$datetime = trim(date('d_m_Y_H_i_'),'0');
						$docfile = $datetime.preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
						$src = $_FILES['attachment']['tmp_name'];
						$destination = TMP_DIR . 'email_attchment/'.$docfile;
									
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
								}
								else
								{
								chmod($destination, 0664);
								$_SESSION['attach']['file_name'] = $docfile;
								$_SESSION['attach']['type'] = $file_type;
								$_SESSION['attach']['size'] =  $_FILES['attachment']['size'];
							}
						
					}

}

if($removeattachment)
	{
			unset($_SESSION['attach']['file_name']);
			unset($_SESSION['attach']['type']);
			unset($_SESSION['attach']['size']);
	}

if($_SESSION['attach'])
	{
	$fwViewData['attach_file'] = $_SESSION['attach']['file_name'];
	}
else{
$fwViewData['attach_file']="";
}

if($load_temp)
	{
	$temp_id = $fwRequest->getParam('temp_id', '');	
	}

if($temp_id > 0)
	{
	$tableTemp->setWhere('et_id = '.$temp_id);
	$temp_data= $tableTemp->getRow();
	$fwViewData['temp_id']=$temp_data['et_id'];
	$fwViewData['subject']=$temp_data['et_subject'];
	
	$fwViewData['body'] = str_replace("{{buyerfname}}", $email_data['bcust_fname'], $temp_data['et_body']);
	$fwViewData['body'] = str_replace("{{buyerlname}}", $email_data['bcust_lname'], $fwViewData['body']);
	
	$fwViewData['body'] = str_replace("{{sellerfname}}", $email_data['bcust_fname'], $fwViewData['body']);
	$fwViewData['body'] = str_replace("{{sellerlname}}", $email_data['bcust_lname'], $fwViewData['body']);
	$fwViewData['body'] = str_replace("{{logourl}}", $LOGO, $fwViewData['body']);
	$fwViewData['body'] = str_replace("{{currenttime}}", $cur_dt, $fwViewData['body']);
		
		if(!empty($temp_data['et_attachment']) && empty($fwViewData['attach_file']))
			{
			$fwViewData['attach_file'] = $temp_data['et_attachment'];
			}	
	}
	else
	{
	$fwViewData['body'] = $logged_usename."
This electronic message together with any attachments is confidential. If you are not the intended recipient, do not copy, disclose, print or use the contents in any way. Please also advise us by return e-mail that you have received the message and then please delete from your system. We use virus scanning software but exclude all liability for viruses or anything similar in this email or any attachment.";
	}

$emailtemp_sql = "SELECT email_template.et_id, email_template.et_section, email_template.et_name, email_template.et_subject, email_type.emt_name FROM email_template
LEFT JOIN email_type ON email_type.emt_id = email_template.et_section
 WHERE email_template.et_section = 3 AND email_template.et_status = 1 ORDER BY email_template.et_name ASC";

$fwViewData['email_template'] = $fwDb->query($emailtemp_sql);

$fwViewData['title'] = "Send Email";
