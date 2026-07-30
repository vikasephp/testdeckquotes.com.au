<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/

require_once(MODULES_DIR . 'frontend.init.php');
// force login
$fwAuthGroup->requireAtLeast('Administrators', 'Users', 'Employees');

// module names
$MODULE_SINGULAR = 'Customer';
$MODULE_PLURAL = 'Customers';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'bus_customers';
$ID = 'bcust_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['deletecust'] = $Fusebox['circuit'] . '.deletecust';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['listdata'] = $Fusebox['circuit'] . '.listdata';
$XFA['detaildata'] = $Fusebox['circuit'] . '.detaildata';
$XFA['date'] = $Fusebox['circuit'] . '.date';
$XFA['sale'] = $Fusebox['circuit'] . '.sale';
$XFA['saledelete'] = $Fusebox['circuit'] . '.saledelete';
$XFA['common'] = $Fusebox['circuit'] . '.common';
$XFA['functions'] = $Fusebox['circuit'] . '.functions';
$XFA['custdetail'] = $Fusebox['circuit'] . '.custdetail';
$XFA['buyermatches'] = $Fusebox['circuit'] . '.buyermatches';
$XFA['email'] = $Fusebox['circuit'] . '.email';
$XFA['custview'] = $Fusebox['circuit'] . '.custview';
$XFA['users'] = $Fusebox['circuit'] . '.users';
$XFA['email_attachment'] = $Fusebox['circuit'] . '.email_attachment';


function generate_bmfid($id)	
		{
	$tableTemp = new Fw_Db_Table('byer_matches_form'); 
	$tableTemp->setWhere('bmf_cust_id = '.$id);
	$formdata = $tableTemp->getRow();
		if($formdata){$retid = $formdata['bmf_form_id'] + 1;}else{$retid = 1;}
return $retid ;
		
		}	
		
function send_all_dossaire($cust_id)
		{
		$fw = new Fw_Db();
		$tableenq = new Fw_Db_Table('byer_enquiry');
		$custsql = "SELECT bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 FROM bus_customers WHERE bcust_id = ".$cust_id;
		$custdata = $fw ->queryOne($custsql);

		$bussql = "SELECT byer_enquiry.be_business_id, byer_enquiry.be_id FROM  byer_enquiry WHERE byer_enquiry.be_customer_id = ".$cust_id;	
		
		$businessenq = $fw ->query($bussql);
		
	
		if($businessenq)
				{
					
					foreach($businessenq as $k1 => $v1)
							{
							$tableTemp = new Fw_Db_Table('business'); 
							$tableTemp->setWhere('bsn_id = '.$v1['be_business_id']);
							$busdata = $tableTemp->getRow();
							if($busdata['bsn_auto_edossier'] == 1)	
							   {			
								if($v1['be_business_id'])
									{	
									$edsql = "SELECT e_dossier_templates.*, business.bsn_id FROM e_dossier_templates 
									LEFT JOIN business ON e_dossier_templates.edt_bus_id = business.bsn_id
									WHERE e_dossier_templates.edt_bus_id = ".$v1['be_business_id'];
					
								$tempadata = $fw->query($edsql);
					
									if(!empty($tempadata))
										{
										$count =0;								
										$from = SITE_EMAIL_SEND;
										$fromname = FROM_NAME;
									
									
										
								foreach($tempadata as $k => $v)
										{		
										$subject = $v['edt_title'];
					
											$email_body = $v['edt_body'];
											$attachmentsend ="None";
											$email_section = 9;
								$toname = $custdata['bcust_fname']." ".$custdata['bcust_lname'];
								$to = $custdata['bcust_misc_email1'];
								
								$edddata['be_sed_date'] = date('Y-m-d');
								$edddata['be_sed_time'] = date('H:i:s');
								$edddata['be_sed_comments'] = "Auto sent, \nEmailed\n".$to;
								$edddata['be_sed_user'] = $_SESSION['user']['user_id'];

							
							   if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
										{
											//e-dossire tracking end
										$edossierlogs = new Fw_Db_Table('e_dossier_log'); 
										$edlogdata['edl_cust_id'] = $custdata['bcust_id'];
										$edlogdata['edl_bus_id'] = $v['edt_bus_id'];
										//$edlogdata['edl_be_id'] = $table_id;	
										$edlogdata['edl_temp_id'] = $v['edt_id'];
										$edlogdata['edl_to'] = $to;
										$edlogdata['edl_toname'] = $toname;
										$edlogdata['edl_user_id'] = $_SESSION['user']['user_id'];
										$edlogdata['edl_title'] = $subject;
										$edlogdata['edl_body'] = $email_body;
										$edlogdata['edl_ip'] = $_SERVER['REMOTE_ADDR'];				
										$edossierlogs->insertRow($edlogdata);
											//e-dossire tracking end
											email_tracking($toname,$to, $fromname, $from, $subject, $email_body,$attachmentsend, $email_section);
											$count++;	
															 
											$tableenq->setWhere("be_id = ".$v1['be_id']);
											$id = $tableenq->updateRow($edddata);
											unset($edddata);
										}
									}				
								}
							}
						}
					}
				}
		return $count;
		}	
		
		
function send_GD_thankyou_email($cust_id)
		{
		$fw = new Fw_Db();
		$tablecust = new Fw_Db_Table('bus_customers');
		$tableetemp = new Fw_Db_Table('email_template');
		$tablecust->setWhere("bcust_id = ".$cust_id);
		$custadata = $tablecust->getRow();
		
		$tableetemp->setWhere("et_name = 'GENERAL_DISCLAIMER_THANKYOU' AND et_status = 1");
		$tempdata = $tableetemp->getRow();
		
		if($tempdata && $custadata)
			{
			
			$from = SITE_EMAIL_SEND;
			$fromname = FROM_NAME;
			
			$subject = $tempdata['et_subject'];
			$email_body = $tempdata['et_body'];
			
			
				$email_body = str_replace("{{buyerfname}}", $custadata['bcust_fname'], $tempdata['et_body']);
				$email_body = str_replace("{{buyerlname}}", $custadata['bcust_lname'], $email_body);
				$email_body = str_replace("{{logourl}}", $LOGO, $email_body);
				$email_body = str_replace("{{currenttime}}", $cur_dt, $email_body);	
			$attachmentsend ="None";
			$email_section = 1;
			$toname = $custadata['bcust_fname']." ".$custadata['bcust_lname'];
			$to = $custadata['bcust_misc_email1'];
			
							   if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
										{
										email_tracking($toname,$to, $fromname, $from, $subject, $email_body,$attachmentsend, $email_section);
										}
			}
		
		return true;
		} 		
		
		
		