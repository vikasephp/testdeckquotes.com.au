<?php
ini_set('display_errors', 0);

$table = new Fw_Db_Table("warranty_email_log_trade_partner");

$sql = "SELECT * FROM supplier_email_warranty where se_status = 'Open' group by se_email ";
$data = $fwDb->query($sql);

;

foreach($data as $k=>$v)
{
     
	  $sql_2 = "SELECT  wa_project, count(*) as tot FROM warranty_log
		        WHERE wa_incl_supp_email like '%".$v['se_email']."%' and wa_status = 'Open' group by wa_project ";  
	  $detail_2 = $fwDb->query($sql_2); 
	  
	  
	  
	  $sqlmob = "Select cs_mobile from contacts where cs_primary_email  = '".$v['se_email']."'";
	  $mobdata = $fwDb->queryOne($sqlmob);
	  
	   $html = "<html> <body style = 'font-size:16px;'>";
	  
	   $html .= "<p>" .$v['se_supplier']." </p>";
	   $html .= "<p>Below is the summary table for the warranty issues that you have included in:</p>";
	   
	   $html .= '<table border="1" cellpadding="5">';
	   
	   $html .= '<tr><td>Project Address</td><td>Customer Info</td><td>Number of Issues</td><tr>';
	
	
	 if(!empty($detail_2)) {   
	   foreach($detail_2 as $k2=>$v2)
		  {
			   
			   $sq1c= "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         		     bus_customers.bcust_misc_moble from business_sellers 		
	 		         Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			         Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '".$v2['wa_project']."'";  
	
	           $datacust = $fwDb->queryOne($sq1c);
			   
			   $html .= '<tr>';
			   $html .= '<td>'.$v2['wa_project'].'</td>';
			   $html .= '<td>'.$datacust['bcust_fname']. ' '.$datacust['bcust_lname'].'<br>'.$datacust['bcust_misc_moble'].'</td>';
			   $html .= '<td>'.$v2['tot'].'</td>';
			   
			   $html .= '</tr>';
		  }
		  
	   $html .= '</table>';
	   $html .= '<p>Please review the details of the warranty issues by logging in to our <a href="https://warrantyreport.com.au/supplier/login">Warranty Report Website</a> by using your email and phone number:</p>';
	  
	  $html .= '<ul>';
	  $html .= '<li>Email Address: '.$v['se_email'].'</li>';
	  $html .= '<li>Phone Number: '.$mobdata['cs_mobile'].'</li>';
	  $html .= '</ul>';
	  $html .= '<p>You may also view the warranty issues in the attached PDF file.</p>';
	  
	  $html .= "<p>Regards,</p>";
	  $html .= "<p>CGFB Warranty Team</p>";
	   
	  $html .= '</html>';

	
    $sqlw = "Select * from warranty_log where wa_incl_supp_email like '%".$v['se_email']."%' and wa_status = 'Open'";
	$data_w = $fwDb->query($sqlw);
	
				
	$i=0;
	
	
	$last_key = end(array_keys($data_w));
	$htmlPDF  = '<html><body>';
	
	
	foreach($data_w as $k2=>$v2)
	{
		
	     $sql_info = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
					 bus_customers.bcust_misc_moble, bcust_misc_email1 from business_sellers 		
					 Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
					 Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
					 where business.bsn_name = '".$v2['wa_project']."'";  
	
	      $data_2 = $fwDb->queryOne($sql_info);
		  
		  $sqlpr = "select * from warranty_log_priority where pr_id = ".$v2['wa_priority'];
		  $urgData = $fwDb->queryOne($sqlpr);
		  
		  
		  $dayscount='';
					$ccdate = $v2['wa_date'];
					if(!empty($ccdate)) {
						$Statusdate = changedate_y_m_d($ccdate);
						$curdate_y_m_d = date('Y-m-d');
						$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
					}
		  
		  
		 $sqlnotes = "select * from warranty_log_notes where wn_wa_id = ".$v2['wa_id'];
		 $notesData = $fwDb->query($sqlnotes); 
	
	     $sql_ufs = "Select ws_supplier_name, ws_update_text,ws_attachment, ws_date,ws_wr from warranty_supplier_update where  ws_wa_id = ".$v2['wa_id'];
	     $suData = $fwDb->query($sql_ufs);
	    
		
		  $sqlenquiry = "select * from warranty_enquiry  where we_wa_id = ".$v2['wa_id'];
		  $enquiryData = $fwDb->query($sqlenquiry);
		
		 $surow = '';
		 
		 if(!empty($notesData)) {
			 foreach($notesData as $ks=>$vs)
			 {
			  
			  $surow .= '<tr><td>'.$vs['wn_notes'].'</td>'; 
			  $surow .= '<td>'.$vs['wn_added_by'].'</td>';
			 
			  $surow .= '<td>'.changedate_d_m_y($vs['wn_date']).'</td>'; 
			  
			  if($vs['wn_attachment']) {
				 
				  $attach = '<a href="'.BASE_URL.'/files/uploads/'.$vs['wn_attachment'].'">Link2</a>';
				  $surow .= '<td>'.$attach.'</td>';
			  } else {
				   $surow .= '<td></td>';
			  }
			  
			  $surow .= '</tr>';
			 }
		 }
		 
		 
		 if(!empty($suData)) {
			 foreach($suData as $ks=>$vs)
			 {
			  
			  $surow .= '<tr><td>'.$vs['ws_update_text'].'</td>'; 
			  $surow .= '<td>'.$vs['ws_supplier_name'].'</td>';
			 
			  $surow .= '<td>'.changedate_d_m_y($vs['ws_date']).'</td>'; 
			  
			  if($vs['ws_attachment']) {
				  if($vs['ws_wr'] == 0) {
					   $attach = '<a href="'.BASE_URL.'/files/uploads/'.$vs['ws_attachment'].'">Link2</a>';
				  } else {
					   $attach = '<a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/'.$vs['ws_attachment'].'">Link2</a>';
				  }
				  
				  $surow .= '<td>'.$attach.'</td>';
			  } else {
				   $surow .= '<td></td>';
			  }
			  
			  $surow .= '</tr>';
			 }
		 }
	
	
	      $enquiry = '<table border = "1" cellpadding="5" cellspacing="0" >';
		  $enquiry .= '<tr><td>Enquiry</td><td>Answer</td><td>Date Added</td></tr>';
		  
		  if(!empty($enquiryData))
		  {
			 
			  foreach($enquiryData as $ke=>$ve)
			  {
				  
				  $enquiry .= '<tr>'; 
				  $enquiry .= '<td>'.stripslashes($ve['we_enquiry']).'</td>'; 
				  $enquiry .= '<td>'.stripslashes($ve['we_answer']).'</td>'; 
				  $enquiry .= '<td>'.$ve['we_date'].'</td>'; 
				  $enquiry .= '</tr>';   
			  }
				  
		  }
		  
		   $enquiry .= '</table>';

        if(empty($enquiryData))
		{
			$enquiry = "";
		}
		
		$sql_cg = "select wc_cgfb_option from warranty_log_cgfb where wc_id = ".$v2['wa_cgfb_resp'];
		$cgfbdata = $fwDb->queryOne($sql_cg);	
		
		$sql_why = "select ww_option from warranty_log_why_not where ww_id = ".$v2['wa_why_not'];
		$whybdata = $fwDb->queryOne($sql_why);	
		
		$sql_la = "select wl_liability_option  from warranty_log_liability where wl_id = ".$v2['wa_lia_acc'];
		$labdata = $fwDb->queryOne($sql_la);	
		
		if($v2['wa_variation'] == 1 ) { $variation = 'Yes'; } else { $variation = 'No';  }
		$area='';
		if($v2["wa_area"]==1) { $area='Inside'; } elseif($v2["wa_area"]==2) { $area='Outside'; }

		$htmlPDF .= '<table border="1" cellpadding="5" width="100%">';
		$htmlPDF .= '<tr style="background-color:red;"><td colspan="2" style="text-align:center;" >Record No : '.$v2['wa_id'].'</td></tr>';	
		$htmlPDF .= '<tr>';
		$htmlPDF .= '<td width="15%">Project</td>';
		$htmlPDF .= '<td width="85%">'.$v2["wa_project"].'</td>';
	    $htmlPDF .= '</tr>';
		
	 	
		$htmlPDF .= '<tr>';
		$htmlPDF .= '<td width="15%">Contact Info</td>';
		$htmlPDF .= '<td width="85%">'.$data_2['bcust_fname'].' '.$data_2['bcust_lname'].' - '.$data_2['bcust_misc_moble'].'</td>';
		$htmlPDF .= '</tr>';
		
		if(!empty($cgfbdata["wc_cgfb_option"])) {
			$htmlPDF .= '<tr>';
			$htmlPDF .= '<td width="15%">CGFB Responsible</td>';
			$htmlPDF .= '<td width="85%">'.$cgfbdata["wc_cgfb_option"].'</td>';
			$htmlPDF .= '</tr>';
		}
		
		if(!empty($whybdata["ww_option"])) {
			$htmlPDF .= '<tr>';
			$htmlPDF .= '<td width="15%">Why Not Responsible</td>';
			$htmlPDF .= '<td width="85%">'.$whybdata["ww_option"].'</td>';
			$htmlPDF .= '</tr>';
		}
		
		if(!empty($labdata["wl_liability_option"])) {
			$htmlPDF .= '<tr>';
			$htmlPDF .= '<td width="15%">Liability Accepted</td>';
			$htmlPDF .= '<td width="85%">'.$labdata["wl_liability_option"].'</td>';
			$htmlPDF .= '</tr>';
		}
		
		
		 $htmlPDF .= '<tr>';
		 $htmlPDF .= '<td width="15%">Area</td>';
		 $htmlPDF .= '<td width="85%">'.$area.'</td>';
	     $htmlPDF .= '</tr>';
		
		$htmlPDF .= '<tr>';
		$htmlPDF .= '<td width="15%">Variation Required</td>';
		$htmlPDF .= '<td width="85%">'.$variation.'</td>';
		$htmlPDF .= '</tr>';
		
		if(!empty($v2["wa_date"])) {
			$htmlPDF .= '<tr>';
	       	$htmlPDF .= '<td width="15%">Date</td>';
			$htmlPDF .= '<td width="85%">'.trim($v2["wa_date"]).'</td>';
			$htmlPDF .= '</tr>';
		}
		
		 $x = explode("<br>",$v2['wa_include_supplier']);
		 $incsup = [];
		  foreach($x as $k3=>$v3)
		  {
			preg_match('~>\K[^<>]*(?=<)~',  $v3,$str);
			$incsup[] = $str[0];	
		  }
		  
		  if(strlen($incsup[0])>0) {
		  	$htmlPDF .= '<tr><td>Include Supplier</td><td>'.implode("<br>",$incsup).'</td></tr>';
		  }
		
		if($v2["wa_type"] <> -1) {
		$htmlPDF .= '<tr>';
		$htmlPDF .= '<td width="15%">Type</td>';
		$htmlPDF .= '<td width="85%">'.$v2["wa_type"].'</td>';
		$htmlPDF .= '</tr>';
		
		}
		 if(!empty($urgData['pr_priority'])) {
			$htmlPDF .= '<tr><td>Priority</td><td>'.$urgData['pr_priority'].'</td></tr>'; 		  
		  }
		
		
		
		
		$htmlPDF .= '<tr>';
		$htmlPDF .= '<td width="15%">Problem</td>';
		$htmlPDF .= '<td width="85%">'.$v2["wa_problem"].'</td>';
		$htmlPDF .= '</tr>';
		
		$htmlPDF .= '<tr>';
		$htmlPDF .= '<td width="15%">Days Count</td>';
		$htmlPDF .= '<td width="85%">'.$dayscount.'</td>';
		$htmlPDF .= '</tr>';
		
		if(!empty($surow)) {
			$htmlPDF .= '<tr>';
			$htmlPDF .= '<td width="15%">Notes</td>';
			$htmlPDF .= '<td width="85%">';
			$htmlPDF .= '<table border="1" cellpadding="5" cellspacing="0" style="border-collapse:collapse;border: 1px solid black;" > <tr>';
			$htmlPDF .= '<th>Notes</th><th style="border: 1px solid black;">Added By</th>';
			$htmlPDF .= '<th>Date Added</th><th>Attachment</th></tr>';
			$htmlPDF .= $surow;
			$htmlPDF .= '</table>';
			$htmlPDF .= '</td>';
			$htmlPDF .= '</tr>'; 
		}

		$htmlPDF .= '<tr>';
		$htmlPDF .= '<td width="15%">Customer Enquiry</td>';
		$htmlPDF .= '<td width="85%">'.$enquiry.'</td>';
		$htmlPDF .= '</tr>';
		
		if(!empty($v2["wa_supplier"])) {
			$htmlPDF .= '<tr>';
			$htmlPDF .= '<td width="15%">Supplier</td>';
			$htmlPDF .= '<td width="85%">'.$v2["wa_supplier"].'</td>';
			$htmlPDF .= '</tr>';
		}
		
		 $link ='';
		   if($v2['wa_image_1']) {

			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v2['wa_image_1'].'" >Link to Attachment1</a><br>';
			   
		   }
		  if($v2['wa_image_2']) {

			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v2['wa_image_2'].'" >Link to Attachment2</a><br>';
		   }
		  
		  if($v2['wa_image_3']) {

			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v2['wa_image_3'].'" >Link to Attachment3</a><br>';
		   }
		   
		   if($v2['wa_image_4']) {

			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v2['wa_image_4'].'" >Link to Attachment4</a><br>';
		   }
		   
		   if($v2['wa_image_5']) {

			   $link .= '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v2['wa_image_5'].'" >Link to Attachment5</a><br>';
		   }
		   if($link) {
			$htmlPDF .= '<tr><td>Problem Photo</td><td>'.$link.'</td></tr>'; 		  
		  }
		  
		  if($v2['wa_video']) {
			  
			   $vi_link = '<a href="https://www.deckquotes.com.au/site.download_content?file_name='.$v2['wa_video'].'" >Link</a>';
			   $htmlPDF .= '<tr><td>Video Files</td><td>'.$vi_link.'</td></tr>'; 
	
		  }
		
		$htmlPDF .= '<tr><td colspan="2">
			 If you would like to add comment for this alert, please <a href="'.BASE_URL."site.warranty_comment_update_form/wa_id/".$v2['wa_id'].'" >Click Here</a></td></tr>';
		
		$htmlPDF .= "</table>";
		if ($k2 <> $last_key) {
			$htmlPDF .= '<br pagebreak="true" />';
		}
		$i++;
	       
	}
	 
		$htmlPDF .= "</body></html>";
		
		
		       
	 	$fdata ='';
	 	$to = $v['se_email']; 
		$toname = $v['se_first_name'];
		$heading = "Warranty issues of you project";
		
		$logDetail['wl_date_sent'] = date('d-m-y');
		$logDetail['wl_company'] = $v['se_supplier'];
		$logDetail['wl_contact_name'] = $v['se_first_name'].' '.$v['se_surname'];
		$logDetail['wl_email_to'] = $v['se_email'];
		$logDetail['wl_issue_included'] = $i;
		
	    $opr = $table->insertRow($logDetail);
		
 	
		$heading = "Supplier Warranty Issue";
		
		if($toname == 'N/A') { $toname = 'NA' ; }
		
		$attach1 = create_supplier_issue_PDF($heading, $htmlPDF, $toname);
		
		$fdata = [];
		if(!empty($attach1)) {
			
			$fdata[] = $attach1;	
		}
		if(!empty($fdata)) {			
				$attachmentsend = serialize($fdata);
		}
		
		
		
		$to2 = "manojsoniephp@gmail.com";
		//db($htmlPDF);
			
	    send_email($toname, $to,  'CGFB', 'warranty@cgfb.com.au', 'CGFB Warranty Issue Update', $html, $attachmentsend);
		send_email($toname, $to2, 'CGFB', 'warranty@cgfb.com.au', 'CGFB Warranty Issue Update', $html, $attachmentsend);
	 }
				
 }	
exit("End of Process");
