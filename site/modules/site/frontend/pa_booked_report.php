<?php

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		Inner Join bus_automated_reports ON  business_sellers.bs_business_id =  bus_automated_reports.bar_bsn_id
		where bus_automated_reports.bar_report_yesno = 1 And bus_automated_reports.bar_ar_id = 1
		Order By business.bsn_status_date DESC";
		
	

$paData = $fwDb->query($sql);

//db($paData);
//exit;

$message = "<html> <body>";
$message .= "<h3> Planning Assessment Not Yet Booked Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Customer Name</td><td>Project Name</td><td>Link</td><td>Date Of Enquiry </td><td>Project Status</td>
			<td>Needs Analysis Survey (Support) </td><td>Date Count</td> <td>Phone Follow Ups</td><td>Planning Assessment Booked </td></tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
		
				$Statusdate = changedate_y_m_d($v['bsn_status_date']);
				$curdate_y_m_d = date('Y-m-d');
				$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
	
			    $sqla = "Select business_tasks.* from business_tasks
				         where business_tasks.bt_bsn_id = ". $bsn_id . " And business_tasks.bt_task_id = 406";
	
				$yndata = $fwDb->queryOne($sqla);
				
				$yn = $yndata['bt_complete'];	
			
				$sql2 = "Select document_check_list.* from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 2";
			
			    $data1 = $fwDb->queryOne($sql2);
				if(!empty($data1['doc_file_name']))
				 {
					   $uploaded ='Yes'; 
				} else { 
					   $uploaded ='No'; 
					   }
				
				
					
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
		        $sfu = "Select count(*) as tot from  sales_followup where sf_pid = ".$v['bsn_id'];
        		$sfData = $fwDb->queryOne($sfu);
							
				$message .= "<tr>";
				$message .= "<td>".$srno."</td>";
				$message .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
				$message .= "<td>".$v['bsn_name']."</td>";
				$message .= "<td> <a href =".$link.">Link</a></td>";
			
				$message .= "<td>".$v['bsn_status_date']."</td>";
				$message .= "<td>".$v['bsn_sub_status']."</td>";
				$message .= "<td>".$uploaded."</td>";
				$message .= "<td>".$days_at_status."</td>";
				$message .= "<td>".$sfData['tot']."</td>";
				if($yn == 1) { 
			    		$message .= "<td>Yes</td>";
				} else {  $message .= "<td>No</td>"; }
				$message .= "</tr>";
				$srno++;
   }

$message .= "</table></body></html>";

//db($message);
//exit;
send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@deckquotes.com.au', 'Planning Assessment Not Yet Booked Report', $message, $attachment='');
send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@deckquotes.com.au', 'Planning Assessment Not Yet Booked Report', $message, $attachment='');
//send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@deckquotes.com.au', 'Planning Assessment Not Yet Booked Report', $message, $attachment='');

//send_email('Vikas Gupta', 'i@ephpsolutions.com', 'Capitalcommercial', 'sales@capitalcommercial.com.au', 'Status Report - Business In Preparation', $message, $attachment='');

 
exit;
	