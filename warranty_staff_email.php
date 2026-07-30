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
		  
		  $sqlpr = "select * from wa_priority where pr_id = ".$v2['wa_priority'];
		  $urgData = $fwDb->queryOne($sqlpr);
		  
		  $sqlnotes = "select wn_notes from warranty_log_notes where wn_wa_id = ".$v2['wa_id'];
		  $notesData = $fwDb->query($sqlnotes);
		  
		  $notes='';
		  
		  if(!empty($notesData))
		  {
			  foreach($notesData as $kn=>$vn)
			  {
				  $notes .= stripslashes($vn['wn_notes']).'<br><br>';  
			  }
				  
		  }
		
		  $html .= '<table width="100%" cellpadding="5" border="1">';	
		  $html .= '<tr><td colspan="2" style="text-align:center; background-color:yellow;">
		  <a href="'.BASE_URL.'warranty_log.home/ewa_id/'.$v2['wa_id'].'" target="_blank">Record Number : '.$v2['wa_id'].'</a></td></tr>';	
		  $html .= '<tr><td>Project</td><td>'.$v2['wa_project'].'</td></tr>';
		
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
		  //$html .= '<tr><td>Notes</td><td>'.stripslashes($v2['wa_notes']).'</td></tr>';
		  
		   $html .= '<tr><td>Notes</td><td>'.$notes.'</td></tr>';
		  
		   $link ='';
		   if($v2['wa_image1']) {
			   $link .= '<a href="'.BASE_URL."files/uploads/".$v2['wa_image1'].'">Link to Attachment1</a><br>';
		   }
		  if($v2['wa_image2']) {
			   $link .= '<a href="'.BASE_URL."files/uploads/".$v2['wa_image2'].'">Link to Attachment2</a><br>';
		   }
		  
		  if($v2['wa_image3']) {
			   $link .= '<a href="'.BASE_URL."files/uploads/".$v2['wa_image3'].'">Link to Attachment3</a><br>';
		   }
		   
		   if($v2['wa_image4']) {
			   $link .= '<a href="'.BASE_URL."files/uploads/".$v2['wa_image4'].'">Link to Attachment4</a><br>';
		   }
		   
		   if($v2['wa_image5']) {
			   $link .= '<a href="'.BASE_URL."files/uploads/".$v2['wa_image5'].'">Link to Attachment5</a><br>';
		   }
		   if($link) {
			$html .= '<tr><td>Attachments</td><td>'.$link.'</td></tr>'; 		  
		  }
		  
		  	
			$i++; 
		  	
		  $html .= '</table><br>';	
	}
	
	$html .= "<br>Regards,<br>CGFB Operation Team";
	
	$to = $v1['ir_email'];
	$toname = $v1['ir_first_name'];
	$from = "construction@cgfb.com.au";
	$from_name = "Operations team";
	$subject = "CGFB Warranty Log Report";
	
	//db($html);
	
			$logDetail['wl_date_sent'] = date('d-m-y');
			$logDetail['wl_rs_fullname'] = $v1['ir_first_name'].' '.$v1['ir_surname'];
			$logDetail['wl_email_to'] = $v1['ir_email'];
			$logDetail['wl_issue_included'] = $i;
			$opr = $table->insertRow($logDetail);
			
     $to2 = "manojsoniephp@gmail.com";
	
	send_email($toname, $to, 'CGFB', 'construction@cgfb.com.au', $subject, $html, $attachmentsend='');
    //send_email($toname, $to2, 'CGFB', 'construction@cgfb.com.au', $subject, $html, $attachmentsend='');
	
	}
	
}
exit;
