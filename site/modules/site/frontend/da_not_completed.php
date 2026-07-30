<?php

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		Inner Join bus_automated_reports ON  business_sellers.bs_business_id =  bus_automated_reports.bar_bsn_id
		Inner Join document_check_list ON business_sellers.bs_business_id = document_check_list.doc_bsn_id And document_check_list.doc_name_id = 45
		where bus_automated_reports.bar_report_yesno = 1 And bus_automated_reports.bar_ar_id = 4
		Order By document_check_list.doc_date_uploaded ASC";
		
	

$paData = $fwDb->query($sql);

//db($paData);
//exit;

$message = "<html> <body>";
$message .= "<h3> Design Agreement Signed Final Plans Not Completed</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Customer Name</td><td>Project Name</td><td>Link</td>
            <td>Customer Completed - <br> Signed Customer Design <br>Authority - Date  </td>
			<td>Day Count</td> <td>Project Status</td><td>Customer Completed - <br>Signed Customer Design Authority</td>
			<td>Customer Designer Sign-Off <br>on Final Approved Plans</td><td>Approved Customer Design - Floor Plan</td>
			<td>Person Resonsible Designer</td><td>Person Responsible Overseas Architect</td><td>Alerts</td>
			
			</tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
	
			    $sqla = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 45";
	
				$data = $fwDb->queryOne($sqla);
				
				if(!empty($data['doc_file_name']))
				 {
					$ccdate = $data['doc_date_uploaded'];
					$Statusdate = changedate_y_m_d($ccdate);
					$curdate_y_m_d = date('Y-m-d');
					$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
				    $completed ='Yes'; 
				} else { $ccdate = ''; 
				         $days_at_status='';
						 $completed ='No'; 
					   }
				
				 $sqlb = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 266";
	
				$data2 = $fwDb->queryOne($sqlb);
									
				if(!empty($data2['doc_file_name']))
				 {
				        $app_plan ='Yes'; 
				} else {
						 $app_plan ='No'; 
					   }	
				
				
				 $sqlc = "Select person_responsible_detail.* from person_responsible_detail
						  where person_responsible_detail.prd_bsn_id = ". $bsn_id . " And person_responsible_detail.prd_prm_id = 5";
				
				$data3 = $fwDb->queryOne($sqlc);
				
				if(!empty($data3['prd_name'])) {
						$des_name = $data3['prd_name'];
				} else { $des_name = ''; }
				
				
				$sqld = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 213";
	
				$data4 = $fwDb->queryOne($sqld);
			
				if(!empty($data4['doc_file_name']))
				 {
					$dadate = $data4['doc_date_uploaded'];
					$Statusdate = changedate_y_m_d($dadate);
					$curdate_y_m_d = date('Y-m-d');
					$days_count = daysDifference($curdate_y_m_d, $Statusdate);
				} else { $dadate = ''; 
				         $days_count='';
					   }
				
				
				
				$sqlfloor = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 62";
	
				$data5 = $fwDb->queryOne($sqlfloor);
			
				if(!empty($data5['doc_file_name']))
				 {
					  $floorplan = 'Yes';
			  	 } else  { 
				        $floorplan = 'No';
				      }
				
				
			   $sqlover = "Select person_responsible_detail.* from person_responsible_detail
						  where person_responsible_detail.prd_bsn_id = ". $bsn_id . " And person_responsible_detail.prd_prm_id = 6";
				
				$data6 = $fwDb->queryOne($sqlover);
				
				if(!empty($data6['prd_name'])) {
						$oa_name = $data6['prd_name'];
				} else { $oa_name = ''; }
				
						 			
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
				
				if(!empty($data['doc_file_name'])) {			
						$message .= "<tr>";
						$message .= "<td>".$srno."</td>";
						$message .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
						$message .= "<td>".$v['bsn_name']."</td>";
						$message .= "<td> <a href =".$link.">Link</a></td>";
						$message .= "<td>".$ccdate."</td>";
						$message .= "<td>".$days_at_status."</td>";
						$message .= "<td>".$v['bsn_sub_status']."</td>";
						$message .= "<td>".$completed."</td>";
						$message .= "<td>".$app_plan."</td>";
						$message .= "<td>".$floorplan."</td>";
						$message .="<td>" .$des_name. "</td>";
						$message .="<td>" .$oa_name. "</td>";
						$message .="<td>" .''. "</td>";
						$message .= "</tr>";
						$srno++;
				}
   }

$message .= "</table></body></html>";

//db($message);
//exit;

send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@deckquotes.com.au', 'Design Agreement Signed Final Plans Not Completed', $message, $attachment='');
send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@deckquotes.com.au', 'Design Agreement Signed Final Plans Not Completed', $message, $attachment='');
send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@deckquotes.com.au', 'Design Agreement Signed Final Plans Not Completed', $message, $attachment='');

//send_email('Vikas Gupta', 'i@ephpsolutions.com', 'Capitalcommercial', 'sales@capitalcommercial.com.au', 'Status Report - Business In Preparation', $message, $attachment='');

 
exit;
	