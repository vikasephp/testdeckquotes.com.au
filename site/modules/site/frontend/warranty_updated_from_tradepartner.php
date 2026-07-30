<?php

    $prsql = "SELECT ws_wa_id, ws_date, ws_update_text FROM warranty_supplier_update WHERE ws_date > CURDATE( ) - INTERVAL 1 DAY ";
    $prData = $fwDb->query($prsql);
   
 	 
	 $html = "<html><body>";
	 $html .= "<p>Hi Inclusions Coordinator, </p>";
	
	 $html .= "<p>Please see the below table for updated warranty logs from trade partners since yesterday.</p>";
	 
     $html .= '<table border="1" width="100%" cellpadding="5">';
	 $html .= '<tr>';
	 $html .= '<td> Rec No </td><td> Project Address </td><td>Include Trades</td><td>Update from Suppliers</td>';
	 $html .= '</tr>';
	
	foreach($prData as $k=>$v)
	 {
	
	   $sql = "Select wa_project, wa_include_supplier from warranty_log where wa_id = ".$v['ws_wa_id'];
	   $wdata = $fwDb->queryOne($sql);
	
	   $x = explode("<br>",$wdata['wa_include_supplier']);
		
		$incsup = [];
		  foreach($x as $k3=>$v3)
		  {
			preg_match('~>\K[^<>]*(?=<)~',  $v3,$str);
		
			$incsup[] = $str[0];	
		  }
	
	 	 $html .= '<tr>';
		 $html .= '<td>'.$v['ws_wa_id'].'</td>';
		 $html .= '<td>'.$wdata['wa_project']. '</td>';
		 $html .= '<td>'.implode("<br>",$incsup).'</td>';
		 $html .= '<td>'.$v['ws_update_text'].'</td>';
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
	  
	 send_email($toname, $to, 'CGFB',  'warranty@cgfb.com.au', 'Warranty Log Updated from Trade Partners', $html, $attachment='');
	 send_email($toname, $to1, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Updated from Trade Partners', $html, $attachment='');
	 send_email($toname, $to2, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Updated from Trade Partners', $html, $attachment='');
	 send_email($toname, $to3, 'CGFB', 'warranty@cgfb.com.au', 'Warranty Log Updated from Trade Partners', $html, $attachment='');
	 
	 
	 					
exit;