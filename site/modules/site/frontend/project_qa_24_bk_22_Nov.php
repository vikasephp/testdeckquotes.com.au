<?php

$sql = "SELECT  business_qa.*, bus_customers.bcust_fname, bus_customers.bcust_lname,  bus_customers.bcust_misc_email1, positions.p_name, 
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date from business_qa 		
		Inner Join bus_customers ON business_qa.bqa_cust_id = bus_customers.bcust_id 
		Inner Join business ON business_qa.bqa_bsn_id = business.bsn_id 
		Left Join positions ON business_qa.bqa_who = positions.p_id
		where length(business_qa.bqa_ans) <= 74 order by business_qa.bqa_bsn_id ";

$paData = $fwDb->query($sql);

$message = "<html> <body>";
$message .= "<h3> Project Question Answer Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Project Address</td><td>Link</td><td>Customer</td><td>Question</td><td> Create Date </td>
			<td>Business Stream</td><td>Who to Answer</td><td>Status</td></tr>";

$bsnsql = "select distinct business_qa.bqa_bsn_id from business_qa";
$bsnData = $fwDb->query($bsnsql);

ini_set('max_execution_time', 600); //600 seconds = 10 minutes

foreach ($bsnData as $k1 => $v1)
{
	$sql = "SELECT  business_qa.*, bus_customers.bcust_fname, bus_customers.bcust_lname,  bus_customers.bcust_misc_email1, positions.p_name, 
       		business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date from business_qa 		
			Inner Join bus_customers ON business_qa.bqa_cust_id = bus_customers.bcust_id 
			Inner Join business ON business_qa.bqa_bsn_id = business.bsn_id 
			Left Join positions ON business_qa.bqa_who = positions.p_id
			where business_qa.bqa_bsn_id  = " . $v1['bqa_bsn_id'];
		
	$paData = $fwDb->query($sql);
	
	$message = '<html> <body>';
	$message .= '<p> Please find the most recently  answered question regarding your project. </p><br><br>';
	$message .= '<table border ="1" cellpadding="3" cellspacing="0" style="border-collapse:collapse" width="100%">';
	$message .= '<tr><td width="5%">SrNo</td><td width="35%">Your Question</td><td width="45%"> Our Answer</td><td width="19%"> Create Date </td></tr>';
				
	$messagepdf = '<html> <body>';
	$messagepdf .= '<h3> Project Question Answer Report</h3><br><br>';
	$messagepdf .= '<table border ="1" cellpadding="3" cellspacing="0" style="border-collapse:collapse" width="100%">';
	$messagepdf .= '<tr><td width="4%">SrNo</td><td width="15%">Project Address</td><td>Customer</td><td width="15%">Question</td><td>Answer</td><td> Create Date </td>
				    <td>Business Stream</td><td>Who to Answer</td></tr>';
				
	$srno=1;
	$srno2=1;
	$flag=0;
	$fname='None';
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
				$date1 = date("Y-m-d H:i:s");
				$date2 = $v['bqa_ans_date'];
				$seconds = strtotime($date1) - strtotime($date2);
				$hours = $seconds / 60 /  60;
		
				$answer = trim(strip_tags($v['bqa_ans']));
				
				if($hours <=24 && !empty($answer)) 
				{
					
						$Statusdate = changedate_y_m_d($v['bqa_created_date']);
						$curdate_y_m_d = date('Y-m-d');
						$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
							
						$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
													
						$message .= "<tr>";
						$message .= "<td>".$srno."</td>";
						$message .= "<td>".$v['bqa_que']."</td>";
						$message .= "<td>".strip_tags($answer)."</td>";
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
					
						//unset($answer); 
						//$answer = str_replace('<body>',  '', $answer);
						//$answer = str_replace('</body>',  '', $answer);
						//$answer = str_replace("•","'",$answer);
						//$answer = str_replace("’","'",$answer);
						//$answer = str_replace("”","'",$answer);
													
						$messagepdf .= "<tr>";
						$messagepdf .= "<td>".$srno2."</td>";
						$messagepdf .= "<td>".$v['bsn_name']. "</td>";
						$messagepdf .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
						$messagepdf .= "<td>".$v['bqa_que']."</td>";
						$messagepdf .= "<td>".strip_tags($answer)."</td>";
						$messagepdf .= "<td>".changedate_d_m_y($v['bqa_created_date'])."</td>";
						//$messagepdf .= "<td>".$days_at_status."</td>";
						$messagepdf .= "<td>".$v['bqa_business_stream']."</td>";
						$messagepdf .= "<td>".$v['p_name']."</td>";
						$messagepdf .= "</tr>";
						$srno2++;
						
						$fname= $v['bcust_fname'];
						$to = $v['bcust_misc_email1'];
				
   }

	$message .= "</table></body></html>";
	$messagepdf .= "</table></body></html>";
	$heading = "Project Question Answer Report";
	
	if($flag==1) {
		$html = "Dear ".$fname. "<br><br>";
		$html .= $message;
			
		$filepath = create_qa_PDF($heading,$messagepdf,$fname);
		$attsen[] = $filepath;
		$attachment = serialize($attsen);
		send_email($fname, $to, 'CGFB', 'info@cgfb.com.au', 'Project Question Answer Report of Last 24 hours', $html, $attachment);	
		//send_email($fname, 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Project Question Answer Report of Last 24 hours', $html, $attachment);	
		unset($attsen);
	}
	
}


function create_qa_PDF($heading, $message, $fname)
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
$filename = $nameoffile."_".date('d_m_Y').".pdf";
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