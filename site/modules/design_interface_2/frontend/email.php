<?php
$fwMainView = 'file:' . getcwd() . '/email.tpl';

$tableTemp = new Fw_Db_Table('email_template');

//$email = $_SESSION['attach']['email_name'];
$email = $fwRequest->getparam('to', '');

$opr = $fwRequest->getparam('opr', '');
$temp_id = $fwRequest->getparam('temp_id', '');
$fwViewData['from'] = SITE_EMAIL_SEND;
$fwViewData['to'] = $email;

$email_sql = "SELECT bcust_id, bcust_fname, bcust_lname, bcust_misc_email1, bcust_misc_email2 FROM bus_customers WHERE bcust_misc_email1 = '".$email."' OR bcust_misc_email1 = '".$email."'";

$email_data = $fwDb->queryOne($email_sql);

$logged_usename = $_SESSION['user']['user_name'];
$load_temp = $fwRequest->getParam('load_temp', 	'');
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
	$to = trim($fwRequest->getParam('to', ''));
	$toname = $email_data['bcust_fname']." ".$email_data['bcust_lname'];
	
	//$from = $fwRequest->getParam('from', '');
	$from = "sales@turnkeystudios.com.au";	
	$fromname = FROM_NAME;
	$subject = $fwRequest->getParam('subject', '');
	$email_body = $fwRequest->getParam('email_body', '');
	
   // MAIL HEADERS with attachment

   $attachmentsend ="None";

	if($_SESSION['attach']['file_name'])
	{   
	$attachmentsend = $_SESSION['attach']['file_name'];

	$attachdata = unserialize($_SESSION['attach']['file_name']);

	foreach($attachdata as $k => $v)
		{

		if($v)
			{
			$finalatta = BASE_URL.FILE_PATH."files/design_interface_emails/".$v;
			$fdata[] = $finalatta;
			}
		}

$attachmentsend = serialize($fdata);		

}

$email_section = 2;

if($temp_id)
	{
	$sql = "SELECT email_template.et_section FROM email_template WHERE email_template.et_id = ".$temp_id;
	$secdata = $fwDb->queryOne($sql);
	$email_section = $secdata['et_section'];
}

if(!$attachmentsend){$attachmentsend = "None";}

if( $email_section == 1 && preg_match('/{{username}}/',$email_body)):
	$pw = rand(131, 215);
	$orgpw = $pw."new&sp";
	$detail['user_password'] = md5($orgpw);
	$thisTable = new Fw_Db_Table('users');
	$thisTable->setwhere("user_username = '{$to}' ");
	$thisTable->updateRow($detail);

   	$email_body = str_replace('{{username}}', $to, $email_body);
	$email_body = str_replace("{{password}}", $orgpw, $email_body);
endif;
				
		if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
	 	{
				
	 		email_tracking($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend, $email_section);
			$fwViewData['sent_mail'] = "Message has sent successfully.";
		}
		else
		{
			$fwViewData['sent_mail'] = "Message hasn't sent successfully.";
		}
}

if($_SESSION['attach']['file_name'])
	{
	//$fwViewData['attachments'] = addslashes($_SESSION['attach']['file_name']);
	$fwViewData['attach_file'] = unserialize($_SESSION['attach']['file_name']);
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
	$fwViewData['body'] = str_replace("{{logourl}}", $LOGO, $fwViewData['body']);
	$fwViewData['body'] = str_replace("{{currenttime}}", $cur_dt, $fwViewData['body']);

	if(!empty($temp_data['et_attachment']) && empty($fwViewData['attach_file']) )
			{

			$_SESSION['attach']['file_name'] = $temp_data['et_attachment'];	
			$fwViewData['attach_file'] = unserialize($_SESSION['attach']['file_name']);
			///$_SESSION['attach']['file_name'] = $temp_data['et_attachment'];

			}	

	}
	else
	{
	$fwViewData['body'] = $logged_usename."This electronic message together with any attachments is confidential. If you are not the intended recipient, do not copy, disclose, print or use the contents in any way. Please also advise us by return e-mail that you have received the message and then please delete from your system. We use virus scanning software but exclude all liability for viruses or anything similar in this email or any attachment.";
	}

$emailtemp_sql = "SELECT email_template.et_id, email_template.et_section, email_template.et_name, email_template.et_subject, email_type.emt_name FROM email_template
LEFT JOIN email_type ON email_type.emt_id = email_template.et_section
WHERE email_template.et_status = 1  AND email_type.emt_csa_status = 1 ORDER BY email_template.et_section ASC";

$fwViewData['email_template'] = $fwDb->query($emailtemp_sql);

$fwViewData['title'] = "Send Email";