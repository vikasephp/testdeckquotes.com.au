<?php

/************************* Store and track record in database block start here ********************************/

$current_date = date("Y-m-d"); $cron_job_name = "weekly_email_to_customer";
$total_r = $fwDb->query("SELECT * FROM track_cron_job WHERE date = '".$current_date."' and name = '".$cron_job_name."'");

if( !empty($total_r) && count($total_r) > 0)
{
    exit("Query has already run out.");
}

$host_url= "No URL";
$host_url = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

$cron_job_name = "weekly_email_to_customer"; 
$track_sql = "INSERT INTO `track_cron_job`(`name`, `host_url`,`date`) VALUES ('".$cron_job_name."','".$host_url."','".$current_date."')";
$trackData = $fwDb->queryOne($track_sql);
 //exit('there');

/************************* Store and track record in database block end here ********************************/

$sql_1 = "SELECT * FROM warranty_log WHERE ( wa_status = 'Open' OR wa_status = 'Pending' ) and wa_weekly_email = 1 GROUP BY wa_project ";
$Data_1 = $fwDb->query($sql_1);

$current_date1 = date('Y-m-d');
$day = date("D", strtotime($current_date1));

foreach ($Data_1 as $k1=>$v1) 
{
	
    $sqlw = "Select * from warranty_log where wa_project = '".$v1['wa_project']."' and ( wa_status = 'Open' OR wa_status = 'Pending' )";
	$data_w = $fwDb->query($sqlw);
		
	$sql_info = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		  	 	bus_customers.bcust_misc_moble, bcust_misc_email1 from business_sellers 		
			 	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			 	Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			 	where business.bsn_name = '".$data_w[0]['wa_project']."'";  
	
		
	$data_2 = $fwDb->queryOne($sql_info);
	
	
	$message = "<html> <body>";
	$message .= "<p>Dear " .$data_2['bcust_fname']." </p><br>";
	$message .= "<p>Thank you for choosing our business. Please find the attached file to review the report of your warranty issues</p><br>";
	$message .= "<p>Yours Sincerely,</p>";
	$message .= "<p>CGFB and FPE Operations Team</p>";
	$message .= "</body></html>";		
	
	$html = "<h3> Warranty Issue Report </h3><br>";
	foreach($data_w as $k2=>$v2)
	{
		if($v2["wa_qicc"]==1) { $qicc='Yes'; } else { $qicc='No'; }
		
		if(!empty($v2["wa_image_1"])) {
			$img1 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_1"].'" height="150">';
		} else {
		        $img1 = '';	
		}
		
		if(!empty($v2["wa_image_2"])) {
			$img2 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_2"].'" height="150">';
		} else {
		        $img2 = '';	
		}
		
		if(!empty($v2["wa_image_3"])) {
			$img3 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_3"].'" height="150">';
		} else {
		        $img3 = '';	
		}
		
		if(!empty($v2["wa_image_4"])) {
			$img4 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_4"].'" height="150">';
		} else {
		        $img4 = '';	
		}
	
	
		if(!empty($v2["wa_image_5"])) {
			$img5 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_5"].'" height="150">';
		} else {
		        $img5 = '';	
		}
		
	
		
		$html .= '<table border ="1" cellpadding="5" cellspacing="0" style="border-collapse:collapse">';
		
			
		$html .= '<tr>';
		$html .= '<td width="15%">Project</td>';
		$html .= '<td width="85%">'.$v2["wa_project"].'</td>';
	    $html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td width="15%">Contact Info</td>';
		$html .= '<td width="85%">'.$data_2['bcust_fname'].' '.$data_2['bcust_lname'].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td width="15%">Status</td>';
		$html .= '<td width="85%">'.$v2["wa_status"].'</td>';
		$html .= '</tr>';
		
		$html .= '<tr>';
		$html .= '<td width="15%">Problem</td>';
		$html .= '<td width="85%">'.$v2["wa_problem"].'</td>';
		$html .= '</tr>';
		
		if(!empty($v2["wa_notes"])) {
			$html .= '<tr>';
	        $html .= '<td width="15%">Notes</td>';
			$html .= '<td width="85%">'.trim($v2["wa_notes"]).'</td>';
			$html .= '</tr>';
		}
		
		if(!empty($v2["wa_date"])) {
			$html .= '<tr>';
	       		$html .= '<td width="15%">Date</td>';
			$html .= '<td width="85%">'.trim($v2["wa_date"]).'</td>';
			$html .= '</tr>';
		}
		
		
		if(!empty($qicc)) {
			$html .= '<tr>';
	        	$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
			$html .= '<td width="85%">'.trim($qicc).'</td>';
			$html .= '</tr>';
		}
		
		if(!empty($v2["wa_date_inspected"])) {
			$html .= '<tr>';
			$html .= '<td width="15%">Date Inspected</td>';
			$html .= '<td width="85%">'.trim($v2["wa_date_inspected"]).'</td>';
			$html .= '</tr>';
		}
		
		if(!empty($v2["wa_cgfb_person"])) {
			$html .= '<tr>';
			$html .= '<td width="15%">CGFB Person</td>';
			$html .= '<td width="85%">'.$v2["wa_cgfb_person"].'</td>';
			$html .= '</tr>';
		}
		
		if(!empty($v2["wa_supplier"])) {
			$html .= '<tr>';
			$html .= '<td width="15%">Supplier</td>';
			$html .= '<td width="85%">'.$v2["wa_supplier"].'</td>';
			$html .= '</tr>';
		}
		
		$html .= '<tr>';
		$html .= '<td colspan="2">'.$img1.'&nbsp;'.$img2.'&nbsp;'.$img3.'&nbsp;'.$img4.'&nbsp;'.$img5.'</td>';
		$html .= '</tr>';
		
		$html .= "</table><br>";
	
	} // Innter loop ends here
	       
	 	$fdata ='';
	 	$to = $data_2['bcust_misc_email1']; 
		$toname = $data_2['bcust_fname'];
		$heading = "Warranty issues of you project";
		$attach1 = create_warranty_PDF($heading, $html, $toname);
		
		if(!empty($attach1)) {
			$fdata = [];
			$fdata[] = $attach1;	
		}
		if(!empty($fdata)) {			
				$attachmentsend = serialize($fdata);
		}
		
		$to2 = "manojsoniephp@gmail.com";
		
		if($day == 'Sun') {
			
			  send_email($toname, $to,  'CGFB', 'info@cgfb.com.au', 'CGFB Warranty Weekly Update', $message, $attachmentsend);
			  send_email($toname, $to2, 'CGFB', 'info@cgfb.com.au', 'CGFB Warranty Weekly Update', $message, $attachmentsend);
		}
	//} // Inner Loop			
}
	
exit('Process is completed');
