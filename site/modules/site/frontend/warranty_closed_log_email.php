<?php

	$prsql = "SELECT  wa_id, wa_project, wa_problem, wa_include_supplier FROM warranty_log 
	          WHERE STR_TO_DATE(wa_status_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 1 DAY and wa_status = 'Closed'";
    $prData = $fwDb->query($prsql);

 	 
	 $html = "<html><body>";
	 $html .= "<p>Hi Inclusions Coordinator, </p>";
	
	 $html .= "<p>Please see the below table for new closed warranty logs since yesterday.</p>";
	 
     $html .= '<table border="1" width="100%" cellpadding="5">';
	 $html .= '<tr>';
	 $html .= '<td> Rec No </td><td> Project Address </td><td>Include Trades</td><td>Problem</td>';
	 $html .= '</tr>';
	
	 foreach($prData as $k=>$v)
	 {
	
		 $x = explode("<br>",$v['wa_include_supplier']);
		
			$incsup = [];
		  foreach($x as $k3=>$v3)
		  {
			preg_match('~>\K[^<>]*(?=<)~',  $v3,$str);
		
			$incsup[] = $str[0];	
		  }
	
		 $html .= '<tr>';
		 $html .= '<td>'.$v['wa_id'].'</td>';
		 $html .= '<td>'.$v['wa_project']. '</td>';
		 $html .= '<td>'.implode("<br>",$incsup).'</td>';
		 $html .= '<td>'.$v['wa_problem'].'</td>';
		 $html .= '</tr>';
		
	 }
	 $html .= '</table>'; 	 
	 $html .= "<p>Regards,</p>";
	 $html .= "<p>CGFB Warranty Team</p>";
	 $html .= "</body></html>";
	 

    $toname = "Inclusions Coordinator";
	 
	 $to = "inclusions@cgfb.com.au";
	 $to1 = "systems@cgfb.com.au";
	 $to2 = "clientservices@cgfb.com.au";
	 $to3 = "manojsoniephp@gmail.com";
	 
	  send_email($toname, $to, 'CGFB',  'warranty@cgfb.com.au', 'Warranty Log Closed Log Update', $html, $attachment='');
	  send_email($toname, $to1, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Closed Log Update', $html, $attachment='');
	  send_email($toname, $to2, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Closed Log Update', $html, $attachment='');
	  send_email($toname, $to3, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Closed Log Update', $html, $attachment='');
	 			
exit;