<?php
$fwMainView = 'file:' . getcwd() . '/proposalchecklistemail.tpl';
$bus_id = $fwRequest->getparam('bus_id', 0);
$logged_usename = $_SESSION['user']['user_name'];
$send_email = $fwRequest->getParam('send_email', '');

$attach = $fwRequest->getParam('attach', '');
$load_apr_doc = $fwRequest->getParam('load_apr_doc', '');

$dpn_proposal_number = $fwRequest->getparam('dpn_proposal_number', 0);

if($load_apr_doc)
{
	$sql = "SELECT * FROM business_pa_documents where bpd_bsi_id = ".$bus_id;
		   $fwViewData['docdata'] = $fwDb->query($sql);
}

if($send_email)
	{
	$send_data = $fwRequest->getParam($TABLE, array());
	
	$attachment ='';
			$from = 'info@cgfb.com.au';
			$fromname= 'CGFB';
			$subject =  $send_data['subject'];	
			$textbody =  $send_data['email_body'];
			
	if($send_data['buyers'])
		{
			if($send_data['attachments']){$attachment = serialize($send_data['attachments']);}
			
			
				$count=0;
		foreach($send_data['buyers'] as $k => $v)
				{
				list($fname, $lname, $email)=explode("|", $v);
				$toname = $fname." ".$lname;
				$toemail = $email;
				//$toemail = "manojsoniephp@gmail.com";
				$body = str_replace("{{buyerfname}}", $fname, $textbody);
				$body = str_replace("{{buyerlname}}", $lname, $body);
				$body = str_replace("{{logourl}}", $LOGO, $body);
				if(send_email($toname, $toemail, $fromname, $from, $subject, $body, $attachment))
					{	
						send_email('Marketing cgfb', 'marketing@cgfb.com.au', $fromname, $from, $subject, $body, $attachment);
						email_tracking($toname, $toemail, $fromname, $from, $subject, $body, $attachment, 2);
						$count++;
					}			
				}
				unset($_SESSION['eattach']);				
		}else{
$fwViewData['error'] = "Please select atleast one recipient.";	

}	
$fwViewData['subject'] = $subject;
$fwViewData['body'] = $textbody;			
$fwViewData['sendcount'] = 	$count;
}elseif(count($_FILES['eattach']['error']) > 0)
	{
	$coun = count($_FILES['eattach']['error']);
	$send_data = $fwRequest->getParam($TABLE, array());
	$fwViewData['subject'] = $send_data['subject'];
	$fwViewData['body'] = $send_data['email_body'];

	for($i=0; $i< $coun; $i++)
		{
	$docfile = $_FILES['eattach']['name'][$i];
	
	
						$file_type = $_FILES['eattach']['type'][$i];
						$docfile = $datetime.preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
						$src = $_FILES['eattach']['tmp_name'][$i];
					
						$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile;			
						
							if (!move_uploaded_file($src, $destination))
							{
								//echo "Possible file upload attack";
								}
								else
								{
								chmod($destination, 0664);
								
								if($_SESSION['eattach']['file_name'])
									{
										$olddata = $_SESSION['eattach']['file_name'];
										array_push($olddata, $docfile);
										$_SESSION['eattach']['file_name'] = $olddata;
									}else{
									if($docfile)
										{
											$newdoc[]=$docfile;
											$_SESSION['eattach']['file_name'] = $newdoc;
										}
									}
							}
	}


	}else{ //unset($_SESSION['eattach']); 
	}
	
if($bus_id > 0)
	{
		$email_sql = "SELECT business_sellers.bs_customers_name, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2  FROM business_sellers LEFT JOIN bus_customers ON bus_customers.bcust_id = business_sellers.bs_customers_id WHERE business_sellers.bs_business_id = ".$bus_id;
		$fwViewData['custdata'] = $fwDb->query($email_sql);
	
		$docs_sql1 = "SELECT document_check_list_mini.doc_file_name, admin_document_check_list_mini.admin_doc_name FROM document_check_list_mini
		              LEFT JOIN admin_document_check_list_mini ON admin_document_check_list_mini.admin_doc_id = document_check_list_mini.doc_name_id 
					  WHERE document_check_list_mini.doc_file_name != '' && document_check_list_mini.doc_bsn_id = ".$bus_id . " && doc_checklist_number = ".$dpn_proposal_number;
					  
		$fwViewData['checklistbusdocs'] = $fwDb->query($docs_sql1);
		
		$sqlcdcm = "Select  custom_document_check_list_mini.* from  custom_document_check_list_mini 
		            where  custom_document_check_list_mini.cdc_bsn_id = ". $bus_id. " And cdc_file_name !=''  && cdc_checklist_number = ".$dpn_proposal_number;
		$fwViewData['customdocs'] = $fwDb->query($sqlcdcm);
		//$docsnew = $fwDb->query($sqlcdcm);
		
		
		if(is_array($busdocs1)){ $busdocsfirst = $busdocs1;}
		$docs_sql2 = "SELECT business_documents.bd_doc_name, business_documents.bd_type FROM business_documents WHERE business_documents.bd_bsi_id = ".$bus_id;
		$docs = $fwDb->query($docs_sql2);

	if(count($_SESSION['eattach']['file_name']) > 0)
		{
			foreach($_SESSION['eattach']['file_name'] as $k => $v)
			{
				
				 $attached[]['cdc_doc_name'] = $v;
			}
				
			if(count($attached) > 0 && count($docsnew) > 0):
			$docsnew = array_merge($docsnew, $attached);
			elseif(count($attached) > 0 && !$docsnew):
			$docsnew = $attached;
			endif;
		}
		
		$fwViewData['attached'] = $attached;
		$fwViewData['docs'] = $docsnew;
}
	
