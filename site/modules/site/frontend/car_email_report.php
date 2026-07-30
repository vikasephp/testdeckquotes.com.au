<?php

$sql_1 = "Select distinct car_bsn_id from construction_alert_report where car_include_cust ='Yes' ";

$current_date1 = date('Y-m-d');
$day = date("D", strtotime($current_date1));

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

$Data_1 = $fwDb->query($sql_1);

foreach ($Data_1 as $k1 => $v1) {
	$sql_2 = 'SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name from business_sellers
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id
	WHERE business.bsn_id = ' . $v1['car_bsn_id'] . ' group by bsn_id';

	$data_2 = $fwDb->query($sql_2);

	foreach ($data_2 as $k2 => $v2) {
		$message = "<html> <body>";
		$message .= "<p>Dear " . $v2['bcust_fname'] . " </p><br>";
		$message .= "<p>Here is the construction alert report for your project</p><br>";
		$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
		$message .= "<tr><td>Project</td><td>Date</td><td>Alert</td><td>Photo Link</td></tr>";

		$to = $v2['bcust_misc_email1'];
		$toname = $v2['bcust_fname'];

		$sqlfinal = 'Select car_bsn_id, car_date, car_alert, car_image1, car_image2, car_image3, car_image4, car_image5
	               from construction_alert_report where car_bsn_id = ' . $v1['car_bsn_id'] . '';

		$datafinal = $fwDb->query($sqlfinal);

		foreach ($datafinal as $k3 => $v3) {
			if ($v3['car_image1']) {
				$link1 = ($v3['car_image1_newdesign'] ? '<a href="' . showUrl($v3['car_image1']) . '">Link1</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v3['car_image1'] . '">Link1</a><br>');
			} else {
				$link1 = '';
			}
			if ($v3['car_image2']) {
				$link1 = ($v3['car_image2_newdesign'] ? '<a href="' . showUrl($v3['car_image2']) . '">Link2</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v3['car_image2'] . '">Link2</a><br>');
			} else {
				$link2 = '';
			}
			if ($v3['car_image3']) {
				$link1 = ($v3['car_image3_newdesign'] ? '<a href="' . showUrl($v3['car_image3']) . '">Link3</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v3['car_image3'] . '">Link3</a><br>');
			} else {
				$link3 = '';
			}
			if ($v3['car_image4']) {
				$link1 = ($v3['car_image4_newdesign'] ? '<a href="' . showUrl($v3['car_image4']) . '">Link4</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v3['car_image4'] . '">Link4</a><br>');
			} else {
				$link4 = '';
			}
			if ($v3['car_image5']) {
				$link1 = ($v3['car_image5_newdesign'] ? '<a href="' . showUrl($v3['car_image5']) . '">Link5</a><br>' : '<a href="' . BASE_URL . "files/uploads/" . $v3['car_image5'] . '">Link5</a><br>');
			} else {
				$link5 = '';
			}

			$message .= "<tr><td>" . $v2['bsn_name'] . "</td>";
			$message .= "<td>" . $v3['car_date'] . "</td>";
			$message .= "<td>" . $v3['car_alert'] . "</td>";

			$message .= "<td>" . $link1 . " " . $link2 . " " . $link3 . " " . $link4 . " " . $link5 . "</td></tr>";
			unset($link1);
			unset($link2);
			unset($link3);
			unset($link4);
			unset($link5);
		}
		$message .= "</table></body></html>";
		// db($message);
		if ($day == 'Fri') {
			send_email($toname, $to, 'CGFB', 'alerts@cgfb.com.au', 'Construction Alert Report', $message, $attachment = '');
		}
	}
}
exit;
