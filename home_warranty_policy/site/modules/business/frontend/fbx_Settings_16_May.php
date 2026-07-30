<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/

require_once(MODULES_DIR . 'frontend.init.php');

$fwViewData['email_temp_vars_seller'] = array('Seller first name' => '{{sellerfname}}',
										'Seller last name' => '{{sellerlname}}',
										'Business name' => '{{businessname}}' ); 

$fwViewData['email_temp_vars_buyers'] = array('Customer first name' => '{{buyerfname}}',
										'Customer last name' => '{{buyerlname}}',
										'Customer name' => '{{businessname}}' ); 
									
										
$fwAuthGroup->forceLogin();
// force login
//$fwAuthGroup->_options['redirect'] = 'customer.home';
$fwAuthGroup->requireAtLeast('Administrators', 'Users', 'Employees');
// module names
$MODULE_SINGULAR = 'Project';
$MODULE_PLURAL = 'Projects';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'business';
$ID = 'bsn_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['date'] = $Fusebox['circuit'] . '.date';
$XFA['cust_list'] = $Fusebox['circuit'] . '.cust_list';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['listdata'] = $Fusebox['circuit'] . '.listdata';
$XFA['sellerdeatildata'] = $Fusebox['circuit'] . '.sellerdeatildata';
$XFA['delete_seller'] = $Fusebox['circuit'] . '.delete_seller';
$XFA['upload'] = $Fusebox['circuit'] . '.upload';
$XFA['fileslistdata'] = $Fusebox['circuit'] . '.fileslistdata';
$XFA['delete_files'] = $Fusebox['circuit'] . '.delete_files';
$XFA['document'] = $Fusebox['circuit'] . '.document';
$XFA['doctype_list'] = $Fusebox['circuit'] . '.doctype_list';
$XFA['docs_list'] = $Fusebox['circuit'] . '.docs_list';
$XFA['delete_docs'] = $Fusebox['circuit'] . '.delete_docs';
$XFA['delete_business'] = $Fusebox['circuit'] . '.delete_business';
$XFA['calc'] = $Fusebox['circuit'] . '.calc';

/////////////////////////////////////////////
$XFA['businessenquiry_detail'] = $Fusebox['circuit'] . '.businessenquiry_detail';
$XFA['businessenquiry_list'] = $Fusebox['circuit'] . '.businessenquiry_list';
$XFA['delete_alert'] = $Fusebox['circuit'] . '.delete_alert';
$XFA['businessalert_detail'] = $Fusebox['circuit'] . '.businessalert_detail';
$XFA['businessalert_list'] = $Fusebox['circuit'] . '.businessalert_list';
$XFA['businessalert_list'] = $Fusebox['circuit'] . '.businessalert_list';

$XFA['proposalalert_detail'] = $Fusebox['circuit'] . '.proposalalert_detail';
$XFA['proposalalert_list'] = $Fusebox['circuit'] . '.proposalalert_list';
$XFA['delete_proposalalert'] = $Fusebox['circuit'] . '.delete_proposalalert';


$XFA['delete_businessenquiry'] = $Fusebox['circuit'] . '.delete_businessenquiry';
$XFA['common'] = $Fusebox['circuit'] . '.common';
$XFA['demo'] = $Fusebox['circuit'] . '.demo';
$XFA['view'] = $Fusebox['circuit'] . '.view';
$XFA['businesscontact_detail'] = $Fusebox['circuit'] . '.businesscontact_detail';
$XFA['businesscontact_list'] = $Fusebox['circuit'] . '.businesscontact_list';
$XFA['followupdelete'] = $Fusebox['circuit'] . '.followupdelete';
$XFA['report'] = $Fusebox['circuit'] . '.report';
$XFA['delete_enq'] = $Fusebox['circuit'] . '.delete_enq';
$XFA['businessqa_list'] = $Fusebox['circuit'] . '.businessqa_list';
$XFA['businessqa_detail'] = $Fusebox['circuit'] . '.businessqa_detail';
$XFA['delete_qa'] = $Fusebox['circuit'] . '.delete_qa';
$XFA['taskemail'] = $Fusebox['circuit'] . '.taskemail';
$XFA['email_attachment'] = $Fusebox['circuit'] . '.email_attachment';
$XFA['buyer_report_email'] = $Fusebox['circuit'] . '.buyer_report_email';
$XFA['buyer_qa_email'] = $Fusebox['circuit'] . '.buyer_qa_email';
$XFA['businessematches_list'] = $Fusebox['circuit'] . '.businessematches_list';
$XFA['advert'] = $Fusebox['circuit'] . '.advert';
$XFA['email'] = $Fusebox['circuit'] . '.email';
$XFA['checklistemail'] = $Fusebox['circuit'] . '.checklistemail';
$XFA['money'] = $Fusebox['circuit'].'.money';
$XFA['calcadd'] = $Fusebox['circuit'].'.calcadd';
$XFA['emailview'] = $Fusebox['circuit'] . '.emailview';

$XFA['not_required_save'] = $Fusebox['circuit'] . '.not_required_save';

$XFA['msteam_detail'] = $Fusebox['circuit'] . '.msteam_detail';
$XFA['msteam_list'] = $Fusebox['circuit'] . '.msteam_list';
$XFA['delete_msteam'] = $Fusebox['circuit'] . '.delete_msteam';

$XFA['meeting_recording_detail'] = $Fusebox['circuit'] . '.meeting_recording_detail';
$XFA['meeting_recording_list'] = $Fusebox['circuit'] . '.meeting_recording_list';
$XFA['show_meetingrecording_detail'] = $Fusebox['circuit'] . '.show_meetingrecording_detail';
$XFA['delete_recorded_meeting'] = $Fusebox['circuit'] . '.delete_recorded_meeting';


function send_auto_business_report($bsn_id, $filename)
			{
			$fwDb = new Fw_Db();
			$sellers_data_sql = "SELECT business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, business.bsn_name FROM business_sellers 
			LEFT JOIN bus_customers ON bus_customers.bcust_id = business_sellers.bs_customers_id
			LEFT JOIN business ON business.bsn_id = business_sellers.bs_business_id
			 WHERE business_sellers.bs_business_id = ".$bsn_id;
		
			$sellers = $fwDb->query($sellers_data_sql);	
				
			$tableTemp = new Fw_Db_Table('email_template'); 
			$tableTemp->setWhere('et_section = '.BUYER_REPORT_EMAIL_SECTION.' AND et_status = 1');
			$email_template_data = $tableTemp->getRow();	
				
				
			$fromname = FROM_NAME;
			$from= SITE_EMAIL_SEND;
			$subject=trim($email_template_data['et_subject']);
			$attach_file[] = BASE_URL."reports/".$filename;
			$attachment= serialize($attach_file);	
			$type = BUYER_REPORT_EMAIL_SECTION;
			$count = 0;
			if($sellers && $email_template_data)
				{
			foreach($sellers as $k => $v)
					{
					$toname = $v['bcust_fname']." ".$v['bcust_lname'];
					$to = trim($v['bcust_misc_email1']);
					$emailbody = str_replace("{{sellerfname}}", $v['bcust_fname'], $email_template_data['et_body']);
					$emailbody = str_replace("{{sellerlname}}", $v['bcust_lname'], $emailbody);	
					$emailbody = str_replace("{{businessname}}", $v['bsn_name'], $emailbody);	
					
					if(send_email($toname, $to, $fromname, $from, $subject, $emailbody, $attachment))
						{
						email_tracking($toname, $to, $fromname, $from, $subject, $emailbody, $attachment, $type);
						}
					$count++;						
					}
				}	
		return $count;	

			}
		
function send_auto_answer_to_buyers($bsn_id, $filename)
	{
	$fwDb = new Fw_Db();
	$buyersql = "SELECT byer_enquiry.be_id, byer_enquiry.be_business_id, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_id, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 FROM byer_enquiry LEFT JOIN bus_customers ON bus_customers.bcust_id = byer_enquiry.be_customer_id WHERE byer_enquiry.be_status = 1 AND byer_enquiry.be_answer_required = 1 AND byer_enquiry.be_business_id = ".$bsn_id;
		
	$buyers = $fwDb->query($buyersql);

	$tableTemp = new Fw_Db_Table('email_template'); 
	$tableTemp->setWhere('et_section = '.BUYER_REPORT_QA_SECTION.' AND et_status = 1');
	$email_template_data = $tableTemp->getRow();
	

		
	$pdfattach[] = $filename;
	$attachment= serialize($pdfattach);
	$fromname = FROM_NAME;
	$from= SITE_EMAIL_SEND;
	$count = 0;

	foreach($buyers as $k => $v)
			{
	$subject =$email_template_data['et_subject'];
	$et_body = str_replace("{{buyerfname}}", $v['bcust_fname'], $email_template_data['et_body']);
	$et_body = str_replace("{{buyerlname}}", $v['bcust_lname'], $et_body);
	$et_body = str_replace("{{businessname}}", $busdata['bsn_name'], $et_body);
	$email_body = $et_body;

	$toemail = trim($v['bcust_misc_email1']);
	$toname = $v['bcust_fname']." ".$v['bcust_lname'];
	
		$count ++;

		if(send_email($toname, $toemail, $fromname, $from, $subject, $email_body, $attachment))
			{
			email_tracking($toname, $toemail, $fromname, $from, $subject, $email_body, $attachment, BUYER_REPORT_QA_SECTION);
			}
	}
return $count;	  
	}			

