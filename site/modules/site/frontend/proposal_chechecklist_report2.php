<?php

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date, document_proposal_name.* from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		Right Join document_proposal_name on business_sellers.bs_business_id  = document_proposal_name.dpn_bsn_id 
		where document_proposal_name.dpn_include_in_report = 1
		Order By document_proposal_name.dpn_create_date DESC
		";

$paData = $fwDb->query($sql);

//db($paData);
//exit;

$message = "<html> <body>";
$message .= "<h3>Proposal Checklist Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Customer Name</td><td>Project Address</td><td>Link</td><td>Total</td>
			<td>ID</td> <td>Create Date</td><td>Day Count</td><td>Design Type</td><td>Customer Designer - Merged Final<br>Approved Plans - Signed By Customer -PDF</td>
			<td>Design Summary (Quantity Surveyor) </td><td>Opertations Calacultor</td>
			<td>Master Calcultator</td><td>Proposal PDF</td><td>Booked Appointment</td><td>Face to Face Meeting</td></tr>";


	$srno=1;
	foreach($paData as $k => $v)
	{
			$bsn_id =  $v['bsn_id'];
			
					
					  if(!empty($bsn_id)) {
			
	
						$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;	
			
						$sqltotal = "select document_check_list_mini_count.* from document_check_list_mini_count where dcnt_bsn_id =" .$bsn_id;
						$totalData = $fwDb->queryOne($sqltotal);
			
						$Statusdate = changedate_y_m_d($v['dpn_create_date']);
						$curdate_y_m_d = date('Y-m-d');
						$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
						
						if($v['dpn_design_type'] == 1) { $dt = "Concept Design" ; }
						elseif($v['dpn_design_type'] == 2) { $dt = "Modification Design" ; }
						elseif($v['dpn_design_type'] == 3) { $dt = "Existing Design" ; }
						elseif($v['dpn_design_type'] == 4) { $dt = "External Design" ; }
					
						$upsql_4 = "select document_check_list_mini.doc_name_id,  document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded from 	document_check_list_mini
								   where document_check_list_mini.doc_checklist_number = ".$v['dpn_proposal_number']. "
								   and  document_check_list_mini.doc_name_id = 4 and document_check_list_mini.doc_bsn_id = ". $bsn_id;
						
						$data4 = $fwDb->queryOne($upsql_4);
					   
						$upsql_13 = "select document_check_list_mini.doc_name_id,  document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded from 	document_check_list_mini
								   where document_check_list_mini.doc_checklist_number = ".$v['dpn_proposal_number']. "
								   and  document_check_list_mini.doc_name_id = 13 and document_check_list_mini.doc_bsn_id = ". $bsn_id;
						
						$data13 = $fwDb->queryOne($upsql_13);
					
					
						$upsql_6 = "select document_check_list_mini.doc_name_id,  document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded from 	document_check_list_mini
								   where document_check_list_mini.doc_checklist_number = ".$v['dpn_proposal_number']. "
								   and  document_check_list_mini.doc_name_id = 6 and document_check_list_mini.doc_bsn_id = ". $bsn_id;
						
						$data6 = $fwDb->queryOne($upsql_6);	
						
						
						$upsql_7 = "select document_check_list_mini.doc_name_id,  document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded from 	document_check_list_mini
						     	   where document_check_list_mini.doc_checklist_number = ".$v['dpn_proposal_number']. "
								   and  document_check_list_mini.doc_name_id = 7 and document_check_list_mini.doc_bsn_id = ". $bsn_id;
						
						$data7 = $fwDb->queryOne($upsql_7);
						
						$upsql_10 = "select document_check_list_mini.doc_name_id,  document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded from 	document_check_list_mini
						     	   where document_check_list_mini.doc_checklist_number = ".$v['dpn_proposal_number']. "
								   and  document_check_list_mini.doc_name_id = 10 and document_check_list_mini.doc_bsn_id = ". $bsn_id;
								   
												
						$sql_uid10 = "select proposal_tasks.bt_completed_date,  proposal_tasks.bt_complete  from proposal_tasks
						     	   where proposal_tasks.bt_task_list_number  = ".$v['dpn_proposal_number']. "
								   and  proposal_tasks.bt_task_id = 10 and proposal_tasks.bt_bsn_id = ". $bsn_id;
						
						$data_uid10 = $fwDb->queryOne($sql_uid10);
						
						$sql_uid8 = "select proposal_tasks.bt_completed_date,  proposal_tasks.bt_complete  from proposal_tasks
						     	   where proposal_tasks.bt_task_list_number  = ".$v['dpn_proposal_number']. "
								   and  proposal_tasks.bt_task_id = 8 and proposal_tasks.bt_bsn_id = ". $bsn_id;
						
						$data_uid8 = $fwDb->queryOne($sql_uid8);
									
						$message .= "<tr>";
						$message .= "<td>".$srno."</td>";
						$message .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
						$message .= "<td>".$v['bsn_name']."</td>";
						$message .= "<td> <a href =".$link.">Link</a></td>";
						$message .= "<td align='center'>".$totalData['dcnt_counter']."</td>";
						$message .= "<td>".$v['dpn_unique_id']."</td>";
						
						$message .= "<td>".changedate_d_m_Y($v['dpn_create_date'])."</td>";
						
						if($v['dpn_create_date'] != '0000-00-00 00:00:00') {
						$message .= "<td align='center'>".$days_at_status."</td>";
						} else {
						$message .= "<td></td>";	
						}
						$message .= "<td>".$dt."</td>";
						$message .= "<td>".changedate_d_m_Y($data4['doc_date_uploaded'])."</td>";
						$message .= "<td>".changedate_d_m_Y($data13['doc_date_uploaded'])."</td>";
						$message .= "<td>".changedate_d_m_Y($data6['doc_date_uploaded'])."</td>";
						$message .= "<td>".changedate_d_m_Y($data7['doc_date_uploaded'])."</td>";
						$message .= "<td>".changedate_d_m_Y($data10['doc_date_uploaded'])."</td>";
						
						if($data_uid10['bt_complete'] == 1) {
						$message .= "<td>".changedate_d_m_Y($data_uid10['bt_completed_date'])." </td>";
						} else {
								$message .= "<td></td>";
						}
						
						if($data_uid8['bt_complete'] == 1) {
						$message .= "<td>".changedate_d_m_Y($data_uid8['bt_completed_date'])." </td>";
						} else {
								$message .= "<td></td>";
						}
						$message .= "</tr>";
						$srno++;
					  }
			
   }

$message .= "</table></body></html>";

db($message);
exit;

send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Proposal Checklist Report', $message, $attachment='');
send_email('Frank Walmsley', 'designs@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Proposal Checklist Report', $message, $attachment='');
send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Proposal Checklist Report', $message, $attachment='');
send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Proposal Checklist Report', $message, $attachment='');

exit;
	