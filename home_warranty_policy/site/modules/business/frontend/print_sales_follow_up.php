<?php
$fwMainView = 'file:' . getcwd() . '/print_sales_follow_up.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', 0); 

$sqlp = "select business.bsn_name from business where bsn_id = ".$bsn_id;
$namedata = $fwDb->queryOne($sqlp);
$bus_name = $namedata['bsn_name'];

$fwViewData['opt'] = $fwRequest->getParam('opt', '');
    $heading = "Sales Followup Notes";
	$fname = "CGFB";
	
	//$html = "<html><body><p>This is a testing pdf. Thank you</p></body></html>";
	
	$sql =  "select sales_followup.* ,  users.user_name  from sales_followup
			Inner join users ON sales_followup.sf_user_id  = users.user_id 	
			where sf_pid = ".$bsn_id . " order by sf_date DESC";
	if($sql){$Data = $fwDb->query($sql);}
	
	$html = '<table width="75%" border="0" cellpadding="5">'; 
	$html .='<tr><th width="70%"><b>Notes</b></th> <th><b>Date</b> </th> <th><b>Person</b> </th></tr>'; 
	foreach($Data as $m)
	{
	$html .='<tr><td>'.$m["sf_notes"].'</td>';
	$html .='<td>'. $m['sf_date'].'</td>';
	$html .='<td>'. $m['user_name'].'</td></tr>';
	}

	$html .= '</table>';
	 
	create_open_PDF2($heading,$html,$fname,$bus_name);
	
	
	function create_open_PDF2($heading, $html, $fname, $bus_name)
		{
		
		require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
		require_once(BASE_DIR.'tcpdf/tcpdf.php');
		$PDF_PAGE_ORIENTATION = "R";
		// Extend the TCPDF class to create custom Header and Footer
		class MYPDF extends TCPDF {

   
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'CGFB', 'T', 0, 'L');
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
		
//$nameoffile = str_replace(" ", "_",$fname);		
$nameoffile = 'salesfollowup';
$filename = $nameoffile."_".date('d_m_Y').".pdf";
$headtext = $heading." - ".date("d/m/Y");
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Canberra Granny Flat Builders');
//$pdf->SetTitle('Answer - ".date("d/m/Y")."<br>TurnKeyStudios Project Sales');
$pdf->SetTitle("CGFB");
$pdf->SetSubject('Seller answer');
$pdf->SetKeywords('GCON, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, "Project Address:" .$bus_name);

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
$pdf->SetFont('helvetica', '15', 10);

// add a page
$pdf->AddPage();

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
        border: 0px solid #fff;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #fff;
    }
	 th {
        border: 0px solid #fff;
        background-color: #fff;
    }
    td.second {
        border: 2px dashed green;
    }
   
</style>
$html		
EOF;
	
$pdf->writeHTML($vbody, true, false, true, false, '');		

//Close and output PDF document
$filepath = 'reports/'.$filename;
$filepath_save =BASE_DIR.$filepath;
$filepath_url =BASE_URL.$filepath;

ob_end_clean();
$pdf->Output($filepath_save, 'F');
Location($filepath_url);
return $filepath_url;

		}	
