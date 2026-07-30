<?php

/************************* Store and track record in database block start here ********************************/
$current_date = date("Y-m-d"); $cron_job_name = "design_agreement_report_new";
$total_r = $fwDb->query("SELECT * FROM track_cron_job WHERE date = '".$current_date."' and name = '".$cron_job_name."'");
// echo "<pre>"; print_r($total_r);
if( !empty($total_r) && count($total_r) > 0)
{
    exit("Query has already run out.");
}
    
$host_url= "No URL";
$host_url = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

$cron_job_name = "design_agreement_report_new"; 
$track_sql = "INSERT INTO `track_cron_job`(`name`, `host_url`,`date`) VALUES ('".$cron_job_name."','".$host_url."','".$current_date."')";
$trackData = $fwDb->queryOne($track_sql);
// exit('there');

/************************* Store and track record in database block end here ********************************/

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		Inner Join bus_automated_reports ON  business_sellers.bs_business_id =  bus_automated_reports.bar_bsn_id
		Inner Join document_check_list ON business_sellers.bs_business_id = document_check_list.doc_bsn_id And document_check_list.doc_name_id = 45
		where bus_automated_reports.bar_report_yesno = 1 And bus_automated_reports.bar_ar_id = 2
		Order By document_check_list.doc_date_uploaded DESC";

$paData = $fwDb->query($sql);

$message = "<html> <body>";
$message .= "<h3>Design Agreement Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Customer Name</td><td>Project Name</td><td>Link</td>
            <td>Customer Completed Signed Customer Design Authority Upload Date</td> <td>Day Count - Design Agreement</td>
			<td>Project Status</td><td>Person Resonsible Designer</td><td>Person Responsible Overseas Architect</td>
			<td>Approved Customer Design - Floor Plan</td><td>Operations Calculator - excel (Operations Manager and Salesperson)</td>
			<td>Customer Project Proposal - PDF (Salesperson)</td><td>Proposal Presentation Meeting Completed Template</td><tr>";

	$srno=1;
	
//	echo "<pre>"; print_r($paData);
//	echo "the last ride"; exit('before sending mail');
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
	
			    $sqla = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 45";
	
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
				
				 $sqlb = "Select document_check_list.doc_file_name from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 266";
	
				$data2 = $fwDb->queryOne($sqlb);
									
				if(!empty($data2['doc_file_name']))
				 {
				        $app_plan ='Yes'; 
				} else {
						 $app_plan ='No'; 
					   }	
				
				
				 $sqlc = "Select person_responsible_detail.prd_name from person_responsible_detail
						  where person_responsible_detail.prd_bsn_id = ". $bsn_id . " And person_responsible_detail.prd_prm_id = 5";
				
				$data3 = $fwDb->queryOne($sqlc);
				
				if(!empty($data3['prd_name'])) {
						$des_name = $data3['prd_name'];
				} else { $des_name = ''; }
				
				
				$sqld = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded  from document_check_list
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
				
				
				
				$sqlfloor = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 62";
	
				$data5 = $fwDb->queryOne($sqlfloor);
			
				if(!empty($data5['doc_file_name']))
				 {
					  $floorplan = $data5['doc_date_uploaded'];
			  	 } else  { 
				        $floorplan = '';
				      }
				
				
			   $sqlover = "Select person_responsible_detail.prd_name from person_responsible_detail
						  where person_responsible_detail.prd_bsn_id = ". $bsn_id . " And person_responsible_detail.prd_prm_id = 6";
				
				$data6 = $fwDb->queryOne($sqlover);
				
				if(!empty($data6['prd_name'])) {
						$oa_name = $data6['prd_name'];
				} else { $oa_name = ''; }
				
				
				$sql54 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 54";
	
				$data54 = $fwDb->queryOne($sql54);
				
				if(!empty($data54['doc_file_name']))
				 {
					$date54 = $data54['doc_date_uploaded'];
				   
				} else { $date54 = ''; 
						
					   }
				
			$sql53 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 53";
	
				$data53 = $fwDb->queryOne($sql53);
				
				if(!empty($data53['doc_file_name']))
				 {
					$date53 = $data53['doc_date_uploaded'];
				   
				} else { $date53 = ''; 
						
					   }
				
			
			$sql267 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			             where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 267";
	
				$data267 = $fwDb->queryOne($sql267);
				
				if(!empty($data267['doc_file_name']))
				 {
					$date267 = $data267['doc_date_uploaded'];
				   
				} else { $date267 = ''; 
						
					   }	
						 			
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
				
						if(!empty($ccdate)) {	
						$message .= "<tr>";
						$message .= "<td>".$srno."</td>";
						$message .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
						$message .= "<td>".$v['bsn_name']."</td>";
						$message .= "<td> <a href =".$link.">Link</a></td>";
						$message .= "<td>".$ccdate."</td>";
						$message .= "<td>".$days_at_status."</td>";
						$message .= "<td>".$v['bsn_sub_status']."</td>";
						$message .="<td>" .$des_name. "</td>";
						$message .="<td>" .$oa_name. "</td>";
						$message .= "<td>".$floorplan."</td>";
						$message .="<td>" .$date54. "</td>";
					
						$message .= "<td>".$date53."</td>";
						$message .= "<td>".$date267."</td>";
						
						$message .= "</tr>";
						$srno++;
						}
   }
 
$message .= "</table></body></html>";


		$sqle = "Select ar_receving_email from automated_reports where ar_id = 2";
		$emaildata = $fwDb->queryOne($sqle);
		
		$emails = explode(",", $emaildata['ar_receving_email']);
		
		if(!empty($emails)) 
		{
			foreach($emails as $ve)
			{
				send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Design Agreement Report', $message, $attachment='');	
			}
		}

//send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Design Agreement Report', $message, $attachment='');

// echo "the last ride"; exit('before sending mail');
//send_email('Frank Walmsley', 'supportmanager@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Design Agreement Report', $message, $attachment='');
send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Design Agreement Report', $message, $attachment='');

//send_email('Jaskirat Singh', 'jas@ephpsolutions.com', 'CGFB', 'info@cgfb.com.au', 'Design Agreement Report', $message, $attachment='');
 
exit('Process is completed');
	