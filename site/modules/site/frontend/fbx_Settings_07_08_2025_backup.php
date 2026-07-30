<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/

require_once(MODULES_DIR . 'frontend.init.php');

$XFA['force-download'] = 'site.force-download';
$XFA['disable'] = 'disable';




require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
	require_once(BASE_DIR.'tcpdf/tcpdf.php');
	$PDF_PAGE_ORIENTATION = "R";
	//$PDF_PAGE_ORIENTATION = "L";

	class MYPDF extends TCPDF {
   
    // Page footer
    public function Footer() {

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
		
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		
    }
}		



function create_warranty_PDF($heading, $html, $fname)
{
				
//$nameoffile = str_replace(" ", "_",$fname);		
$nameoffile = 'warranty_log';
$filename = $nameoffile."_".$fname."_".date('d_m_Y').".pdf";
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
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, "Canberra Granny Flat Builders");
//$pdf->SetHeaderData(PDF_HEADER_LOGO3, PDF_HEADER_LOGO_WIDTH2, '', "");

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);


$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

$pdf->AddPage();
$pdf->setLanguageArray($l);
$pdf->setJPEGQuality(105);	
// output the HTML content
//$pdf->writeHTML($html, true, false, true, false, '');

$vbody = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>

table tr td {
    border: 1px solid #000;
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
if(!empty($fname2)) {
echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>"; 
}
//  $file = $filepath_url;
//  header('Content-type: application/pdf');
//  header('Content-Transfer-Encoding: binary');
//  header('Accept-Ranges: bytes');
//  @readfile($file); 

return $filepath_url;

		}	
				


function create_supplier_issue_PDF($heading, $html, $fname)
{
				
//$nameoffile = str_replace(" ", "_",$fname);		
$nameoffile = 'supplier_issue';
$filename = $nameoffile."_".$fname."_".date('d_m_Y').".pdf";
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
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, "Canberra Granny Flat Builders");
//$pdf->SetHeaderData(PDF_HEADER_LOGO3, PDF_HEADER_LOGO_WIDTH2, '', "");

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);


$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '23', 10);

$pdf->AddPage();
$pdf->setLanguageArray($l);
$pdf->setJPEGQuality(105);	
// output the HTML content
//$pdf->writeHTML($html, true, false, true, false, '');

$vbody = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>

table tr td {
    border: 1px solid #000;
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

//  $file = $filepath_url;
//  header('Content-type: application/pdf');
//  header('Content-Transfer-Encoding: binary');
//  header('Accept-Ranges: bytes');
//  @readfile($file); 

return $filepath_url;

		}	
		
function get_file_raw_data($folder_path,$object_name)
{
    $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php'; include_once $filetoinclude;
    $bucket_name  = "deckquote"; 
   // $s3 = new S3('AKIA2AMNCYNNR3C7ELXP', 'ut4HuWX5HovWcxoCaU8gSSE27/RBxidTIh3SqYe2');
	$s3 = new S3(ACCESS_KEY, SECRET_KEY); 
	 
    try {
    	$file_data = $s3->getObject($bucket_name, $folder_path.$object_name, $saveTo = false); 
    //	echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
    	$file_raw_data = $file_data->body;

        $file = $object_name;
        $txt = fopen($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file, "w") or die("Unable to open file!");
        fwrite($txt, $file_raw_data);
        fclose($txt);
        
      
        return $file = $_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file;
    	 
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
           echo $ex->getLine();
            return false;
        }
}
		
				
