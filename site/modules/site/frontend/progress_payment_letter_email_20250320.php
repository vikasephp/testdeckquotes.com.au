<?php
$table = new Fw_Db_Table('customer_email_log');

$matsql = "SELECT progress_payment_detail.*, business.bsn_name, business.bsn_status from progress_payment_detail
           Inner join business on progress_payment_detail.ppd_bsn_id =  business.bsn_id
           where length(progress_payment_detail.ppd_inv_due_date)> 0 AND 
		   length(progress_payment_detail.ppd_when_payrec)<=0 AND
		   business.bsn_status Like '%|3|%' 
		   order by progress_payment_detail.ppd_bsn_id";

$paData = $fwDb->query($matsql);

$current_date1 = date('Y-m-d');
$day = date("D", strtotime($current_date1));

$message = "<html> <body>";
$message .= "<h3>Weekly Overdue Payment Letter and Updated Invoice Email</h3><br><br>";


	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['ppd_bsn_id'];
				
				$sql = "SELECT  business_sellers.bs_business_id,  bus_customers.bcust_fname, bus_customers.bcust_lname, 
				        bus_customers.bcust_misc_email1 from business_sellers 		
	    				Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	   					Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
						where business_sellers.bs_business_id = ".$bsn_id;
			
				$data = $fwDb->queryOne($sql);
					
				$d1 = date('Y-m-d');
				$d2 = changedate_y_m_d($v['ppd_inv_due_date']);
				$d3 = changedate_y_m_d($v['ppd_when_payrec']);
							
				if(!empty($d2) && empty($d3))
				{
					$dayscount = daysDifference($d1 , $d2);
					
				}
				
				$message = "<p>Dear ".$data['bcust_fname'].",<p>";
				$message .= "<p>I hope this message finds you well.</p>";
				$message .= "<p>This is a friendly reminder regarding your outstanding payment for the following invoice<p>";
				$message .= "<p><strong>Project Name : </strong>".$v['bsn_name']."<p>";
				$message .= "<p><strong>Stage : </strong>".$v['ppd_stage']."<p>";
				$message .= "<p><strong>Invoice Due Date : </strong>".$v['ppd_inv_due_date']."<p>";
				$message .= "<p><strong>Days Over Due :</strong>".$dayscount."</p>";
				$message .= "<p>Attached to this email, you will find <p>";
				$message .= "<p><ul><li> Late Payment Letter – PDF </li><p>";
				$message .= "<p><li> Corresponding Invoice - PDF</li></ul><p>";
				$message .= "<p>Please review the attached documents and arrange for payment at your earliest convenience. To avoid further interest accrual, we kindly request that you settle the outstanding amount </p>";
				$message .= "<p>If you have already made the payment please disregard this email. Otherwise, please contact us immediately at info@cgfb.com.au <p>";				
				
				$message .= "<p>Thank you for your prompt attention to this matter.<p><br>";
				
				$message .= "<p>Thanks & Regards,<br>";
				$message .= "Frank Walmskey</p>";
				
			    $dt = date('d-m-Y');
				$sql2 = " update progress_payment_detail set ppd_email_date = '".$dt."' where ppd_id = ".$v['ppd_id'];
				$fwDb -> queryOne($sql2);
            
		   
			    if(!empty($v['ppd_invoice_sent'])) {
			   		//$destination = BASE_URL.FILE_PATH."files/progress_payment_doc/".$v['ppd_invoice_sent'];
			   		$destination = $_SERVER['DOCUMENT_ROOT']."/files/progress_payment_doc/".$v['ppd_invoice_sent'];
					$folder_path = "files/progress_payment_doc/";
	    			$source = get_file_raw_data($folder_path,$v['ppd_invoice_sent']);
	    			//echo $source."<br/>";echo $destination."<br/>";
	    			copy($source, $destination);	
		
					$docfile =  BASE_URL.FILE_PATH.'files/progress_payment_doc/'.$v['ppd_invoice_sent'];
					
				}

                if(!empty($v['ppd_letter_to_be'])) {
			   		//$destination2 = BASE_URL.FILE_PATH."files/progress_payment_doc/".$v['ppd_letter_to_be'];
			   		$destination2 = $_SERVER['DOCUMENT_ROOT']."/files/progress_payment_doc/".$v['ppd_letter_to_be'];
					$folder_path2 = "files/progress_payment_doc/";
	    			$source2 = get_file_raw_data($folder_path2,$v['ppd_letter_to_be']);
	    				
					copy($source2, $destination2);	
		
					$docfile2 = BASE_URL.FILE_PATH.'files/progress_payment_doc/'.$v['ppd_letter_to_be'];
					//echo "Checking DocFile2 ".$docfile2."<br/>";
				
				}
				
				
				$attachmentsend='';
				
				unset($fdata);
				if(!empty($docfile)) {
					$fdata[] = $docfile;
					unset($docfile);
				}
				
				if(!empty($docfile2)) {
					$fdata[] = $docfile2;
					unset($docfile2);
				}
				
								
				if(!empty($fdata)) {			
						$attachmentsend = serialize($fdata);
				}
				
								
				$to = $data['bcust_misc_email1'];
				$toname = $data['bcust_fname'];
				$subject = "Weekly Overdue Payment Letter";
				
				
	if($day == 'Mon') {

		//send_email($toname, $to, 'CGFB', 'accounts@cgfb.com.au', $subject, $message, $attachmentsend);
		//send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'accounts@cgfb.com.au', $subject, $message, $attachmentsend);
	
		//send_email($toname, 'accounts@cgfb.com.au', 'CGFB', 'accounts@cgfb.com.au', $subject, $message, $attachmentsend);
		
		$detail['ce_to_name'] = $data['bcust_fname'] . " ".$data['bcust_lname'];
		$detail['ce_to_email'] = $to;
		$detail['ce_message'] = $message;
		$detail['ce_subject'] = $subject;
		$detail['ce_invoice'] = $v['ppd_invoice_sent'];
		$detail['ce_letter'] =  $v['ppd_letter_to_be'];
		$detail['cd_sent_date']  = date('d-m-Y');
		
		$opr = $table->insertRow($detail);
  }
}
exit;