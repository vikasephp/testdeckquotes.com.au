<?php  
$tableTemp = new Fw_Db_Table('email_template');
$fwMainView = 'file:' . getcwd() . '/email.tpl';
$tableothercontact = new Fw_Db_Table('othercontact');
//$email = $_SESSION['attach']['email_name'];
$email = $fwRequest->getparam('email', '');
$opr = $fwRequest->getparam('opr', '');
$temp_id = $fwRequest->getparam('temp_id', '');
$fwViewData['from'] = SITE_EMAIL_SEND;
$mailmearge = false;
if($email){
$email_sql = "SELECT bcust_id, bcust_fname, bcust_lname, bcust_misc_email1, bcust_misc_email2 FROM bus_customers WHERE bcust_misc_email1 = '".$email."' OR bcust_misc_email2 = '".$email."'";
$email_data = $fwDb->queryOne($email_sql);
}
if($email_data['bcust_id'])
	{
	$tableothercontact->setWhere("oc_cust_id = ".$email_data['bcust_id']." AND oc_noti_enable = 1");
	$getcontacts = $tableothercontact->getRows();

if($getcontacts){
	foreach($getcontacts as $val)
			{
				if(filteremail($val['oc_email']) == filteremail($email))
					{
					
					$customerfname = trim($email_data['bcust_fname']." ".$val['oc_fname']);
					$customerlname = trim($email_data['bcust_lname']." ".$val['oc_lname']);
					$customerfullname = trim($email_data['bcust_fname']." ".$email_data['bcust_lname']."  ".$val['oc_fname']." ".$val['oc_lname']);
					$mailmearge = true;
					
					}else{
					$email = $email.";".filteremail($val['oc_email']);
					$mailmearge = false;
					}
			}
}else{
					$customerfname = trim($email_data['bcust_fname']);
					$customerlname = trim($email_data['bcust_lname']);
					$customerfullname = trim($email_data['bcust_fname']." ".$email_data['bcust_lname']);
					$mailmearge = true;
		}

	}

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
	$from = $fwRequest->getParam('from', '');
	$fromname = FROM_NAME;
	$subject = $fwRequest->getParam('subject', '');
	$email_body = $fwRequest->getParam('email_body', '');
	
	if($mailmearge)
		{
		$email_body = str_replace("{{customerfname}}", $customerfname, $email_body);
		$email_body = str_replace("{{customerlname}}", $customerlname, $email_body);
		$email_body = str_replace("{{customerfullname}}", $customerfullname, $email_body);
		}else{
		if($getcontacts){
		foreach($getcontacts as $key => $val)
				{
					$respemail['fname'] = $val['oc_fname'];		
					$respemail['lname'] = $val['oc_lname'];
					$respemail['email'] = $val['oc_email'];
					$email_body1="";		
					$email_body1 = str_replace("{{customerfname}}", $respemail['fname'], $email_body);
					$email_body1 = str_replace("{{customerlname}}", $respemail['lname'], $email_body1);
					$email_body1 = str_replace("{{customerfullname}}", $respemail['fname']." ".$respemail['lname'], $email_body1);
					$respemail['email_body'] = $email_body1;
					$respemails[] = $respemail;	
				}
				
		if($email_data)	
			{
					$respemail['fname'] = $email_data['bcust_fname'];		
					$respemail['lname'] = $email_data['bcust_lname'];
					$respemail['email'] = $email_data['bcust_misc_email1'];
				
					$email_body2 = str_replace("{{customerfname}}", $email_data['bcust_fname'], $email_body);
					$email_body2 = str_replace("{{customerlname}}", $email_data['bcust_lname'], $email_body2);
					$email_body2 = str_replace("{{customerfullname}}", $email_data['bcust_fname']." ".$email_data['bcust_lname'], $email_body2);
					$respemail['email_body'] = $email_body2;
					$respemails[] = $respemail;
			}		
		}
		
    }
	

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
$email_section = 2;

if($temp_id)
	{
	$sql = "SELECT email_template.et_section FROM email_template WHERE email_template.et_id = ".$temp_id;
$secdata = $fwDb->queryOne($sql);
$email_section = $secdata['et_section'];
}

if(!$attachmentsend){$attachmentsend = "None";}
$email_body = stripslashes($email_body);
if($mailmearge)
	{
		if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
			{ email_tracking($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend, $email_section);
			  $fwViewData['sent_mail'] = "Message has sent successfully.";
			}else{
			  $fwViewData['sent_mail'] = "Message hasn't sent successfully.";
			}
	}else{
		if($respemails)
			{
			$fwViewData['sents'] = 0;
				foreach($respemails as $val)		
						{
						$toname = $val['fname']." ".$val['lname'];
						$to = $val['email'];
						$email_body = $val['email_body'];
						
						if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
							{ email_tracking($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend, $email_section);
							  $fwViewData['sent_mail'] = "Message has sent successfully.";
							}else{
							  $fwViewData['sent_mail'] = "Message hasn't sent successfully.";
							}
						$fwViewData['sents']++;	
							
						}
			}
	}	
	
   /* if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
			{ email_tracking($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend, $email_section);
			  $fwViewData['sent_mail'] = "Message has sent successfully.";
			}else{
			  $fwViewData['sent_mail'] = "Message hasn't sent successfully.";
			}*/
}

if($_SESSION['attach']['file_name']){ $fwViewData['attach_file'] = unserialize($_SESSION['attach']['file_name']); }
else{ $fwViewData['attach_file']="";}
if($load_temp){	$temp_id = $fwRequest->getParam('temp_id', '');	}
if($temp_id > 0)
	{

	$tableTemp->setWhere('et_id = '.$temp_id);
	$temp_data= $tableTemp->getRow();
	$fwViewData['temp_id']=$temp_data['et_id'];
	$fwViewData['subject']=$temp_data['et_subject'];
	$fwViewData['body'] = $temp_data['et_body'];
	if($mailmearge){
	//$fwViewData['body'] = str_replace("{{customerfname}}", $customerfname, $fwViewData['body']);
	//$fwViewData['body'] = str_replace("{{customerlname}}", $customerlname, $fwViewData['body']);
	//$fwViewData['body'] = str_replace("{{customerfullname}}", $customerfullname, $fwViewData['body']);
	
	}else{	
	//$fwViewData['body'] = str_replace("{{customerfname}}", $email_data['bcust_fname'], $fwViewData['body']);
	//$fwViewData['body'] = str_replace("{{customerlname}}", $email_data['bcust_lname'], $fwViewData['body']);
	}
	$fwViewData['body'] = str_replace("{{logourl}}", $LOGO, $fwViewData['body']);
	$fwViewData['body'] = str_replace("{{currenttime}}", $cur_dt, $fwViewData['body']);
		if(!empty($temp_data['et_attachment']) && empty($fwViewData['attach_file']) )
			{
			$_SESSION['attach']['file_name'] = $temp_data['et_attachment'];	
			$fwViewData['attach_file'] = unserialize($_SESSION['attach']['file_name']);
			}	
	}
	else
	{
	$fwViewData['body'] = '<span style="color: #000;">This electronic message together with any attachments is confidential. If you are not the intended recipient, do not copy, disclose, print or use the contents in any way. Please also advise us by return e-mail that you have received the message and then please delete from your system. We use virus scanning software but exclude all liability for viruses or anything similar in this email or any attachment.</span>';
	}
$emailtemp_sql = "SELECT email_template.et_id, email_template.et_section, email_template.et_name, email_template.et_subject, email_type.emt_name FROM email_template
LEFT JOIN email_type ON email_type.emt_id = email_template.et_section 
 WHERE email_template.et_status = 1  AND email_type.emt_csa_status = 1 ORDER BY email_template.et_section ASC";
$fwViewData['email_template'] = $fwDb->query($emailtemp_sql);
$fwViewData['title'] = "Send Email";
$fwViewData['to'] = $email;