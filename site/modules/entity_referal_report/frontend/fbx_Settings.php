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
$XFA['home2'] = $Fusebox['circuit'] . '.home2';
$XFA['home1'] = $Fusebox['circuit'] . '.home1';
$XFA['home_inactive'] = $Fusebox['circuit'] . '.home_inactive';


	require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
	require_once(BASE_DIR.'tcpdf/tcpdf.php');
	$PDF_PAGE_ORIENTATION = "P";
//	
	class MYPDF2 extends TCPDF {

    	public function Footer() {
    
        $this->SetY(-15);
    
        $this->SetFont('helvetica', 'I', 7);
    
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

function create_er_first_page($heading, $html, $bsn_id, $page)
{

$PAGE_ORIENTATION = 'P';	
		
//$nameoffile = str_replace(" ", "_",$fname);		
//$nameoffile = 'er_page1_'.$bsn_id;
$nameoffile = $page.$bsn_id;
$filename = $nameoffile.".pdf";
$headtext = $heading." - ".date("d/m/Y");
$pdf = new MYPDF2('P', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Canberra Granny Flat Builders');
$pdf->SetTitle("CGFB");
$pdf->SetSubject('Entity Referral Report');
$pdf->SetKeywords('GCON, PDF');
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, "Canberra Granny Flat Builders");
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
$pdf->setLanguageArray($l);

$pdf->SetFont('helvetica', '20', 8);

$pdf->AddPage();
$pdf->setLanguageArray($l);
$pdf->setJPEGQuality(105);	

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

$filepath = 'files/document_check_list_files/'.$filename;
$filepath_save =BASE_DIR.$filepath;
$filepath_url =BASE_URL.$filepath;

ob_end_clean();
$pdf->Output($filepath_save, 'F');


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
            
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME, 'files/quote_builder/'.$zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
            if ($s3->putObjectFile($path . "/" . $zipfile, BUCKET_NAME,  'files/quote_builder/'.$zipfile, S3::ACL_PRIVATE))
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


function get_file_raw_data($folder_path,$object_name)
{
    $filetoinclude = $_SERVER['DOCUMENT_ROOT'].'/file_upload/server/s3/S3.php';  include_once $filetoinclude;
    $bucket_name  = "deckquote";  
   $s3 = new S3(ACCESS_KEY, SECRET_KEY);
    try {
        	$file_data = $s3->getObject($bucket_name, $folder_path.$object_name, $saveTo = false); 
        //	echo "<pre>";print_r($file_data);   echo "Content-Type: ".$file_data->headers['type']; exit('checking');
        	$file_raw_data = $file_data->body;  $file = $object_name;
            $txt = fopen($_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file, "w") or die("Unable to open file!");
            fwrite($txt, $file_raw_data); fclose($txt);
            return $file = $_SERVER['DOCUMENT_ROOT'].'/download_files/'.$file ;
    	 
        } catch (ErrorException $ex) {
            //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
            echo $ex->getLine();
            return false;
        }
}