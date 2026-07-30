<?php

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_date, business.bsn_rating from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id Order By business.bsn_status_date DESC";

$paData = $fwDb->query($sql);

//db($paData);
//exit;

$message = "<html> <body>";
$message .= "<h3>Top Prospect Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Customer Name</td><td>Project Name</td><td>Link</td>
            <td>Day Count</td><td>Project Status</td><td>Project Proposal Date</td><td>Star Ranking</td><td>Alerts</td>
			<td>30 Day Letter</td><td>60 Day Letter</td><td>90 Day Letter</td> <td>Sales Person</td></tr>";
		   

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
				
				$Statusdate = changedate_y_m_d($v['bsn_status_date']);
				$curdate_y_m_d = date('Y-m-d');
				$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
	
				$sqlProposal = "Select document_check_list.* from document_check_list
			                    where document_check_list.doc_bsn_id = ". $bsn_id . " And document_check_list.doc_name_id = 52";
	
				$proposalData = $fwDb->queryOne($sqlProposal);
			
				if(!empty($proposalData['doc_file_name']))
				 {
					  $pdate = $proposalData['doc_date_uploaded'];
			  	 } else  { 
				          $pdate = '';
				         }
				
									 			
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
						
						if($v['bsn_rating'] >= 4 )
						{	
						$message .= "<tr>";
						$message .= "<td>".$srno."</td>";
						$message .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
						$message .= "<td>".$v['bsn_name']."</td>";
						$message .= "<td> <a href =".$link.">Link</a></td>";
						$message .= "<td>".$days_at_status."</td>";
						$message .= "<td>".$v['bsn_sub_status']."</td>";
						$message .= "<td>" .$pdate. "</td>";
						$message .= "<td>" .$v['bsn_rating']. "</td>";
						$message .= "<td>".''."</td>";
						$message .= "<td>" .''. "</td>";
						$message .= "<td>".''."</td>";
						$message .= "<td>".''."</td>";
						$message .= "<td>" .''. "</td>";
						$message .= "</tr>";
						$srno++;
						}
  }

$message .= "</table></body></html>";
		$sqle = "Select ar_receving_email from automated_reports where ar_id = 5";
		$emaildata = $fwDb->queryOne($sqle);
		
		$emails = explode(",", $emaildata['ar_receving_email']);
		
		if(!empty($emails)) {
			foreach($emails as $ve)
			{
				send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Top Prospect Report', $message, $attachment='');	
			}
		}

//send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Top Prospect Report', $message, $attachment='');
//send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Top Prospect Report', $message, $attachment='');
//send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Top Prospect Report', $message, $attachment='');
 
exit;
	