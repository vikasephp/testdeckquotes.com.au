<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/
require_once(MODULES_DIR . 'frontend.init.php');
$fwAuthGroup->forceLogin();

// module names
$MODULE_SINGULAR = 'Site Progress Report';
$MODULE_PLURAL =   'Site Progress Report';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'site_progress_report';
$ID = 'sp_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

$PPTABLE = 'pp_site_progress_report';
$PPID = 'pr_id';
$fwViewData['PPTABLE'] = $PPTABLE;
$fwViewData['PPID'] = $PPID;

$BASEFOLDER = 'site_progress_report';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['replay'] = $Fusebox['circuit'] . '.replay';

function upload($filename, $tmpname)
{
	global $BASEFOLDER;
	require_once(LIB_DIR . 'CloudEphpClass.php');
	$obj = new CloudEphpClass($BASEFOLDER . '.home');
	return $obj->upload($filename, $tmpname);
}

function generatePDF($heading, $html, $nameoffile)
{
	require_once(BASE_DIR . 'tcpdf/config/lang/eng.php');
	require_once(BASE_DIR . 'tcpdf/tcpdf.php');
	//$PDF_PAGE_ORIENTATION = "R";
	$PDF_PAGE_ORIENTATION = "L";

	class MYPDF extends TCPDF
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


	$filename = $nameoffile . "_" . "_" . date('d_m_Y') . ".pdf";
	$headtext = $heading . " - " . date("d/m/Y");
	$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, false, 'UTF-8', false);
	$pdf->SetCreator(PDF_CREATOR);
	$pdf->SetAuthor('Canberra Granny Flat Builders');
	//$pdf->SetTitle('Answer - ".date("d/m/Y")."<br>TurnKeyStudios Project Sales');
	$pdf->SetTitle("CGFB");
	$pdf->SetSubject($heading);
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
		text-slign: center;
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

	ob_end_clean();
	$pdf->Output($filepath_save, 'F');
	echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>";
	return $filepath_url;
}
