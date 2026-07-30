<?php

 $sql = "SELECT construction_calendar_enquiries.user_id, construction_calendar_enquiries.enquiry, business.bsn_name, bus_customers.bcust_fname, 
         bus_customers.bcust_lname FROM `construction_calendar_enquiries` 
		 Inner JOIN business ON construction_calendar_enquiries.project_id = business.bsn_id 
		 inner join bus_customers on    construction_calendar_enquiries.user_id = bus_customers.bcust_id 
		 where length(construction_calendar_enquiries.solution) <= 4 or construction_calendar_enquiries.solution IS NULL; ";
			
    $Data = $fwDb->query($sql);
    
 	 
	 $html = "<html><body>";
	 $html .= "<p>Hi Operations Team,  </p>";
	
	 $html .= "<p>Please see the below table for all unanswered questions on <a href='https://www.deckquotes.com.au/project_qa.home'>Project Q/A Clearing Center:</a> .</p>";
	 
     $html .= '<table border="1" width="100%" cellpadding="5">';
	 $html .= '<tr>';
	 $html .= '<td> Project Address </td><td>Customer Name </td><td>Question</td>';
	 $html .= '</tr>';
	
	 foreach($Data as $k=>$v)
	 {
	
		 $html .= '<tr>';
		 $html .= '<td>'.$v['bsn_name'].'</td>';
		 $html .= '<td>'.$v['bcust_fname'].' ' .$v['bcust_lname']. '</td>';
		 $html .= '<td>'.$v['enquiry'].'</td>';
		 $html .= '</tr>';
		
	 }
	 $html .= '</table>'; 	 
	 $html .= "<p>Regards,</p>";
	 $html .= "<p>CGFB Warranty Team</p>";
	 $html .= "</body></html>";
	 

	
    $toname1 = "Operations Manager";
	$toname2 = "Construction Manager";
	 
	 $to1 = "operations@cgfb.com.au";
	 $to2 = "construction@cgfb.com.au";

	 $to3 = "manojsoniephp@gmail.com";
	 
	  send_email($toname1, $to1, 'CGFB', 'alert@cgfb.com.au', 'Project Unanswered Questions', $html, $attachment='');
	  send_email($toname2, $to2, 'CGFB', 'alert@cgfb.com.au', 'Project Unanswered Questions', $html, $attachment='');
	  send_email($toname1, $to3, 'CGFB', 'alert@cgfb.com.au', 'Project Unanswered Questions', $html, $attachment='');
	
	 			
exit;