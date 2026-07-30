<?php
$tableTemp = new Fw_Db_Table('email_template');
$email = $_SESSION['attach']['email_name'];
$opr = $fwRequest->getparam('opr', '');
$cust_id = $fwRequest->getparam('cust_id', 0);

if($cust_id > 0)
{
$email_sql = "SELECT bcust_id, bcust_fname, bcust_lname, bcust_misc_email1, bcust_misc_email2 FROM bus_customers WHERE bcust_id = ".$cust_id;
$fwViewData['custdata'] = $fwDb->queryOne($email_sql);
}
$logged_usename = $_SESSION['user']['user_name'];
$load_temp = $fwRequest->getParam('load_temp', 	'');
$attachment = $fwRequest->getParam('attachment', '');
$removeattachment = $fwRequest->getParam('removeattachment', '');
$send_email = $fwRequest->getParam('send_email', '');

$fwViewData['close_win'] = 0;
if($opr)
	{
	
	switch($opr)
		{
		case 'gd':
		$tableTemp->setWhere('et_section = 1 AND et_status = 1');
		$fwViewData['title'] = "Send GD Email";
		$email_section = 1;
		break;
		
		
		case 'BFinance':
		$tableTemp->setWhere("et_name = 'Buyer Finance' AND et_status = 1");
		$fwViewData['title'] = "Send Buyer Finance Email";
		$email_section = 2;
		break;
		
		case 'BInfo':
		$tableTemp->setWhere("et_name = 'Free Buyer Info' AND et_status = 1");
		$fwViewData['title'] = "Send Free Buyer Info Email";
		$email_section = 2;
		break;
		
		
		case 'BSurvey':
		$tableTemp->setWhere("et_name = 'Buyer Survey' AND et_status = 1");
		$fwViewData['title'] = "Send Buyer Survey Email";
		$email_section = 2;
		break;
		
		case 'BQuestion':
		$tableTemp->setWhere("et_name = 'Business Question' AND et_status = 1");
		$fwViewData['title'] = "Send Business Question Email";
		$email_section = 2;
		break;
		
		case 'close':
		unset($_SESSION['attach']);
		$fwViewData['close_win'] = 1;
		break;
			
				
		default:
		$tableTemp->setWhere('et_section = 1 AND et_status = 1');
		$fwViewData['title'] = "Send Email";
		$email_section = 2;
		break;
		}
		
	$temp_data= $tableTemp->getRow();
	$fwViewData['temp_id']=$temp_data['et_id'];
	$fwViewData['subject']=$temp_data['et_subject'];
	
	$fwViewData['body'] = str_replace("{{buyerfname}}", $fwViewData['custdata']['bcust_fname'], $temp_data['et_body']);
	$fwViewData['body'] = str_replace("{{buyerlname}}", $fwViewData['custdata']['bcust_lname'], $fwViewData['body']);
	$fwViewData['body'] = str_replace("{{logourl}}", $LOGO, $fwViewData['body']);
	$fwViewData['body'] = str_replace("{{currenttime}}", $cur_dt, $fwViewData['body']);	
	$_SESSION['attach']['file_name'] = $temp_data['et_attachment'];
	}
if($send_email)
	{
	$to = trim($fwRequest->getParam('to', ''));
	$toname =trim($fwRequest->getParam('toname', ''));
	$from =SITE_EMAIL_SEND;
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
			$finalatta = BASE_URL.FILE_PATH."files/template_files/".$v;
			$fdata[] = $finalatta;
			}
		}
$attachmentsend = serialize($fdata);			
}

if(!$attachmentsend){$attachmentsend = "None";}

     if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
	 	{
		 email_tracking($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend, $email_section);
		$fwViewData['sent_mail'] = "Message has sent successfully.";
		unset($_SESSION['attach']);
		$fwViewData['close_win'] = 2;	
		}else
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
 	if(!empty($temp_data['et_attachment']) && empty($fwViewData['attach_file']))
			{
			$_SESSION['attach']['file_name'] = $temp_data['et_attachment'];	
			$fwViewData['attach_file'] = unserialize($_SESSION['attach']['file_name']);
			///$_SESSION['attach']['file_name'] = $temp_data['et_attachment'];
			}	