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
$MODULE_SINGULAR = 'Street Sign';
$MODULE_PLURAL = 'Street Sign';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'street_sign';
$ID = 'ss_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['upload'] = $Fusebox['circuit'] . '.upload';
$XFA['docdelete'] = $Fusebox['circuit'] . '.docdelete';
$XFA['open'] = $Fusebox['circuit'] . '.open';

$XFA['tprint'] = $Fusebox['circuit'] . '.tprint';
$XFA['tdprint'] = $Fusebox['circuit'] . '.tdprint';




function create_construction_report($heading, $html, $fname)
		{
		
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
        $this->SetFont('helvetica', 'I', 7);
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
	

$PAGE_ORIENTATION = 'P';	
		
//$nameoffile = str_replace(" ", "_",$fname);		
$nameoffile = 'construction_report';
$filename = $nameoffile."_".time()."_".date('d_m_Y').".pdf";
$headtext = $heading." - ".date("d/m/Y");
// create new PDF document
//$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
$pdf = new MYPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Canberra Granny Flat Builders');
//$pdf->SetTitle('Answer - ".date("d/m/Y")."<br>TurnKeyStudios Project Sales');
$pdf->SetTitle("CGFB");
$pdf->SetSubject('Construction Task Tracker');
$pdf->SetKeywords('GCON, PDF');

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
$pdf->SetFont('helvetica', '20', 9);

// add a page
$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);


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
        font-size: 10pt;
        border: 1px solid #CCC;
        background-color: #FFF;
    }
    td {
        border: 1px solid #CCC;
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
$html		
EOF;
	
$pdf->writeHTML($vbody, true, false, true, false, '');		

//Close and output PDF document
$filepath = 'reports/'.$filename;
 $filepath_save =BASE_DIR.$filepath;
$filepath_url =BASE_URL.$filepath;

ob_end_clean();
$pdf->Output($filepath_save, 'F');




//return $filepath_url;

		}
		
function create_construction_report_2($heading, $html, $fname)
		{
		
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
        $this->SetFont('helvetica', 'I', 7);
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
	

$PAGE_ORIENTATION = 'P';	
		
//$nameoffile = str_replace(" ", "_",$fname);		
$nameoffile = 'construction_report';
$filename = $nameoffile."_".time()."_".date('d_m_Y').".pdf";
$headtext = $heading." - ".date("d/m/Y");
// create new PDF document
//$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
$pdf = new MYPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Canberra Granny Flat Builders');
//$pdf->SetTitle('Answer - ".date("d/m/Y")."<br>TurnKeyStudios Project Sales');
$pdf->SetTitle("CGFB");
$pdf->SetSubject('Construction Task Tracker');
$pdf->SetKeywords('GCON, PDF');

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
$pdf->SetFont('helvetica', '20', 9);

// add a page
$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);


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
        font-size: 10pt;
        border: 1px solid #CCC;
        background-color: #FFF;
    }
    td {
        border: 1px solid #CCC;
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
$html		
EOF;
	
$pdf->writeHTML($vbody, true, false, true, false, '');		

//Close and output PDF document
$filepath = 'reports/'.$filename;
 $filepath_save =BASE_DIR.$filepath;
$filepath_url =BASE_URL.$filepath;

ob_end_clean();
$pdf->Output($filepath_save, 'F');

echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>"; 


return $filepath_url;

		}





function upload($filename, $tmpname)
{
	
	$path = getcwd();

	$zipfile = $filename;
	
        $resource_id = 1;
        $error_type = "File Uploading to AWS Bucket";

        header('Access-Control-Allow-Origin: *');

        $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';
	    include_once $filetoinclude;

        $date = date("Y-m-d H:i:s");
        		
        try {
            if(move_uploaded_file($tmpname, $path .'/'.  basename($zipfile)))
					{  
   				$s3 = new S3(ACCESS_KEY, SECRET_KEY);
            
            $flag = 0;
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/weekly_letter_construction/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/weekly_letter_construction/'.$zipfile, S3::ACL_PRIVATE))
		$flag = 1;
					//die('in putobject in 10');
            }

        }else{
            echo 'not moved';exit;
        }
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
            return false;
        }
	
	$rem = $path .'/'.  basename( $filename);
	unlink($rem);		
}