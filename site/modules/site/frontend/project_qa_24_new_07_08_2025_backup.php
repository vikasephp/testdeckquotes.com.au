<?php

$sql = "SELECT  business_qa.*, bus_customers.bcust_fname, bus_customers.bcust_lname,  bus_customers.bcust_misc_email1, positions.p_name, 
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date from business_qa 		
		Inner Join bus_customers ON business_qa.bqa_cust_id = bus_customers.bcust_id 
		Inner Join business ON business_qa.bqa_bsn_id = business.bsn_id 
		Left Join positions ON business_qa.bqa_who = positions.p_id
		where length(trim(business_qa.bqa_ans_plain)) >= 1 order by business_qa.bqa_bsn_id ";

$paData = $fwDb->query($sql);

$bsnsql = "select distinct business_qa.bqa_bsn_id from business_qa";
$bsnData = $fwDb->query($bsnsql);

ini_set('max_execution_time', 600); //600 seconds = 10 minutes

$tableLog = new Fw_Db_Table("qa_email_log");

date_default_timezone_set('Australia/Melbourne');

foreach ($bsnData as $k1 => $v1)
{
	$sql = "SELECT  business_qa.*, bus_customers.bcust_fname, bus_customers.bcust_lname,  bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, positions.p_name, 
       		business.bsn_id, business.bsn_name,  business.bsn_address, business.bsn_sub_status, business.bsn_status_sys_date, users.user_name from business_qa 		
			Inner Join bus_customers ON business_qa.bqa_cust_id = bus_customers.bcust_id 
			Inner Join business ON business_qa.bqa_bsn_id = business.bsn_id 
			Left Join positions ON business_qa.bqa_who = positions.p_id
			Inner Join users ON  business_qa.bqa_ans_user_id =  users.user_id
			where business_qa.bqa_bsn_id  = " . $v1['bqa_bsn_id'] . " Order by business_qa.bqa_ans_date Desc";
			
	$paData = $fwDb->query($sql);
	
	$paddress = $paData[0]['bsn_address'] ;
	$subject = "Project Address - ". $paddress; 	

	
	$message = '<p style="font-family:Calibri; font-size:15px;">Please find the most recently  answered question regarding your project. </p>';
	$message .= '<table border ="1" cellpadding="3" cellspacing="0" style="border-collapse:collapse" width="100%" style="font-family:Calibri; font-size:15px;">';
	$message .= '<tr><td width="5%">SrNo</td><td width="35%">Your Question</td><td width="45%"> Our Answer</td><td width="19%"> Create Date </td></tr>';
				
	$messagepdf = '<html> <body>';
	$messagepdf .= '<h3> Project Question Answer Report</h3><br><br>';
	$messagepdf .= '<table border ="1" cellpadding="10" cellspacing="10" style="border-collapse:collapse" width="100%">';
	
				
	$srno=1;
	$srno2=1;
	$flag=0;
	$fname='None';
	foreach($paData as $k => $v)
	{
				//db($v);
				$bsn_id =  $v['bsn_id'];
		
				$date1 = date("Y-m-d");
				$date2 = $v['bqa_ans_date'];
				$newdate = strtotime ( '-1 day' , strtotime ( $date1 ) ) ;
		
				$question = trim(strip_tags($v['bqa_que']));
				
				$answer = trim(strip_tags($v['bqa_ans']));
				$ansformat = $v['bqa_ans'];
			
				if($newdate == strtotime($v['bqa_ans_date'])) 
				{
					
						$Statusdate = changedate_y_m_d($v['bqa_created_date']);
						$curdate_y_m_d = date('Y-m-d');
						$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
							
						$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
													
						$message .= "<tr>";
						$message .= "<td>".$srno."</td>";
						$message .= "<td>".$v['bqa_que']."</td>";
						$message .= "<td>".$ansformat."</td>";
						$message .= "<td>".changedate_d_m_y($v['bqa_created_date'])."</td>";
						$message .= "</tr>";
						$srno++;
						$flag=1;
						$fname= $v['bcust_fname'];
				}
				
						$Statusdate = changedate_y_m_d($v['bqa_created_date']);
						$curdate_y_m_d = date('Y-m-d');
						$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
							
						$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
						$messagepdf .= "<tr>";
						
						$messagepdf .= "<td>";
						$messagepdf .= "<b>Question</b> <br>";
						$messagepdf .= changedate_d_m_y($v['bqa_created_date'])."<br>";
						$messagepdf .= strip_tags($question). "<br><br>";
						$messagepdf .= "<b>Answer - " .$v['user_name']. "</b><br>";
						$messagepdf .= strip_tags($answer). "<br>";
						$messagepdf .= "</td>";
						$messagepdf .= "</tr>";
						$srno2++;
						
						$fname= $v['bcust_fname'];
						$to = $v['bcust_misc_email1'];
						$to2 = $v['bcust_misc_email2'] ;
					    
						
   }



	$message .= "</table>";
	$message .= "<p style='font-family:Calibri; font-size:15px;'>Also attached is a PDF of all the previously answered questions.</p>";
	$message .= "<p style='font-family:Calibri; font-size:15px;'>If we can be of any assistance or if you have further questions please let us know.</p>";
	$message .= "<p style='font-family:Calibri; font-size:15px;'>Warm Regards, </p>";
	$message .= "<p style='font-family:Calibri; font-size:15px;'>Frank Walmsley <br>";
	$message .= "Canberra Granny Flat Builders<br>";
	$message .= "Phone: 1300 979 658 | Fax: 1300 979 657<br>";
	$message .= "Postal: GPO Box 2265 Canberra City 2602<br>";
	$message .= "ACT Building Lic: 2012767</p>";
    $message .= "<img src = http://www.deckquotes.com.au/images/sign.png>";

	$messagepdf .= "</table></body></html>";
	$heading = "Project Question Answer Report";
	
	if($flag==1) {
		$html =  '<html> <body>';
		$html .= "<p style='font-family:Calibri; font-size:15px;'>".$fname. "<p>";
		$html .= $message;
		$html .=  '</body></html> ';
		
		$filepath = create_qa_PDF($heading,$messagepdf,$paddress);
		$attsen[] = $filepath;
		$attachment = serialize($attsen);
		
		$detail['qal_bsn_id'] = $bsn_id;
		$detail['qal_to'] = $to;
		$detail['qal_date'] = date("Y-m-d");
		$detail['qal_content'] = $html; 
		$detail['qal_attachment'] = $filepath;
		
		send_email($fname, $to, 'CGFB', 'info@cgfb.com.au', $subject, $html, $attachment);	
		if(!empty($to2)) {
			send_email($fname, $to2, 'CGFB', 'info@cgfb.com.au', $subject, $html, $attachment);	
		}
		send_email($fname, 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', $subject, $html, $attachment);	
		//send_email($fname, 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', $subject, $html, $attachment);	
			
		$id = $tableLog->insertRow($detail); 
		if(!empty($to2)) {
			$detail['qal_to'] = $to2;
			$id = $tableLog->insertRow($detail); 
		}
		
		
		$sqlother = "Select business_sellers.*, bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2 from business_sellers
			Inner join bus_customers on  business_sellers.bs_customers_id = bus_customers.bcust_id
			where business_sellers.bs_business_id = ".$bsn_id ." and bus_customers.bcust_misc_email1 <> '" . $to. "'" ;
		
		$otherData = $fwDb->query($sqlother);
		foreach ($otherData as $ok => $ov)
		{
			$to = $ov['bcust_misc_email1'];
			$to2= $ov['bcust_misc_email2'];
			$detail['qal_to'] = $to;
			send_email($fname, $to, 'CGFB', 'info@cgfb.com.au', $subject, $html, $attachment);	
			if(!empty($to2)) {
		 		send_email($fname, $to2, 'CGFB', 'info@cgfb.com.au', $subject, $html, $attachment);	
			}
			
			send_email($fname, 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', $subject, $html, $attachment);	
			//send_email($fname, 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', $subject, $html, $attachment);
			
			$id = $tableLog->insertRow($detail); 
			if(!empty($to2)) {
					$detail['qal_to'] = $to2;
					$id = $tableLog->insertRow($detail);
				}
		  }
		
		unset($attsen);
	}
	
}


function create_qa_PDF($heading, $message, $paddress)
{
		
		require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
		require_once(BASE_DIR.'tcpdf/tcpdf.php');
		$PDF_PAGE_ORIENTATION = "R";
		// Extend the TCPDF class to create custom Header and Footer
		
		if (!class_exists('MYPDF')) {
		class MYPDF extends TCPDF 
		{
		
			// Page footer
			public function Footer() {
				// Position at 15 mm from bottom
				$this->SetY(-15);
				// Set font
				$this->SetFont('helvetica', 'I', 8);
				// Page number
				$this->Cell(0, 10, 'GCON', 'T', 0, 'L');
				if ($this->getRTL()) {
					$this->SetX($this->original_rMargin);
					$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'L');
				} else {
					$this->SetX($this->original_lMargin);
					$this->Cell(0, 0, $pagenumtxt, 'T', 0, 'R');
				}
				
				$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
				
			}
        }
}
$nameoffile = str_replace(" ", "_",$fname);		
$filename = 'QA - '.$paddress." - ".date('d_m_Y').".pdf";
$headtext = $heading." - ".date("d/m/Y");
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Canberra Granny Flat Builders');
//$pdf->SetTitle('Answer - ".date("d/m/Y")."<br>TurnKeyStudios Project Sales');
$pdf->SetTitle("Project Question Answer Report For Customers");
$pdf->SetSubject('Qa Report');
$pdf->SetKeywords('CGFB, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, "Canberra Granny Flat Builders");

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

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
$pdf->AddPage('L');

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

// set JPEG quality
$pdf->setJPEGQuality(105);	
// output the HTML content
//$pdf->writeHTML($html, true, false, true, false, '');

$vbody = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>

       table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 8pt;
        border: 1px solid #ccc;
        background-color: #FFF;
    }
    td {
        border: 1px solid #ccc;
        background-color: #fff;
    }
	 th {
        border: 1px solid #ccc;
        background-color: #fff;
    }
    td.second {
        border: 2px dashed green;
    }
   
</style>
$message		
EOF;
	
$vbody = utf8_encode($vbody);	
	
$pdf->writeHTML($vbody, true, false, true, false, '');		

//Close and output PDF document
$filepath = 'reports/'.$filename;
$filepath_save =BASE_DIR.$filepath;
$filepath_url =BASE_URL.$filepath;

$pdf->Output($filepath_save, 'F');

return $filepath_url;

	}	
		

//		$sqle = "Select ar_receving_email from automated_reports where ar_id = 7";
//		$emaildata = $fwDb->queryOne($sqle);
	
//		$emails = explode(",", $emaildata['ar_receving_email']);
	
//		if(!empty($emails)) {
//			foreach($emails as $ve)
//			{
//				send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Project Question Answer Report', $message, $attachment='');	
//			}
//		}

exit;