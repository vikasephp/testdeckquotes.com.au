<?php

	$prsql = "SELECT  wa_id, wa_project, wa_problem FROM warranty_log 
	          WHERE STR_TO_DATE(wa_status_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 1 DAY and ( wa_status = 'Open' or wa_status = 'Pending')";
    $prData = $fwDb->query($prsql);

 	 
	 $html = "<html><body>";
	 $html .= "<p>Hi Inclusions Coordinator, </p>";
	
	 $html .= "<p>Please see the below table for new lodged warranty issue since yesterday.</p>";
	 
     $html .= '<table border="1" width="100%" cellpadding="5">';
	 $html .= '<tr>';
	 $html .= '<td> Rec No </td><td> Project Address </td><td>Customer Info</td><td>Problem</td>';
	 $html .= '</tr>';
	
	 foreach($prData as $k=>$v)
	 {
	
		  $sql_info = "SELECT  business_sellers.bs_business_id,  bus_customers.bcust_fname, 
		        	  bus_customers.bcust_lname, bus_customers.bcust_misc_moble from business_sellers 		
			 		  Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
					  Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			 		  where business.bsn_name = '".$v['wa_project']."'";  
		
		  $data_3 = $fwDb->queryOne($sql_info);
		
	
		 $html .= '<tr>';
		 $html .= '<td>'.$v['wa_id'].'</td>';
		 $html .= '<td>'.$v['wa_project']. '</td>';
		 $html .= '<td>'.$data_3['bcust_fname'].' '.$data_3['bcust_lname'].' - '.$data_3['bcust_misc_moble'].'</td>';
		 $html .= '<td>'.$v['wa_problem'].'</td>';
		 $html .= '</tr>';
		
	 }
	 $html .= '</table>'; 	 
	 $html .= "<p>Regards,</p>";
	 $html .= "<p>CGFB Warranty Team</p>";
	 $html .= "</body></html>";
	 
	// db($html);

    $toname = "Inclusions Coordinator";
	 
	$to = "inclusions@cgfb.com.au";
	$to1 = "systems@cgfb.com.au";
	 $to2 = "clientservices@cgfb.com.au";
	 $to3 = "manojsoniephp@gmail.com";
	 
	   send_email($toname, $to,  'CGFB', 'warranty@cgfb.com.au', 'Warranty Log New Lodged Issues', $html, $attachment='');
	   send_email($toname, $to1, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log New Lodged Issues', $html, $attachment='');
	   send_email($toname, $to2, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log New Lodged Issues', $html, $attachment='');
	   send_email($toname, $to3, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log New Lodged Issues', $html, $attachment='');
	 			
exit;