<?php

$sql = "SELECT  * from warranty_log where wa_status = 'Open' order by wa_id";

$paData = $fwDb->query($sql);


$message = "<html> <body>";
$message .= "<h3>Warranty Log Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Project</td><td>Contact Info</td><td>Type</td>
            <td>Tenanted</td><td>Date</td><td>Problem</td><td>Notes</td><td>Quality Inspector contacted client</td>
	    <td>Date Inspected On site</td><td>CGFB Person</td><td>Supplier or Contract</td> <td>Status</td></tr>";
		   

	$srno=1;
	foreach($paData as $k => $v)
	{
	  $sq12= "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, 
		      bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble
	          from business_sellers 		
	          Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	          Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		      where business.bsn_name = '".$v['wa_project']."'";  
	
	         $data = $fwDb->queryOne($sq12);
 		
		 $sqlnotes = "select wn_notes from warranty_log_notes where wn_wa_id = ".$v['wa_id'];
		  $notesData = $fwDb->query($sqlnotes);
		  
		  
		  $notes='';

	       $sqlnotes = "select * from warranty_log_notes where wn_wa_id = ".$m['wa_id'];
		  $notesData = $fwDb->query($sqlnotes);
		  
          $sql_2 = "Select ws_supplier_name, ws_update_text, ws_attachment, ws_date,ws_wr from warranty_supplier_update where  ws_wa_id = ".$m['wa_id'];
          $suData = $fwDb->query($sql_2);
		  
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
		
	
		$contct_info = $data['bcust_fname']. ' '. $data['bcust_fname']. '<br>'.$data['bcust_misc_moble'];
		
		if($v['wa_qicc'] == 1) { $qicc = 'Yes'; } else { $qicc = 'No'; }
		
						$message .= "<tr>";
						$message .= "<td>".$srno."</td>";
						$message .= "<td>".$v['wa_project']."</td>";
						$message .= "<td>".$contct_info."</td>";
						$message .= "<td>".$v['wa_type']."</td>";
						$message .= "<td>".$v['wa_tenanted']."</td>";
						$message .= "<td>".$v['wa_date']."</td>";
						$message .= "<td>".$v['wa_problem']. "</td>";
						$message .= "<td>".$notes. "</td>";
						$message .= "<td>".$qicc."</td>";
						$message .= "<td>".$v['wa_date_inspected']. "</td>";
						$message .= "<td>".$v['wa_cgfb_person']."</td>";
						$message .= "<td>".$v['wa_supplier']."</td>";
						$message .= "<td>".$v['wa_status']. "</td>";
						$message .= "</tr>";
						$srno++;
						
  }

$message .= "</table></body></html>";


	$sqle = "Select ar_receving_email from automated_reports where ar_id = 12";
	$emaildata = $fwDb->queryOne($sqle);
	
	$emails = explode(",", $emaildata['ar_receving_email']);
	
	if(!empty($emails)) {
		foreach($emails as $ve)
		{
			send_email('Frank Walmsley', trim($ve), 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Report', $message, $attachment='');	
		}
	}

//send_email('Manoj Soni', 'supportmanager@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Warranty Log Report', $message, $attachment='');
 
exit;
	