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
$MODULE_SINGULAR = 'Construction Alert Report';
$MODULE_PLURAL =   'Construction Alert Report';

$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'construction_alert_report';
$ID = 'car_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['replay'] = $Fusebox['circuit'] . '.replay';

$XFA['add_steps']  = $Fusebox['circuit'] . '.add_steps';
$XFA['edit_steps'] = $Fusebox['circuit'] . '.edit_steps';


function construction_alert_report_email($id)
{
    $fwDb = new Fw_Db();
    $sql_1 = "Select  car_project from construction_alert_report where car_include_cust = 'Yes' and car_id = " . $id;
    $Data_1 = $fwDb->query($sql_1);

    $current_date1 = date('Y-m-d');
    $day = date("D", strtotime($current_date1));



    foreach ($Data_1 as $k1 => $v1) {
        $sql_2 = 'SELECT  business_sellers.bs_business_id, bus_customers.bcust_misc_email1, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	WHERE business.bsn_name LIKE "%' . $v1['car_project'] . '%"  group by bsn_id';

        $data_2 = $fwDb->query($sql_2);

        $sqlet = "select * from email_template_mini where et_type = 'Customers' ";
        $etdata = $fwDb->queryOne($sqlet);
        $subject = $etdata['et_subject'];
        $message = $etdata['et_content'];

        foreach ($data_2 as $k2 => $v2) {
            $to = $v2['bcust_misc_email1'];
            $toname = $v2['bcust_fname'];

            send_email($toname, $to, 'CGFB Operation Team', 'alerts@cgfb.com.au', $subject, $message, $attachment = '');
            //send_email($toname, 'manojsoniephp@gmail.com', 'CGFB Operation Team', 'alerts@cgfb.com.au', $subject, $message, $attachment='');
        }
    }
}




function create_car($heading, $html)
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


    //$nameoffile = str_replace(" ", "_",$fname);		
    $nameoffile = 'construction_alert_report';
    $filename = $nameoffile . "_" . $fname . "_" . date('d_m_Y') . ".pdf";
    $headtext = $heading . " - " . date("d/m/Y");
    $pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, false, 'UTF-8', false);
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

    ob_end_clean();
    $pdf->Output($filepath_save, 'F');
    echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=800, height=550'); window.focus();</script>";
    return $filepath_url;
}



function create_ic_pdf($heading, $html)
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

    //$nameoffile = str_replace(" ", "_",$fname);		
    $nameoffile = 'ic_report';
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

$BASEFOLDER = 'construction_alert_report';
$fwViewData['BASEFOLDER'] = $BASEFOLDER;

function upload($filename, $tmpname)
{
    global $BASEFOLDER;
    $path = getcwd();
    $zipfile = $filename;

    $resource_id = 1;
    $error_type = "File Uploading to AWS Bucket";

    header('Access-Control-Allow-Origin: *');

    $filetoinclude = $_SERVER['DOCUMENT_ROOT'] . '/file_upload/server/s3/S3.php';
    include_once $filetoinclude;

    $date = date("Y-m-d H:i:s");

    try {
        if (move_uploaded_file($tmpname, $path . '/' .  basename($zipfile))) {
            $s3 = new S3(ACCESS_KEY, SECRET_KEY);
            $flag = 0;
            if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote', 'files/' . $BASEFOLDER . '/' . $zipfile, S3::ACL_PRIVATE)) {
                $flag = 1; //die('in putobject');
            } else {
                sleep(10);
                if ($s3->putObjectFile($path . "/" . $zipfile, 'deckquote',  'files/' . $BASEFOLDER . '/' . $zipfile, S3::ACL_PRIVATE))
                    $flag = 1;
                //die('in putobject in 10');
            }
        } else {
            // echo 'not moved';
            // exit;
        }
    } catch (ErrorException $ex) {
        //$this->error_log($ex->getMessage() . ", error line no " . $ex->getLine(), $error_type, $resource_id, 'WPERR0034');
        echo $ex->getLine();
        return false;
    }

    $rem = $path . '/' .  basename($zipfile);
    unlink($rem);
    return $flag;
}

function showUrl($object_name)
{
    global $BASEFOLDER; // construction_alert_report
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
