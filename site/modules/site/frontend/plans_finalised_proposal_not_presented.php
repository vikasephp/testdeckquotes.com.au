<?php

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		Inner Join bus_automated_reports ON  business_sellers.bs_business_id =  bus_automated_reports.bar_bsn_id
		where bus_automated_reports.bar_report_yesno = 1 And bus_automated_reports.bar_ar_id = 5
		Order By business.bsn_status_date DESC";

$paData = $fwDb->query($sql);

$message = "<html> <body>";
$message .= "<h3>Plans Finalised Proposal Not Presented</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Name</td><td>Project</td><td>Link</td><td>Create Record Date</td><td>Day Count</td>
			<td>Project Status</td><td>Customer Designer Sign-Off on Final Approved Plans </td>
			<td>Customer Project Proposal - PDF (Salesperson)</td>
			<td>UID 400 Marked Complete</td></tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
		
				$Statusdate = changedate_y_m_d($v['bsn_status_date']);
				$curdate_y_m_d = date('Y-m-d');
				$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
	
			    $sqla = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 266";
	
				$data1 = $fwDb->queryOne($sqla);
				
				if(!empty($data1['doc_file_name']))
				 {
					   $completed266 ='Yes'; 
				} else { 
						 $completed266 ='No'; 
					   }
			
				$sqlb = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 53";
	
				$data2 = $fwDb->queryOne($sqlb);
				
				if(!empty($data2['doc_file_name']))
				 {
					   $completed53 ='Yes'; 
				} else { 
						 $completed53 ='No'; 
					   }
			
				$sql = "Select business_tasks.* from business_tasks
				         where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 400";
	
				$yndata = $fwDb->queryOne($sql);
				
				$yn = $yndata['bt_complete'];
				if($yn == 1) { $uidcomplete = "Yes"; } else {  $uidcomplete = "No"; }		
						
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
									
				$message .= "<tr>";
				$message .= "<td>".$srno."</td>";
				$message .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
				$message .= "<td>".$v['bsn_name']."</td>";
				$message .= "<td> <a href =".$link.">Link</a></td>";
			
				$message .= "<td>".$v['bsn_status_date']."</td>";
				$message .= "<td>".$days_at_status."</td>";
				$message .= "<td>".$v['bsn_sub_status']."</td>";
				$message .= "<td>".$completed266."</td>";
				$message .= "<td>".$completed53."</td>";
				$message .= "<td>".$uidcomplete. "</td>";
			
				$message .= "</tr>";
				$srno++;
   }

$message .= "</table></body></html>";

//db($message);
//exit;
send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@deckquotes.com.au', 'Plans Finalised Proposal Not Presented', $message, $attachment='');
send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@deckquotes.com.au', 'Plans Finalised Proposal Not Presented', $message, $attachment='');
send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@deckquotes.com.au', 'Plans Finalised Proposal Not Presented', $message, $attachment='');

//send_email('Vikas Gupta', 'i@ephpsolutions.com', 'Capitalcommercial', 'sales@capitalcommercial.com.au', 'Status Report - Business In Preparation', $message, $attachment='');

 
exit;
	