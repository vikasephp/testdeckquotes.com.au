<?php
	
		if($_SESSION['last_sql'])
			{$sql = $_SESSION['last_sql'];
			 $reportData = $fwDb->query($sql);
		if($reportData)
			{
	$sitename = "Capital Commercial Business Sales";		
		require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
		require_once(BASE_DIR.'tcpdf/tcpdf.php');
		$PDF_PAGE_ORIENTATION = "L";
		// Extend the TCPDF class to create custom Header and Footer
		class MYPDF extends TCPDF {

   
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		$this->Cell(0, 10, 'BES', 'T', 0, 'L');
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
		
$nameoffile = str_replace(" ", "_",$fname);		
$filename = "property_".date('His').".pdf";
$headtext = " Market Analysis - ".$sitename;
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Capital Commercial Business Sales');
$pdf->SetTitle('Market Analysis <br>'.$sitename);
$pdf->SetSubject('Seller answer');
$pdf->SetKeywords('BES, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, date('d/m/Y'));

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


foreach($reportData as $v)
		{
		
		$table= new Fw_Db_Table('cma_images');
		$table->setWhere("cma_id = ".$v['c_id']." AND cma_name != ''");
		$imagedata = $table->getRow();
		$path = $imagedata['cma_name'];
		$imgdata ='<img src="'.BASE_URL.FILE_PATH.'files/cma/'.$path.'" width="400" height="300">';

	$type = $v['st_name'];
	$scode = $v['scode'];
	$cname = $v['cname'];	
	$name = $v['c_business_name'];	
	$industry = $v['ind_name'];	
	$price = $v['c_price'];	
	$inprice = $v['c_initial_price'];	
	$desc = $v['c_long_description'];
	if($v['c_date_listed'] !== '0000-00-00' )
		{	
	$datelisted = changedate_d_m_Y($v['c_date_listed']);	
	 $now = time(); // or your date as well
     $your_date = strtotime($datelisted);
     $datediff = $now - $your_date;
   $days =  floor($datediff/(60*60*24));
		}	
		$vbody[] =<<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    h1 {
        color: navy;
        font-family: times;
        font-size: 24pt;
        text-decoration: underline;
    }
    p.first {
        color: #003300;
        font-family: helvetica;
        font-size: 12pt;
    }
    p.first span {
        color: #006600;
        font-style: italic;
    }
    p#second {
        color: rgb(00,63,127);
        font-family: times;
        font-size: 12pt;
        text-align: justify;
    }
    p#second > span {
        background-color: #FFF;
    }
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 11pt;
        border: 0px solid #FFF;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #fff;		
    }
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 0px solid #fff;
        background-color: #fff;
    }
    td.first {
        width:450px;
		text-align: center;
    }
	 td.second {
        width:250px;
		font-size: 13pt;
    }
	
	 td.three {
        width:500px;
    }
	 td.fore {
        width:150px;
    }
    div.test {
        color: #5c83b4;
        background-color: #fff;
        font-family: helvetica;
        font-size: 14pt;
        border: 0px solid #fff;
        text-align: center;	
    }
</style>
<div class="test">$type</div><br>
<table class="first">
	<tr><td class="second">$scode $cname</td><td class="second">$industry</td><td class="first">$price</td></tr>
</table><br>
<table class="first">
	<tr><td class="three">$name</td></tr>
</table>
<br>
<table class="first">
	<tr><td class="first">$imgdata</td><td class="three">$desc</td></tr>
</table><br>
<table class="first">
	<tr><td class="fore">Current Price:</td>
		<td class="fore">$price</td>
		<td class="fore"> Date Listed:</td>
		<td class="fore">$datelisted</td>
	</tr>
</table>
<br />
<table class="first">
	<tr><td class="fore">Initial Price:</td>
		<td class="fore">$inprice</td>
	</tr>
</table>
<br /><table class="first">
	<tr><td class="fore">Days On Market:</td>
		<td class="fore">$days</td>
	</tr>
</table>
<br /><table class="first">
	<tr><td class="fore">Disclaimer:</td>
	</tr>
</table>
<br />
EOF;
		
		}

if($vbody)
 {	
	foreach($vbody as $val)
		{
		$pdf->writeHTML($val, true, false, true, false, '');
	// add a page
	if(!end($vbody)){$pdf->AddPage();}	
		}
	}
//Close and output PDF document
$filepath = 'reports/'.$filename;
$filepath_save =BASE_DIR.$filepath;
$filepath_url =BASE_URL.$filepath;
//$pdf->Output($filepath_save, 'F');
$pdf->Output($filepath_save, 'I');

		}
	}
exit;
