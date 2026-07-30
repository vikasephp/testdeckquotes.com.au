<?php

/************************* Store and track record in database block start here ********************************/
$table = new Fw_Db_Table("warranty_email_log_customer");
$current_date = date("Y-m-d");
$cron_job_name = "weekly_email_to_customer";
$total_r = $fwDb->query("SELECT * FROM track_cron_job WHERE date = '" . $current_date . "' and name = '" . $cron_job_name . "'");

if (!empty($total_r) && count($total_r) > 0) {
	exit("Query has already run out.");
}

$host_url = "No URL";
$host_url = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

$cron_job_name = "weekly_email_to_customer";
$track_sql = "INSERT INTO `track_cron_job`(`name`, `host_url`,`date`) VALUES ('" . $cron_job_name . "','" . $host_url . "','" . $current_date . "')";
$trackData = $fwDb->queryOne($track_sql);
//exit('there');

/************************* Store and track record in database block end here ********************************/

$sql_1 = "SELECT * FROM warranty_log WHERE ( wa_status = 'Open' OR wa_status = 'Pending' ) and wa_weekly_email = 1 GROUP BY wa_project ";
$Data_1 = $fwDb->query($sql_1);

$current_date1 = date('Y-m-d');
$day = date("D", strtotime($current_date1));

foreach ($Data_1 as $k1 => $v1) {

	$sqlw = "Select * from warranty_log where wa_project = '" . $v1['wa_project'] . "' and ( wa_status = 'Open' OR wa_status = 'Pending' )";
	$data_w = $fwDb->query($sqlw);

	$sql_info = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		  	 	bus_customers.bcust_misc_moble, bcust_misc_email1, bcust_misc_email2 from business_sellers 		
			 	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			 	Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			 	where business.bsn_name = '" . $data_w[0]['wa_project'] . "'";


	$data_2 = $fwDb->queryOne($sql_info);


	$message = "<html> <body>";
	$message .= "<p>Dear " . $data_2['bcust_fname'] . " </p><br>";
	$message .= "<p>Thank you for choosing our business. Please find the attached file to review the report of your warranty issues</p><br>";
	$message .= "<p>Yours Sincerely,</p>";
	$message .= "<p>CGFB and FPE Operations Team</p>";
	$message .= "</body></html>";

	$html = "<h3> Warranty Issue Report </h3><br>";
	$i = 0;
	foreach ($data_w as $k2 => $v2) {

		$sqlnotes = "select * from warranty_log_notes where wn_wa_id = " . $v2['wa_id'];
		$notesData = $fwDb->query($sqlnotes);

		$sql_2 = "Select ws_supplier_name, ws_update_text, ws_attachment, ws_date,ws_wr from warranty_supplier_update where  ws_wa_id = " . $v2['wa_id'];
		$suData = $fwDb->query($sql_2);

		$sqlenquiry = "select * from warranty_enquiry  where we_wa_id = " . $v2['wa_id'];
		$enquiryData = $fwDb->query($sqlenquiry);

		$notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
		$notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Attachment</td></tr>';

		if (!empty($notesData)) {

			foreach ($notesData as $kn => $vn) {

				$notes .= '<tr>';
				$notes .= '<td>' . stripslashes($vn['wn_notes']) . '</td>';
				$notes .= '<td>' . $vn['wn_added_by'] . '</td>';
				$notes .= '<td>' . $vn['wn_date'] . '</td>';
				$notes .= '<td>';
				if (!empty($vn['wn_attachment'])) {
					$notes .= '<a href="' . BASE_URL . "files/uploads/" . $vn['wn_attachment'] . '">Link</a>';
				}
				$notes .= '</td>';
				$notes .= '</tr>';
			}
		}


		if (!empty($suData)) {

			foreach ($suData as $kn2 => $vn2) {

				$notes .= '<tr>';
				$notes .= '<td>' . stripslashes($vn2['ws_update_text']) . '</td>';
				$notes .= '<td>' . $vn2['ws_supplier_name'] . '</td>';
				$notes .= '<td>' . changedate_d_m_y($vn2['ws_date']) . '</td>';
				$notes .= '<td>';
				if (!empty($vn2['ws_attachment'])) {
					$notes .= '<a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/' . $vn2['ws_attachment'] . '">Link</a>';
				}
				$notes .= '</td>';
				$notes .= '</tr>';
			}
		}


		$notes .= '</table>';

		$enquiry = '<table border = "1" cellpadding="5" cellspacing="0" >';
		$enquiry .= '<tr><td>Enquiry</td><td>Answer</td><td>Date Added</td></tr>';

		if (!empty($enquiryData)) {

			foreach ($enquiryData as $ke => $ve) {

				$enquiry .= '<tr>';
				$enquiry .= '<td>' . stripslashes($ve['we_enquiry']) . '</td>';
				$enquiry .= '<td>' . stripslashes($ve['we_answer']) . '</td>';
				$enquiry .= '<td>' . $ve['we_date'] . '</td>';
				$enquiry .= '</tr>';
			}
		}

		$enquiry .= '</table>';

		if (empty($enquiryData)) {
			$enquiry = "";
		}


		if ($v2["wa_qicc"] == 1) {
			$qicc = 'Yes';
		} else {
			$qicc = 'No';
		}

		if (!empty($v2["wa_image_1"])) {

			$folder_path = "files/warranty_log/";
			$object_name = $v2["wa_image_1"];
			$file = get_file_raw_data($folder_path, $object_name);
			$img1 = '<img src="' . $file . '" height="150">';

			//$img1 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_1"].'" height="150">';
		} else {
			$img1 = '';
		}

		if (!empty($v2["wa_image_2"])) {
			$folder_path = "files/warranty_log/";
			$object_name = $v2["wa_image_2"];
			$file = get_file_raw_data($folder_path, $object_name);
			$img2 = '<img src="' . $file . '" height="150">';

			//$img2 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_2"].'" height="150">';
		} else {
			$img2 = '';
		}

		if (!empty($v2["wa_image_3"])) {
			$folder_path = "files/warranty_log/";
			$object_name = $v2["wa_image_3"];
			$file = get_file_raw_data($folder_path, $object_name);
			$img3 = '<img src="' . $file . '" height="150">';


			//$img3 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_3"].'" height="150">';
		} else {
			$img3 = '';
		}

		if (!empty($v2["wa_image_4"])) {

			$folder_path = "files/warranty_log/";
			$object_name = $v2["wa_image_4"];
			$file = get_file_raw_data($folder_path, $object_name);
			$img4 = '<img src="' . $file . '" height="150">';

			//$img4 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_4"].'" height="150">';
		} else {
			$img4 = '';
		}


		if (!empty($v2["wa_image_5"])) {
			$folder_path = "files/warranty_log/";
			$object_name = $v2["wa_image_5"];
			$file = get_file_raw_data($folder_path, $object_name);
			$img5 = '<img src="' . $file . '" height="150">';


			//$img5 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$v2["wa_image_5"].'" height="150">';
		} else {
			$img5 = '';
		}



		// New code starts

		$sql_cg = "select wc_cgfb_option from warranty_log_cgfb where wc_id = " . $v2['wa_cgfb_resp'];
		$cgfbdata = $fwDb->queryOne($sql_cg);

		$sql_why = "select ww_option from warranty_log_why_not where ww_id = " . $v2['wa_why_not'];
		$whybdata = $fwDb->queryOne($sql_why);

		$sql_la = "select wl_liability_option  from warranty_log_liability where wl_id = " . $v2['wa_lia_acc'];
		$labdata = $fwDb->queryOne($sql_la);

		//if($v2['wa_tl'] == 1 ) { $backcol = 'style="background-color:#00CC33"'; }
		//elseif($v2['wa_tl'] == 2 ) { $backcol = 'style="background-color:#ff7f27"'; }
		//elseif($v2['wa_tl'] == 3 ) { $backcol = 'style="background-color:#F00"'; }
		//else { $backcol =''; }

		if ($v2['wa_variation'] == 1) {
			$variation = 'Yes';
		} else {
			$variation = 'No';
		}
		$area = '';
		if ($v2["wa_area"] == 1) {
			$area = 'Inside';
		} elseif ($v2["wa_area"] == 2) {
			$area = 'Outside';
		}

		$v2["wa_problem"] = str_replace("’", "'", $v2["wa_problem"]);

		// New code ends


		$html .= '<html><body><table border ="1" cellpadding="5" cellspacing="0" style="border-collapse:collapse">';


		$html .= '<tr>';
		$html .= '<td width="15%">Project</td>';
		$html .= '<td width="85%">' . $v2["wa_project"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Contact Info</td>';
		$html .= '<td width="85%">' . $data_2['bcust_fname'] . ' ' . $data_2['bcust_lname'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Responsible</td>';
		$html .= '<td width="85%">' . $cgfbdata["wc_cgfb_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Why Not Responsible</td>';
		$html .= '<td width="85%">' . $whybdata["ww_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Liability Accepted</td>';
		$html .= '<td width="85%">' . $labdata["wl_liability_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Area</td>';
		$html .= '<td width="85%">' . $area . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Status</td>';
		$html .= '<td width="85%">' . $v2["wa_status"] . '</td>';
		$html .= '</tr>';

		//$html .= '<tr>';
		//$html .= '<td width="15%">Traffic Light</td>';
		//$html .= '<td width="85%"'.$backcol.'></td>';
		//$html .= '</tr>';


		$html .= '<tr>';
		$html .= '<td width="15%">Variation Required</td>';
		$html .= '<td width="85%">' . $variation . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Problem</td>';
		$html .= '<td width="85%">' . $v2["wa_problem"] . '</td>';
		$html .= '</tr>';

		if (strlen(trim($notes)) > 170) {
			$html .= '<tr>';
			$html .= '<td width="15%">Notes</td>';
			$html .= '<td width="85%">' . $notes . '</td>';
			$html .= '</tr>';
		}

		$html .= '<tr>';
		$html .= '<td width="15%">Customer Enquiry</td>';
		$html .= '<td width="85%">' . $enquiry . '</td>';
		$html .= '</tr>';

		if (!empty($v2["wa_date"])) {
			$html .= '<tr>';
			$html .= '<td width="15%">Date</td>';
			$html .= '<td width="85%">' . trim($v2["wa_date"]) . '</td>';
			$html .= '</tr>';
		}



		$html .= '<tr>';
		$html .= '<td width="15%">Type</td>';
		$html .= '<td width="85%">' . $v2["wa_type"] . '</td>';
		$html .= '</tr>';

		if (!empty($qicc)) {
			$html .= '<tr>';
			$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
			$html .= '<td width="85%">' . trim($qicc) . '</td>';
			$html .= '</tr>';
		}

		if (!empty($v2["wa_date_inspected"])) {
			$html .= '<tr>';
			$html .= '<td width="15%">Date Inspected</td>';
			$html .= '<td width="85%">' . trim($v2["wa_date_inspected"]) . '</td>';
			$html .= '</tr>';
		}

		if (!empty($v2["wa_cgfb_person"])) {
			$html .= '<tr>';
			$html .= '<td width="15%">CGFB Person</td>';
			$html .= '<td width="85%">' . $v2["wa_cgfb_person"] . '</td>';
			$html .= '</tr>';
		}

		if (!empty($v2["wa_supplier"])) {
			$html .= '<tr>';
			$html .= '<td width="15%">Supplier</td>';
			$html .= '<td width="85%">' . $v2["wa_supplier"] . '</td>';
			$html .= '</tr>';
		}

		$html .= '<tr>';
		$html .= '<td colspan="2">' . $img1 . '&nbsp;' . $img2 . '&nbsp;' . $img3 . '&nbsp;' . $img4 . '&nbsp;' . $img5 . '</td>';
		$html .= '</tr>';

		$html .= "</table></body></html><br>";
		$i++;
	} // Innter loop ends here

	//db($html);
	//exit;

	$fdata = '';
	$to = $data_2['bcust_misc_email1'];
	$toname = $data_2['bcust_fname'];
	$heading = "Warranty issues of you project";
	$attach1 = create_warranty_PDF($heading, $html, $toname);

	$fdata = [];
	if (!empty($attach1)) {

		$fdata[] = $attach1;
	}
	if (!empty($fdata)) {
		$attachmentsend = serialize($fdata);
	}

	$to2 = "manojsoniephp@gmail.com";
	$to3 = "saurabh@ephpsolutions.com";

	if ($day == 'Sun') {
		send_email($toname, $to,  'CGFB', 'warranty@cgfb.com.au', 'CGFB Warranty Weekly Update', $message, $attachmentsend);
		send_email($toname, $to2, 'CGFB', 'warranty@cgfb.com.au', 'CGFB Warranty Weekly Update', $message, $attachmentsend);
		send_email($toname, $to3, 'CGFB', 'warranty@cgfb.com.au', 'CGFB Warranty Weekly Update', $message, $attachmentsend);		

		$logDetail['wl_date_sent'] = date('d-m-y');
		$logDetail['wl_customer_name'] = $data_2['bcust_fname'] . ' ' . $data_2['bcust_lname'];

		$logDetail['wl_email_to'] = $data_2['bcust_misc_email1'];
		$logDetail['wl_issue_included'] = $i;
		$opr = $table->insertRow($logDetail);

		// If secondary email exists - send email to it
		if($data_2['bcust_misc_email2']){
			$to_secondary = $data_2['bcust_misc_email2'];

			// Added email to secondary email
			send_email($toname, $to_secondary, 'CGFB', 'warranty@cgfb.com.au', 'CGFB Warranty Weekly Update', $message, $attachmentsend);

			// Added log for secondary email
			$logDetail['wl_date_sent'] = date('d-m-y');
			$logDetail['wl_customer_name'] = $data_2['bcust_fname'] . ' ' . $data_2['bcust_lname'];

			$logDetail['wl_email_to'] = $to_secondary;
			$logDetail['wl_issue_included'] = $i;
			$opr = $table->insertRow($logDetail);
		}
		
	}
}

exit('Process is completed');
