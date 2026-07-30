<?php
$table = new Fw_Db_Table("warranty_email_log_res_staff");
$sql_1 = "Select * from  include_resp_staff_warranty  where ir_auto_email = 1 group by ir_email";
$Data_1 = $fwDb->query($sql_1);


foreach($Data_1 as $k1=>$v1)
{
	
	$sql_2 = "select  * from warranty_log where wa_resp_staff like '%".$v1['ir_email']."%' and ( wa_status = 'Open' Or wa_status = 'Pending' ) ";
	
	$Data_2 = $fwDb->query($sql_2);
	
	$html = "";
	$message ="";
	$html .= "Dear " .$v1['ir_first_name'].",<br><br>";
	$html .= "Here are the warranty alerts that you are responsible for: <br>";
	$incsup='';
	if(sizeof($Data_2) > 0 ) {
	$i=0;	
	foreach($Data_2 as $k2=>$v2)
	{
	     $sql_info = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, 
		        	  bus_customers.bcust_lname, bus_customers.bcust_misc_moble from business_sellers 		
			 		  Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
					  Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			 		  where business.bsn_name = '".$v2['wa_project']."'";  
		
		  $data_3 = $fwDb->queryOne($sql_info);
		  $area='';
		  if($v2["wa_area"]==1) { $area='Inside'; } elseif($v2["wa_area"]==2) { $area='Outside'; }
		 
		  $sqlpr = "select * from wa_priority where pr_id = ".$v2['wa_priority'];
		  $urgData = $fwDb->queryOne($sqlpr);
		  
		  
	      $sqlnotes = "select * from warranty_log_notes where wn_wa_id = ".$v2['wa_id'];
		  $notesData = $fwDb->query($sqlnotes);
		  
		  $sqlenquiry = "select * from warranty_enquiry  where we_wa_id = ".$v2['wa_id'];
		  $enquiryData = $fwDb->query($sqlenquiry);
		  
          $sql_2 = "Select ws_supplier_name, ws_update_text, ws_attachment, ws_date,ws_wr from warranty_supplier_update where  ws_wa_id = ".$v2['wa_id'];
          $suData = $fwDb->query($sql_2);
		  
		  
		  	$sql_cg = "select wc_cgfb_option from warranty_log_cgfb where wc_id = ".$v2['wa_cgfb_resp'];
			$cgfbdata = $fwDb->queryOne($sql_cg);	
			
			$sql_why = "select ww_option from warranty_log_why_not where ww_id = ".$v2['wa_why_not'];
			$whybdata = $fwDb->queryOne($sql_why);	
			
			$sql_la = "select wl_liability_option  from warranty_log_liability where wl_id = ".$v2['wa_lia_acc'];
			$labdata = $fwDb->queryOne($sql_la);
			
			if($v2['wa_tl'] == 1 ) { $backcol = 'style="background-color:#00CC33"'; }
			elseif($v2['wa_tl'] == 2 ) { $backcol = 'style="background-color:#ff7f27"'; }
			elseif($v2['wa_tl'] == 3 ) { $backcol = 'style="background-color:#F00"'; }
			else { $backcol =''; }
	
	if($v2['wa_variation'] == 1 ) { $variation = 'Yes'; } else { $variation = 'No';  }
		  
		  		$link ='';
			   if($v2['wa_image_1']) {
				   $link .= '<a href="/warranty_log.download_content?file_name='.$v2["wa_image_1"].'&module_name=warranty_log.home
	" target="_blank">Link of Image 1 </a><br>';
			   }
			  if($v2['wa_image_2']) {
				   $link .= '<a href="/warranty_log.download_content?file_name='.$v2["wa_image_2"].'&module_name=warranty_log.home
	" target="_blank">Link of Image 2</a> <br>';
			   }
			  
			  if($v2['wa_image_3']) {
				   $link .= '<a href="/warranty_log.download_content?file_name='.$v2["wa_image_3"].'&module_name=warranty_log.home
	" target="_blank">Link of Image 3</a> <br>';
			   }
			   
			   if($v2['wa_image_4']) {
				  $link .= '<a href="/warranty_log.download_content?file_name='.$v2["wa_image_4"].'&module_name=warranty_log.home
	" target="_blank">Link of Image 4</a><br>';
			   }
			   
			   if($v2['wa_image_5']) {
				  $link .= '<a href="/warranty_log.download_content?file_name='.$v2["wa_image_5"].'&module_name=warranty_log.home
	" target="_blank">Link of Image 5</a>';
			   }
		  
		   $notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
		   $notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Attachment</td></tr>';
		  
		  if(!empty($notesData))
		  {
			 
			  foreach($notesData as $kn=>$vn)
			  {
				  
				  $notes .= '<tr>'; 
				  $notes .= '<td>'.stripslashes($vn['wn_notes']).'</td>'; 
				  $notes .= '<td>'.$vn['wn_added_by'].'</td>'; 
				  $notes .= '<td>'.$vn['wn_date'].'</td>'; 
				  $notes .= '<td>';
				  if(!empty($vn['wn_attachment'])) {
				 	 $notes .= '<a href="'.BASE_URL."files/uploads/".$vn['wn_attachment'].'">Link</a>'; 
				  }
				  $notes .= '</td>';
				  $notes .= '</tr>';   
			  }
				  
		  }
		  
		  
		   if(!empty($suData))
		  {
			 
			  foreach($suData as $kn2=>$vn2)
			  {
				  
				  $notes .= '<tr>'; 
				  $notes .= '<td>'.stripslashes($vn2['ws_update_text']).'</td>'; 
				  $notes .= '<td>'.$vn2['ws_supplier_name'].'</td>'; 
				  $notes .= '<td>'.changedate_d_m_y($vn2['ws_date']).'</td>'; 
				  $notes .= '<td>';
				  if(!empty($vn2['ws_attachment'])) {
						 $notes .= '<a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/'.$vn2['ws_attachment'].'">Link</a>';
				  }
				  $notes .= '</td>';
				  $notes .= '</tr>';   
			  }
				  
		  }
		  
		  
		 $notes .= '</table>';

        if(empty($notesData) && empty($suData))
		{
			$notes = "";
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


		
		  $html .= '<table width="100%" cellpadding="5" border="1">';	
		  $html .= '<tr><td colspan="2" style="text-align:center; background-color:yellow;">
		  <a href="'.BASE_URL.'warranty_log.home/ewa_id/'.$v2['wa_id'].'" target="_blank">Record Number : '.$v2['wa_id'].'</a></td></tr>';	
		 
		  $html .= '<tr><td>Project</td><td>'.$v2['wa_project'].'</td></tr>';
		
	     $html .= '<tr>';
		 $html .= '<td width="15%">Contact Info</td>';
		 $html .= '<td width="85%">'.$data_3['bcust_fname'].' '.$data_3['bcust_lname'].' - Mobile No :'.$data_3['bcust_misc_moble'].'</td>';
		 $html .= '</tr>';	
		
		 $html .= '<tr>';
		 $html .= '<td width="15%">Area</td>';
		 $html .= '<td width="85%">'.$area.'</td>';
	     $html .= '</tr>';
		
		  $html .= '<tr><td>Status</td><td>'.$v2['wa_status'].'</td></tr>';
		  
		  if($v2['wa_date']) {
		  	$html .= '<tr><td>Date</td><td>'.$v2['wa_date'].'</td></tr>';
	           }
		   
		  $x = explode("<br>",$v2['wa_include_supplier']);
		
		  $incsup='';
		  foreach($x as $k3=>$v3)
		  {
			preg_match('~>\K[^<>]*(?=<)~',  $v3,$str);
			$incsup = [];
			$incsup[] = $str[0];	
		  }
		  
		  if(strlen($incsup[0])>0) {
		  	$html .= '<tr><td>Supplier</td><td>'.implode("<br>",$incsup).'</td></tr>';
		  }
		  
		  if($v2['wa_type']) {  
		  	$html .= '<tr><td>Type</td><td>'.$v2['wa_type'].'</td></tr>'; 
		  }
		  
		   if($urgData['pr_priority']) {
			$html .= '<tr><td>Urgency</td><td>'.$urgData['pr_priority'].'</td></tr>'; 		  
		  }
		  
		  
		  $html .= '<tr><td>Responsible Staff</td><td>'.$v2['wa_resp_staff'].'</td></tr>'; 
		  $html .= '<tr><td>Problem</td><td>'.stripslashes($v2['wa_problem']).'</td></tr>'; 
		  
		  	 if($link) {
			 $html .= '<tr>';
			 $html .= '<td width="15%">Attachments</td>';
		     $html .= '<td width="85%">'.$link.'</td>';
			 $html .= '</tr>';
		 }
		  
		   $html .= '<tr><td>Notes</td><td>'.$notes.'</td></tr>';
		  
		  
		  		$html .= '<tr>';
				$html .= '<td width="15%">CGFB Responsible</td>';
				$html .= '<td width="85%">'.$cgfbdata["wc_cgfb_option"].'</td>';
				$html .= '</tr>';
				
				$html .= '<tr>';
				$html .= '<td width="15%">Why Not Responsible</td>';
				$html .= '<td width="85%">'.$whybdata["ww_option"].'</td>';
				$html .= '</tr>';
				
				$html .= '<tr>';
				$html .= '<td width="15%">Liability Accepted</td>';
				$html .= '<td width="85%">'.$labdata["wl_liability_option"].'</td>';
				$html .= '</tr>';
		  
		        $html .= '<tr>';
				$html .= '<td width="15%">Customer Enquiry</td>';
				$html .= '<td width="85%">'.$enquiry.'</td>';
				$html .= '</tr>';

				
			$i++; 
		  	
		  $html .= '</table><br>';	
	}
	
	$html .= "<br>Regards,<br>CGFB Operation Team";
	
	$to = $v1['ir_email'];
	$toname = $v1['ir_first_name'];
	$from = "warranty@cgfb.com.au";
	$from_name = "Operations team";
	$subject = "CGFB Warranty Log Report";
	
	//db($html);
	
			$logDetail['wl_date_sent'] = date('d-m-y');
			$logDetail['wl_rs_fullname'] = $v1['ir_first_name'].' '.$v1['ir_surname'];
			$logDetail['wl_email_to'] = $v1['ir_email'];
			$logDetail['wl_issue_included'] = $i;
			$opr = $table->insertRow($logDetail);
			
     $to2 = "manojsoniephp@gmail.com";
	
	send_email($toname, $to, 'CGFB', 'warranty@cgfb.com.au', $subject, $html, $attachmentsend='');
    send_email($toname, $to2, 'CGFB', 'warranty@cgfb.com.au', $subject, $html, $attachmentsend='');
	
	}
	
}
exit;
