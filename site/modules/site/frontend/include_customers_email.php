<?php
$table = new Fw_Db_Table("car_email_log_customer");
$sql_1 = "Select * from include_customers";
$Data_1 = $fwDb->query($sql_1);

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

function mypdf()
{
	require_once(BASE_DIR . 'tcpdf/config/lang/eng.php');
	require_once(BASE_DIR . 'tcpdf/tcpdf.php');
	//$PDF_PAGE_ORIENTATION = "R";
	$PDF_PAGE_ORIENTATION = "L";

	class MYPDF2 extends TCPDF
	{

		// Page footer
		public function Footer()
		{
			$this->SetY(-15);

			$this->SetFont('helvetica', 'I', 8);

			$this->Cell(0, 10, 'CGFB', 'T', 0, 'L');
			if ($this->getRTL()) {
				$this->SetX($this->original_rMargin);
				$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
			} else {
				$this->SetX($this->original_lMargin);
				$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
			}

			$this->Cell(0, 10, 'Page ' . $this->getAliasNumPage() . '/' . $this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		}
	}
}

mypdf();

foreach ($Data_1 as $k1 => $v1) {
	$sql_2 = "select  * from construction_alert_report where car_project like '%" . $v1['ic_project'] . "%' and car_status = 'Open' and car_include_cust = 'Yes'";
	$Data_2 = $fwDb->query($sql_2);

	$html = "";
	$message = "";
	$incsup = '';
	$i = 0;
	if (sizeof($Data_2) > 0) {

		foreach ($Data_2 as $k2 => $v2) {
			$html .= '<table width="100%" cellpadding="5" border="1">';
			$html .= '<tr><td colspan="2" style="text-align:center; background-color:yellow;">Record Number : ' . $v2['car_id'] . '</td></tr>';
			$html .= '<tr><td>Project</td><td>' . $v1['ic_project'] . '</td></tr>';
			$html .= '<tr><td>Status</td><td>' . $v2['car_status'] . '</td></tr>';

			$sqlpr = "select * from car_priority where pr_id = " . $v2['car_urgency'];
			$urgData = $fwDb->queryOne($sqlpr);

			if ($v2['car_date']) {
				$html .= '<tr><td>Date</td><td>' . $v2['car_date'] . '</td></tr>';
			}

			if ($v2['car_new_date']) {
				$html .= '<tr><td>Due Date</td><td>' . $v2['car_new_date'] . '</td></tr>';
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


			$html .= '</table><br>';
			$i++;
		}



		$message .= "Dear " . $v1['ic_name'] . ",<br><br>";
		$message .= "Thank you for choosing our business. Please find the attached file to review the reports of your project issues.<br>";
		$message .= "<br>Yours sincerely,<br>CGFB and FPE Operations Team";

		$to = $v1['ic_email'];
		$toname = $v1['ic_name'];
		$from = "construction@cgfb.com.au";
		$from_name = "Operations team";
		$subject = "Weekly Construction Alert Update of Your Project";


		$attach1 = create_include_customer_pdf("Include Customers Report", $html);

		if (!empty($attach1)) {
			$fdata[] = $attach1;
		}
		if (!empty($fdata)) {
			$attachmentsend = serialize($fdata);
		}


		if ($day == 'Sun') {

			send_email($toname, $to, 'CGFB', 'construction@cgfb.com.au', $subject, $message, $attachmentsend);
			// send_email($toname, 'manojsoniephp@gmail.com', 'CGFB', 'operations@cgfb.com.au', $subject, $message, $attachmentsend);

			$logDetail['car_date_sent'] = date('d-m-y');
			$logDetail['car_customer_name'] = $v1['ic_name'];

			$logDetail['car_email_to'] = $v1['ic_email'];
			$logDetail['car_issue_included'] = $i;
			$opr = $table->insertRow($logDetail);
		}
	}
}



function create_include_customer_pdf($heading, $html)
{

	//$nameoffile = str_replace(" ", "_",$fname);		
	$nameoffile = 'customer_report';
	$filename = $nameoffile . "_" . date('d_m_Y') . ".pdf";
	$headtext = $heading . " - " . date("d/m/Y");
	$pdf = new MYPDF2($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, false, 'UTF-8', false);
	$pdf->SetCreator(PDF_CREATOR);
	$pdf->SetAuthor('Canberra Granny Flat Builders');
	//$pdf->SetTitle('Answer - ".date("d/m/Y")."<br>TurnKeyStudios Project Sales');
	$pdf->SetTitle("CGFB");
	$pdf->SetSubject('Construction Alert Report');
	$pdf->SetKeywords('GCON, PDF');

	// set default header data
	$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, "Canberra Granny Flat Builders");

	// set header and footer fonts
	$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
	$pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

	// set default monospaced font
	$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

	//set margins
	$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
	$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
	$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

	//set auto page breaks
	$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

	//set image scale factor
	$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

	//set some language-dependent strings
	$pdf->setLanguageArray($l);

	// ---------------------------------------------------------

	// set font
	$pdf->SetFont('helvetica', '23', 10);

	// add a page
	$pdf->AddPage();

	//set some language-dependent strings
	$pdf->setLanguageArray($l);

	// -------------------------------------------------------------------

	// add a page
	//$pdf->AddPage();

	// set JPEG quality
	$pdf->setJPEGQuality(105);
	//$pdf->writeHTML($html, true, false, true, false, '');

	$vbody = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>

       table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 8pt;
        border: 1px solid #CCC;
        background-color: #FFF;
    }
    td {
        border: 1px solid #CCC;
        background-color: #fff;
    }
	 th {
        border: 1px solid #CCC;
        background-color: #FF0;
    }
    td.second {
        border: 2px dashed green;
    }
   
</style>
$html		
EOF;

	$pdf->writeHTML($vbody, true, false, true, false, '');

	//Close and output PDF document
	$filepath = 'reports/' . $filename;
	$filepath_save = BASE_DIR . $filepath;
	$filepath_url = BASE_URL . $filepath;

	//ob_end_clean();
	$pdf->Output($filepath_save, 'F');
	return $filepath_url;
}

exit;	
/////////////////////////////////////////////////////////////////////////////////
