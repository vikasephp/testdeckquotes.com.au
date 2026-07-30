<?php
$table = new Fw_Db_Table("car_email_log_staff");
$sql_1 = "Select * from  include_resp_staff  where ir_auto_email = 1 group by ir_email";
$Data_1 = $fwDb->query($sql_1);

function showUrl($object_name)
{
	$BASEFOLDER = 'construction_alert_report';
	$filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
	include_once $filetoinclude;
	$s3 = new S3(ACCESS_KEY, SECRET_KEY);
	$folder_path = "files/" . $BASEFOLDER . "/";
	$bucket_name  = "deckquote";
	$file_data = $s3->getObject($bucket_name, $folder_path . $object_name, $saveTo = false);
	// echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
	$file_raw_data = $file_data->body;

	$file = $object_name;
	$txt = fopen($_SERVER['DOCUMENT_ROOT'] . '/download_files/' . $file, "w") or die("Unable to open file!");
	fwrite($txt, $file_raw_data);
	fclose($txt);

	return BASE_URL . 'download_files/' . $file;
}

foreach ($Data_1 as $k1 => $v1) {

	$sql_2 = "select  * from construction_alert_report where car_resp_staff like '%" . $v1['ir_email'] . "%' and car_status = 'Open'";

	$Data_2 = $fwDb->query($sql_2);

	$html = "";
	$message = "";
	$html .= "Dear " . $v1['ir_first_name'] . ",<br><br>";
	$html .= "Here are the construction alerts that you are responsible for: <br>";
	$incsup = '';
	$i = 0;
	if (sizeof($Data_2) > 0) {
		foreach ($Data_2 as $k2 => $v2) {
			$sql_info = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname,
		              bus_customers.bcust_lname, bus_customers.bcust_misc_moble, business.bsn_name from business_sellers
			          Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
			          Inner Join business ON business_sellers.bs_business_id = business.bsn_id
			          where business.bsn_id = " . $v2['car_bsn_id'] . "";

			$data_3 = $fwDb->queryOne($sql_info);

			$sqlpr = "select * from car_priority where pr_id = " . $v2['car_urgency'];
			$urgData = $fwDb->queryOne($sqlpr);

			$html .= '<table width="100%" cellpadding="5" border="1">';
			$html .= '<tr><td colspan="2" style="text-align:center; background-color:yellow;">
		  <a href="' . BASE_URL . 'construction_alert_report.home/ecar_id/' . $v2['car_id'] . '" target="_blank">Record Number : ' . $v2['car_id'] . '</a></td></tr>';
			$html .= '<tr><td>Project</td><td>' . $data_3['bsn_name'] . '</td></tr>';

			$html .= '<tr><td>Status</td><td>' . $v2['car_status'] . '</td></tr>';

			if ($v2['car_date']) {
				$html .= '<tr><td>Date</td><td>' . $v2['car_date'] . '</td></tr>';
			}

			$x = explode("<br>", $v2['car_include_supplier']);

			$incsup = '';
			foreach ($x as $k3 => $v3) {
				preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
				$incsup = [];
				$incsup[] = $str[0];
			}

			if (strlen($incsup[0]) > 0) {
				$html .= '<tr><td>Supplier</td><td>' . implode("<br>", $incsup) . '</td></tr>';
			}

			if ($v2['car_type']) {
				$html .= '<tr><td>Type</td><td>' . $v2['car_type'] . '</td></tr>';
			}

			if ($urgData['pr_priority']) {
				$html .= '<tr><td>Urgency</td><td>' . $urgData['pr_priority'] . '</td></tr>';
			}


			$html .= '<tr><td>Responsible Staff</td><td>' . $v2['car_resp_staff'] . '</td></tr>';
			$html .= '<tr><td>Alert Message</td><td>' . $v2['car_alert'] . '</td></tr>';

			$link = '';
			if ($v2['car_image1']) {
				$link .= ($v2['car_image1_newdesign'] ? '<a href="' . showUrl($v2['car_image1']) . '">Link to Attachment1</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v2['car_image1'] . '">Link to Attachment1</a><br>');
			}
			if ($v2['car_image2']) {
				$link .= ($v2['car_image2_newdesign'] ? '<a href="' . showUrl($v2['car_image2']) . '">Link to Attachment2</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v2['car_image2'] . '">Link to Attachment2</a><br>');
			}
			if ($v2['car_image3']) {
				$link .= ($v2['car_image3_newdesign'] ? '<a href="' . showUrl($v2['car_image3']) . '">Link to Attachment3</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v2['car_image3'] . '">Link to Attachment3</a><br>');
			}
			if ($v2['car_image4']) {
				$link .= ($v2['car_image4_newdesign'] ? '<a href="' . showUrl($v2['car_image4']) . '">Link to Attachment4</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v2['car_image4'] . '">Link to Attachment4</a><br>');
			}
			if ($v2['car_image5']) {
				$link .= ($v2['car_image5_newdesign'] ? '<a href="' . showUrl($v2['car_image5']) . '">Link to Attachment5</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v2['car_image5'] . '">Link to Attachment5</a><br>');
			}
			if ($link) {
				$html .= '<tr><td>Attachments</td><td>' . $link . '</td></tr>';
			}

			$i++;


			$html .= '</table><br>';
		}

		$html .= "<br>Regards,<br>CGFB Operation Team";

		$to = $v1['ir_email'];
		$toname = $v1['ir_first_name'];
		$from = "construction@cgfb.com.au";
		$from_name = "Operations team";
		$subject = "CGFB Construction Alert Report";

		// db($html);

		send_email($toname, $to, 'CGFB', 'construction@cgfb.com.au', $subject, $html, $attachmentsend = '');
		// //send_email($toname, 'manojsoniephp@gmail.com', 'CGFB', 'operations@cgfb.com.au', $subject, $html, $attachmentsend='');

		$logDetail['car_date_sent'] = date('d-m-y');
		$logDetail['car_rs_fullname'] = $v1['ir_first_name'] . ' ' . $v1['ir_surname'];
		$logDetail['car_email_to'] = $v1['ir_email'];
		$logDetail['car_issue_included'] = $i;
		$opr = $table->insertRow($logDetail);
	}
}
exit;
