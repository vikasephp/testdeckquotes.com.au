<?php

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

$table = new Fw_Db_Table("car_email_log_supplier");

$sql_1 = "Select * from supplier_email  where se_auto_email = 1 group by se_email";
$Data_1 = $fwDb->query($sql_1);

$current_date1 = date('Y-m-d');
$day = date("D", strtotime($current_date1));

foreach ($Data_1 as $k1 => $v1) {
	$sql_2 = "select  * from construction_alert_report where car_incl_supp_email like '%" . $v1['se_email'] . "%' and car_status = 'Open'";
	$Data_2 = $fwDb->query($sql_2);

	$supplier = $v1['se_supplier'];
	$to = $v1['se_email'];
	$to_name = $supplier;
	$from = "operations@cgfb.com.au";
	$from_name = "Operations team";
	$subject = "Construction Report Of Your Project ";

	$html = '';
	$html .= $supplier . ",<br><br>";
	$html .= "Below are the construction alerts that you have been included in. Please review the alerts and use the 
	update link to help resolve or progress the alert. <br>Thank you for your help.";
	$incsup = '';

	$i = 0;

	if (sizeof($Data_2) > 0) {
		foreach ($Data_2 as $k2 => $v2) {

			$sql = 'SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname,
			bus_customers.bcust_lname, business.bsn_id, business.bsn_name from business_sellers
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id
			WHERE business.bsn_id = ' . $v2['car_bsn_id'] . '  group by bsn_id';

			$data = $fwDb->queryOne($sql);
			$toname = $data['bcust_fname'] . " " . $data['bcust_lname'];

			$sqlpr = "select * from car_priority where pr_id = " . $v2['car_urgency'];
			$urgData = $fwDb->queryOne($sqlpr);

			$html .= '<table width="100%" cellpadding="5" border="1">';
			$html .= '<tr><td colspan="2" style="text-align:center; background-color:yellow;"> Record Number : ' . $v2['car_id'] . '</td></tr>';
			$html .= '<tr><td>Project</td><td>' . $data['bsn_name'] . '</td></tr>';
			$html .= '<tr><td>Status</td><td>' . $v2['car_status'] . '</td></tr>';


			if ($v2['car_date']) {
				$html .= '<tr><td>Date</td><td>' . $v2['car_date'] . '</td></tr>';
			}

			if ($v2['car_new_date']) {
				$html .= '<tr><td>Due Date</td><td>' . $v2['car_new_date'] . '</td></tr>';
			}


			$x = explode("<br>", $v2['car_include_supplier']);

			$incsup = [];
			foreach ($x as $k3 => $v3) {
				preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
				$incsup[] = $str[0];
			}


			$html .= '<tr><td>Supplier</td><td>' . implode("<br>", $incsup) . '</td></tr>';

			if ($v2['pr_type']) {
				$html .= '<tr><td>Type</td><td>' . $v2['car_type'] . '</td></tr>';
			}

			if ($urgData['pr_priority']) {
				$html .= '<tr><td>Urgency</td><td>' . $urgData['pr_priority'] . '</td></tr>';
			}


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


			$html .= '<tr><td colspan="2">If you would like to add comment for this alert, please <a href="' . BASE_URL . "site.car_comment_update_form/car_id/" . $v2['car_id'] . '">Click Here</a></td></tr>';

			$html .= '</table><br>';
			$i++;
		}

		$html .= "Regards,<br>CGFB Operation Team";

		// db($html);

		send_email($to_name, $to, 'CGFB', 'construction@cgfb.com.au', $subject, $html, $attachment = '');
		// send_email($to_name, 'manojs@ephpsolutions.com', 'CGFB', 'construction@cgfb.com.au', $subject, $html, $attachment = '');


		$logDetail['car_date_sent'] = date('d-m-y');
		$logDetail['car_company'] = $v1['se_supplier'];
		$logDetail['car_contact_name'] = $data['bcust_fname'] . " " . $data['bcust_lname'];
		$logDetail['car_email_to'] = $v1['se_email'];
		$logDetail['car_issue_included'] = $i;
		$opr = $table->insertRow($logDetail);
	}
}

exit;
