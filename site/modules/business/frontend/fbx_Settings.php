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

$XFA['proposalalert_detail'] = $Fusebox['circuit'] . '.proposalalert_detail';
$XFA['proposalalert_list'] = $Fusebox['circuit'] . '.proposalalert_list';
$XFA['delete_proposalalert'] = $Fusebox['circuit'] . '.delete_proposalalert';

$XFA['delete_businessenquiry'] = $Fusebox['circuit'] . '.delete_businessenquiry';
$XFA['common'] = $Fusebox['circuit'] . '.common';
$XFA['common3'] = $Fusebox['circuit'] . '.common3';
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
$XFA['client_overview'] = $Fusebox['circuit'] . '.client_overview';
$XFA['action_items_home'] = $Fusebox['circuit'] . '.action_items_home';
$XFA['action_items_detail'] = $Fusebox['circuit'] . '.action_items_detail';
$XFA['site_progress_report_home'] = $Fusebox['circuit'] . '.site_progress_report_home';
$XFA['user_logon_home'] = $Fusebox['circuit'] . '.user_logon_home';
$XFA['phone_log_frame'] = $Fusebox['circuit'] . '.phone_log_frame';


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

function auto_email_auto_text($taskid)
{
  $fwDb = new Fw_Db();	
  $emsql_1 = "select business_tasks.bt_bsn_id, business_tasks.bt_task_id , business_tasks.bt_complete
              from business_tasks where business_tasks.bt_id = ".$taskid;	
 
  $emdata_1 = $fwDb->queryOne($emsql_1);
  $comp = $emdata_1['bt_complete'] ;

  $sql_2 = "SELECT  business_sellers.bs_business_id,  bus_customers.bcust_fname, bus_customers.bcust_lname,
            bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2, bus_customers.bcust_misc_moble, 
	    business.bsn_id, business.bsn_name
	    from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	    where business_sellers.bs_business_id = ".$emdata_1['bt_bsn_id'];

   $data_2 = $fwDb->queryOne($sql_2);
   
   $sql_3 = "select auto_email_text_task.au_email_text ,  auto_email_text_task.au_subject from auto_email_text_task 
             where auto_email_text_task.au_task_uid = ".$emdata_1['bt_task_id'];
   $data_3 = $fwDb->queryOne($sql_3);
   
   $sql_33 = "select auto_task_text_msg.au_text_msg ,  auto_task_text_msg.au_subject from auto_task_text_msg 
             where auto_task_text_msg.au_task_uid = ".$emdata_1['bt_task_id'];
   $data_33 = $fwDb->queryOne($sql_33);
  
   $sql_4 = "select busness_status_task.bst_auto_email_text ,   busness_status_task.bst_auto_sms_text
             from busness_status_task where bst_task_id = ".$emdata_1['bt_task_id'];
   $data_4 = $fwDb->queryOne($sql_4);
   
   $sendemail = $data_4['bst_auto_email_text'];
   $sendsms   = $data_4['bst_auto_sms_text'];

   $toname = $data_2['bcust_fname'] .' ' . $data2['bcust_lname'];
   $toemail =  $data_2['bcust_misc_email1'];
   $fromname = "CGFB";
   $from  = "info@cgfb.com.au";
   $email_body  = "Dear ". $toname .",<br><br>";
   //$email_body .= "Task UID Number :". $taskid."<br>";
   $email_body .= $data_3['au_email_text'];
   $email_body .= "<br><br>";
   $email_body .= "Regards,<br>" ;
   $email_body .= "Canberra Granny Flat Builders and Fixed Price Extensions" ;
   
   $subject = $data_3['au_subject'] .' - '.$data_2['bsn_name'];
   
   $message_body = "Task UID Number :". $taskid.". ";
   $message_body .= stripslashes($data_33['au_text_msg']);

   
   $mobile = $data_2['bcust_misc_moble'];

   $mobile =  str_replace(' ','', $mobile);
  
   $attachment = '';
   
   if($comp == 1 && $sendemail == 1)
   {
     send_email($toname, $toemail, $fromname, $from, $subject, $email_body, $attachment);
   }
   
    if($comp == 1 && $sendsms == 1)
   {
   
	    $username = "manojsoniephp";
 	    $password = "jaimatadi108";
	
	 // Set the attributes of the message to send
	 //$message  = "Hello From Manoj";
	  $message = $message_body;
	  $type     = "1-way";
	  //$senderid = "ephpmanoj";
	  $senderid = "CGFB";
	  //$to       = "61400446605";
	  //$to       = "919823868963";
	
	  $to = $mobile;
	
	  $url = "http://api.directsms.com.au/s3/http/send_message?" .
		 "username=" . $username . "&" .
		 "password=" . $password . "&" .
		 "message="  . urlencode($message) . "&" .
		 "type="     . $type . "&" .
		 "senderid=" . urlencode($senderid) . "&" .
		 "to="       . $to;

  // Send the request
  $output = file($url);

  $result = explode(":", $output[0]);

  if($result[0] == "id") 
  {
    echo("Message sent\n");
  }
  else
  {
    echo("Error :- " . $result[1] . "\n");
  }
exit;	
	   
   }
   
}


function upload_entites_data($filename, $tmpname)
{
 	$path = getcwd()."/entity_upload_content";   $resource_id = 1; $error_type = "File Uploading to AWS Bucket";
 	$zipfile = $filename;  header('Access-Control-Allow-Origin: *');
    $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
    include_once $filetoinclude;  $date = date("Y-m-d H:i:s");
        //	echo $path .'/'.  basename($zipfile)  ;  exit;
        try { 
               if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
			   {  
                            //$s3 = new S3('AKIA2AMNCYNN7O5EFUFK', 'VEZHhG7ktp6XuszgBHV/V4GESsxHNIsfVHzYlkzz');
                	     //$s3 = new S3('AKIA2AMNCYNN5VRBSNNU', '5ys4bfLGJQDLgX/Pc+E66/2Yo8jpMgjcdAn1jGKg');
                        $s3 = new S3(ACCESS_KEY, SECRET_KEY);   $flag = 0;
            
                          try {
                  
                                    if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/document_check_list_files/'.$zipfile, S3::ACL_PRIVATE)) {
                                        $flag = 1; //die('in putobject');
                                    } else {
                                        sleep(10);
                                    if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/document_check_list_files/'.$zipfile, S3::ACL_PRIVATE))
                        		$flag = 1;
                        					//die('in putobject in 10');
                                    }
                
                			} catch (ErrorException $ex) {
                                //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
                            echo $ex->getLine();
                                return false;
                            }

                }
                else
                {
                    echo 'not moved';exit;
                }
            } 
            catch (ErrorException $ex) 
            {
                //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
               // echo "error :: => ". $ex->getLine();
                return false;
            }
				
	
     	$rem = $path .'/'.  basename( $filename);  unlink($rem);	
	
}

function upload($filename, $tmpname)
{
	$path = getcwd(); //echo "<br> path :: ".$path;
	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');

        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        	
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
					{  
            //$s3 = new S3('AKIA2AMNCYNN7O5EFUFK', 'VEZHhG7ktp6XuszgBHV/V4GESsxHNIsfVHzYlkzz');
	     //$s3 = new S3('AKIA2AMNCYNN5VRBSNNU', '5ys4bfLGJQDLgX/Pc+E66/2Yo8jpMgjcdAn1jGKg');
      $s3 = new S3(ACCESS_KEY, SECRET_KEY);
	  
            $flag = 0;
            
              try {
      
                        if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/document_check_list_files/'.$zipfile, S3::ACL_PRIVATE)) {
                            $flag = 1; //die('in putobject');
                        } else {
                            sleep(10);
                        if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/document_check_list_files/'.$zipfile, S3::ACL_PRIVATE))
            		$flag = 1;
            					//die('in putobject in 10');
                        }
    
    			} catch (ErrorException $ex) {
                    //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
                echo $ex->getLine();
                    return false;
                }

        }else{
            echo 'not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}



function upload_fdch($filename, $tmpname)
{
	
	
	$path = getcwd();
	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');
 
        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	    include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        	
        try {
                if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
    			{  
    			    
                    //$s3 = new S3('AKIA2AMNCYNN7O5EFUFK', 'VEZHhG7ktp6XuszgBHV/V4GESsxHNIsfVHzYlkzz');
            	  $s3 = new S3(ACCESS_KEY, SECRET_KEY);
                  
                        $flag = 0;
                        
                        if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/business_documents/'.$zipfile, S3::ACL_PRIVATE)) {
                            $flag = 1; //die('in putobject');
                        } else {
                            sleep(10);
                        if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/business_documents/'.$zipfile, S3::ACL_PRIVATE))
            		$flag = 1;
        					//die('in putobject in 10');
                    }
    
              }
             else
              {
                echo 'Document not moved';exit;
              }
            } 
            catch (ErrorException $ex) 
            {
              //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
             echo $ex->getLine();
             return false;
            }
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}


function upload_pp_doc($filename, $tmpname)
{
	
	
	$path = getcwd();
	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');

        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
					{  
  				$s3 = new S3(ACCESS_KEY, SECRET_KEY);
      
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/progress_payment_doc/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/progress_payment_doc/'.$zipfile, S3::ACL_PRIVATE))
		$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'Document not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}


function upload_special_condition($filename, $tmpname)
{
	
	
	$path = getcwd();
	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');
 
        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	    include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
					{  
       			  $s3 = new S3(ACCESS_KEY, SECRET_KEY);
      
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/special_conditions_doc/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/special_conditions_doc/'.$zipfile, S3::ACL_PRIVATE))
		$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'Document not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}



function upload_variations($filename, $tmpname)
{
	
	
	$path = getcwd();
	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');
 
        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	    include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
					{  
				$s3 = new S3(ACCESS_KEY, SECRET_KEY);
      
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/variations_doc/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/variations_doc/'.$zipfile, S3::ACL_PRIVATE))
		$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'Document not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}



function upload_designplan($filename, $tmpname)
{
	
	
	$path = getcwd();
	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');
 
        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	    include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
					{  
				$s3 = new S3(ACCESS_KEY, SECRET_KEY);
      
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/designplan_doc/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/designplan_doc/'.$zipfile, S3::ACL_PRIVATE))
		$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'Document not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}




function upload_lmp($filename, $tmpname)
{
	
	
	$path = getcwd();
	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');
 
        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	    include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
					{  
				$s3 = new S3(ACCESS_KEY, SECRET_KEY);
      
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/latest_merged_plans/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/latest_merged_plans/'.$zipfile, S3::ACL_PRIVATE))
		$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'Document not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
				
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);	
	
}


//Function to Upload Files for Question and Answers
function upload_bqa_attach($filename, $tmpname)
{
	
	$path = getcwd();
	$zipfile = $filename;
	
    $resource_id = 1;
    $error_type = "File Uploading to AWS Bucket";

	header('Access-Control-Allow-Origin: *');

	$filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	include_once $filetoinclude;

	$date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile))){

	  		$s3 = new S3(ACCESS_KEY, SECRET_KEY);
            //print_r($s3);exit;
            
            $flag = 0;
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/business_qa/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
				if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/business_qa/'.$zipfile, S3::ACL_PRIVATE))
				$flag = 1;
				//die('in putobject in 10');
            }
			
        }else{
            echo 'not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
		
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);
	
}

//Function used in buyer_qa_email file to get the path of the file
function get_buyer_qa_email_file_path($folder_path,$object_name)
{
    $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php'; include_once $filetoinclude;
    $bucket_name  = "deckquote"; 
   // $s3 = new S3('AKIA2AMNCYNNR3C7ELXP', 'ut4HuWX5HovWcxoCaU8gSSE27/RBxidTIh3SqYe2');
	$s3 = new S3(ACCESS_KEY, SECRET_KEY); 
	 
    try {
    	$file_data = $s3->getObject($bucket_name, $folder_path.$object_name, $saveTo = false); 
    //	echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
    	$file_raw_data = $file_data->body;

        $file = $object_name;
        $txt = fopen($_SERVER['DOCUMENT_ROOT'].'/files/businessqa_mail_content/'.$file, "w") or die("Unable to open file!");
        fwrite($txt, $file_raw_data);
        fclose($txt);
        
        //return $file = $_SERVER['DOCUMENT_ROOT'].'/files/businessqa_mail_content/'.$file;
		return $file = BASE_URL.'/files/businessqa_mail_content/'.$file;
    	 
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
           echo $ex->getLine();
            return false;
        }
}