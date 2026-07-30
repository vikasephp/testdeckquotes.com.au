<?php

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name, business.bsn_status ,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		Inner Join document_check_list ON business_sellers.bs_business_id = document_check_list.doc_bsn_id And document_check_list.doc_name_id = 64	
		WHERE business.bsn_status LIKE '%|3|%'
		Order By document_check_list.doc_date_uploaded DESC";
		
$paData = $fwDb->query($sql);

$message = "<html> <body>";
$message .= "<h3>Construction Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Customer Name</td><td>Project Name</td><td>Link</td>
            <td>HIA Signed Date</td> <td>Day Count</td><td>Construction Manager</td>
			<td>Construction Package</td> <td>Site Specific <br> Risk Assessment</td>
			<td>Construction Commencement <br> Appointment Notes</td> <td>Site Sketch </td>
			<td>Surveyor Site<br>Set Out</td><td>Floor System<br>Quality Assurance</td>
			 </tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
	
			    $sqla = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 64";
	
				$data = $fwDb->queryOne($sqla);
				
				if(!empty($data['doc_file_name']))
				 {
					$ccdate = $data['doc_date_uploaded'];
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
				   
				} else { $ccdate = ''; 
				         $days_at_status='';
					   }
				
				
				 $sql_cp = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 142";
				
				$data_cp = $fwDb->queryOne($sql_cp);
				
				$sql_ra = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 138";
				
				$data_ra = $fwDb->queryOne($sql_ra);
				
				
				$sql_ccan = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 252";
				
				$data_ccan = $fwDb->queryOne($sql_ccan);
				
				
				$sql_ss = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 253";
				
				$data_ss = $fwDb->queryOne($sql_ss);
				
//
				$sql_so = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 254";
				
				$data_so = $fwDb->queryOne($sql_so);
				
				$sql_fsqa = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 144";
				
				$sql_fsqa = $fwDb->queryOne($sql_fsqa);
				

//				
				
				$sqlc = "Select person_responsible_detail.* from person_responsible_detail
						  where person_responsible_detail.prd_bsn_id = ". $bsn_id . " And person_responsible_detail.prd_prm_id = 11";
				
				$data3 = $fwDb->queryOne($sqlc);
				
				if(!empty($data3['prd_name'])) {
						$cm_name = $data3['prd_name'];
				} else { $cm_name = ''; }
				
						 			
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
				
						$message .= "<tr>";
						$message .= "<td>".$srno."</td>";
						$message .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
						$message .= "<td>".$v['bsn_name']."</td>";
						$message .= "<td> <a href =".$link.">Link</a></td>";
						$message .= "<td>".changedate_d_m_y($data['doc_date_uploaded'])."</td>";
						$message .= "<td>".$days_at_status."</td>";
						$message .= "<td>".$cm_name."</td>";
						$message .= "<td>".changedate_d_m_y($data_cp['doc_date_uploaded'])." </td>";
						$message .= "<td>".changedate_d_m_y($data_ra['doc_date_uploaded'])." </td>";
						
						$message .= "<td>".changedate_d_m_y($data_ccan['doc_date_uploaded'])." </td>";
						$message .= "<td>".changedate_d_m_y($data_ss['doc_date_uploaded'])." </td>";
						
						$message .= "<td>".changedate_d_m_y($data_so['doc_date_uploaded'])." </td>";
						$message .= "<td>".changedate_d_m_y($sql_fsqa['doc_date_uploaded'])." </td>";
						
						$message .= "</tr>";
						$srno++;
						
   } 

   $message .= "</table></body></html>";
   
  
		$sqle = "Select ar_receving_email from automated_reports where ar_id = 8";
		$emaildata = $fwDb->queryOne($sqle);
		
		$emails = explode(",", $emaildata['ar_receving_email']);
		
//		if(!empty($emails)) {
//			foreach($emails as $ve)
//			{
//				send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Construction Report', $message, $attachment='');	
//			}
//		}


send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'admin@deckquotes.com.au', 'Construction Report 2', $message, $attachment='');

exit;
	