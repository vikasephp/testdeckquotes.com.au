<?php 
require_once(MODULES_DIR . 'common.init.php');
$fwMainView = 'default/default.tpl';
$fwViewData['jdata'] = 'default/jdata.tpl';
$tablePages = new Fw_Db_Table('pages');
// menu
$tablePages->setWhere("page_lineage LIKE '/" . PAGE_BOTTOM_MENU . "/%' AND page_level = 1");

$tablePages->setOrderBy('page_id ASC');
$fwViewData['menu'] = $tablePages->getRows();

if($_SESSION['user'])
	{
	$user_group = array_keys($_SESSION['user']['::groups::']);
	
	$ugroup = $user_group[0];
	$fwViewData['USER_GROUP'] = $ugroup;

	$usersql = "SELECT bcust_isbuyer, bcust_isseller, bcust_status FROM bus_customers WHERE bcust_user_id = ".$_SESSION['user']['user_id'];
	$udata = $fwDb->queryOne($usersql);

	$fwViewData['USER_STATUS'] = $udata['bcust_status'];

	}
 /*--------------------------------SCO parameters----------------------------------------*/

 
$page_id = (int)$fwRequest->getparam('page_id', 0);

if ($page_id > 0)
{
	$tablePages = new Fw_Db_Table('pages');
	$tablePages->setWhere("page_id = $page_id");
	$fwViewData['detail'] = $tablePages->getRow();  
    $fwViewData['title'] = $fwViewData['detail']['page_title'];
    $fwViewData['description'] = $fwViewData['detail']['page_metadesc'];
    $fwViewData['keywords'] = $fwViewData['detail']['page_metakeyword'];
	$fwViewData['opr'] = $fwViewData['detail']['page_action_params'];
}

 /*--------------------------------SCO parameters----------------------------------------*/
 
 
 function curdate($d_id, $t_id)
	{
		$current_date = date('d-m-Y');
		$current_time = date('H:i');
		print($d_id."|".$current_date."|".$t_id."|".$current_time);
	}
	
	
function send_general_disclamer($fname, $lname, $email)
	{
	$tableTemp = new Fw_Db_Table('email_template'); 
	$tableTemp->setWhere("et_section = 1 AND et_status = 1 AND et_name = 'GENERAL_DISCLAIMER'");
	$email_template_data = $tableTemp->getRow();
	$toname = $fname." ".$lname;
	
	$to = $email;
	$fromname = FROM_NAME;
	$from = SITE_EMAIL_SEND;
	$subject = $email_template_data['et_subject'];
	
	$email_template_data['et_body'] = str_replace("{{buyerfname}}", $fname, $email_template_data['et_body']);
	$email_template_data['et_body'] = str_replace("{{buyerlname}}", $lname, $email_template_data['et_body']);
	
	$email_body = $email_template_data['et_body'];
	if($email_template_data['et_attachment']){
		$attach = unserialize($email_template_data['et_attachment']);foreach($attach as $k => $v){$attachment[] = BASE_URL.FILE_PATH.'files/template_files/'.$v;}}	

	//$attachment[] = BASE_URL.'files/template_files/'.$email_template_data['et_attachment'];
	$attachmentsend2 = serialize($attachment);
	
	if(send_email($toname, $to, $fromname, $from, $subject, $email_body,$attachmentsend2))
		{
		
	email_tracking($toname, $to, $fromname, $from, $subject, $email_body,$attachmentsend2, 1);
		}
$action = 1;
return $action;	  
	}	
	
function send_vender_email($fname, $lname, $email)
	{
	$tableTemp = new Fw_Db_Table('email_template'); 
	$tableTemp->setWhere('et_section = 4 AND et_status = 1');
	$email_template_data = $tableTemp->getRow();
	$toname = $fname." ".$lname;
	
	$to = $email;
	$fromname = "Sales";
	$from = "sales@businessbuys.com.au";
	$subject = $email_template_data['et_subject'];
	$email_body = "<p>".$toname."</p>".$email_template_data['et_body'];

  
//$attachment = BASE_URL.'files/template_files/'.$email_template_data['et_attachment'];
	call_mail($toname, $to, $fromname, $from, $subject, $email_body,"");
	email_tracking($toname, $to, $fromname, $from, $subject, $email_body,$attachment, 2);
$action = 1;
return $action;	  
	}


	if($_SESSION['user'])
	{
		$curugroup = array_key_exists('Administrators', $_SESSION['user']['::groups::']);	
		if($curugroup)
			{
				$fwViewData['admin_menu'] = "Show";
			}	
}

	$fwViewData['clipboardData'] = "";					
	if($_SESSION['clipboard_data'] && $_SESSION['clipboard_data'] !== 'None')		
		{
		$fwViewData['clipboardData'] = trim($_SESSION['clipboard_data']);
		}
	
$tableES = new Fw_Db_Table("enquirysource");
$tableES->setWhere("soe_status = 1");
$tableES->setOrderBy("soe_order ASC");
$fwViewData['soe'] = $tableES->getRows();	