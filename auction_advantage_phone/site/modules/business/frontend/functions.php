<?php 
$opr = $fwRequest->getParam('opr', '');
$bsnid = $fwRequest->getParam('busid', 0);
$tableemailtemp = new Fw_Db_Table('email_template');
$tableusers = new Fw_Db_Table('users');
$counter = 0;
if($opr):
	switch($opr):
		case 'recpro':
		$tableemailtemp->setWhere("et_name = 'RECENT_PROJECT' ");	
		$message = "Resent projects sent successfully.";
		break;
		
		case 'procat':
		$tableemailtemp->setWhere("et_name = 'PRODUCTS' ");
		$message = "Product Catalogues sent successfully.";
		break;		
		
		case 'sergua':
		$tableemailtemp->setWhere("et_name = 'SERVICE_GUARANTEES' ");
		$message = "Service Guarantees sent successfully.";
		break;
		
		case 'apps':
		$tableemailtemp->setWhere("et_name = 'APPRAISALS_SURVEY' ");
		$message = "Appraisals Survey has successfully.";
		break;
		
		case 'undapp':
		$tableemailtemp->setWhere("et_name = 'UNDERSTAND_APPROVALS_ACT' ");
		$message = "Understand Approvals ACT sent successfully.";
		break;
					
		default:
		$tableemailtemp->setWhere("et_name IN ('RECENT_PROJECT', 'PRODUCTS', 'SERVICE_GUARANTEES', 'APPRAISALS_SURVEY', 'UNDERSTAND_APPROVALS_ACT') ");
		$message = "All email sent successfully.";
	endswitch;
	if($bsnid > 0):
			
$sellersql = "SELECT business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 FROM business_sellers 
			  LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			  WHERE business_sellers.bs_business_id = ".$bsnid;
	  			  
$userData= $fwDb->query($sellersql);	
$edata = $tableemailtemp->getRows();

$fromname = FROM_NAME;
$from = SITE_EMAIL_SEND;
$email_section = 5;
$tedata['attachmentsend']='';

	if($edata && $userData):	
			foreach($edata as $key => $val):
				foreach($userData as $k => $v):					
		
						$tedata['subject'] = $val['et_subject'];
						$tedata['email_body'] = $val['et_body'];						
						$tedata['toname'] = $v['bcust_fname']." ".$v['bcust_lname'];		
						$tedata['to'] = $v['bcust_misc_email1'];
					
					
						if($val['et_attachment']):
							$att = unserialize($val['et_attachment']);	
								foreach($att as $av):
										$attdata[] = BASE_URL.'files/template_files/'.$av;
								endforeach;
						  if($attdata): $tedata['attachmentsend'] = serialize($attdata); endif;	
						endif;
					
										
						
					//$tedata['to'] = "dharmendrap@ephpsolutions.com";
					
					if(send_email($tedata['toname'],$tedata['to'], $fromname, $from, $tedata['subject'], $tedata['email_body'], $tedata['attachmentsend']))
						{
						email_tracking($tedata['toname'],$tedata['to'], $fromname, $from, $tedata['subject'], $tedata['email_body'],$tedata['attachmentsend'], $email_section);
						$counter++;	
						unset($edata);	
						}
		

									
				endforeach;		
			endforeach;							
	endif;	
endif;
endif;
echo $message;
exit;


		