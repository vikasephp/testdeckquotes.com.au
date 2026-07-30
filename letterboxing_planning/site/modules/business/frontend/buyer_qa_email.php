<?php
$fwMainView = 'file:' . getcwd() . '/buyer_qa_email.tpl';
$tableTemp = new Fw_Db_Table('email_template');

$print_QA = $fwRequest->getParam('print_QA', '');
$print_QA_email = $fwRequest->getParam('print_QA_email', '');
$print_QA_edit_email = $fwRequest->getParam('print_QA_edit_email', '');
$bsn_id = $fwRequest->getParam('bsn_id', 0);

if($print_QA || $print_QA_email || $print_QA_edit_email)
	{
		

	$qa_list_type = $fwRequest->getParam('qa_list_type', '');
	$includes = $fwRequest->getParam('qa_print', '');
	$bsn_id = $includes['bus_id']; 

    $bsnaddrsql  = "select business.bsn_name from business where bsn_id =".$bsn_id;
	$detail = $fwDb->queryOne($bsnaddrsql);
	//db($detail);
	//exit;

	switch($qa_list_type)
			{
		case 'selected':
		$inc='';	
	if($includes['include_id']){
	foreach($includes['include_id'] as $k => $v)
			{
				if($v !== end($includes['include_id']))
					{
					$inc .= $v.", ";
					}else
					{
					$inc .= $v;
					}
			}
if($inc)
	{	
		$qasql = "SELECT business_qa.*, bus_customers.bcust_code, bus_customers.bcust_id, bus_customers.bcust_type, customers_type.* , users.user_name FROM business_qa 
	LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id
	LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id 
	LEFT Join  users on business_qa.bqa_ans_user_id = users.user_id
	WHERE business_qa.bqa_bsn_id = ".$includes['bus_id']." AND business_qa.bqa_id IN (".$inc.")";
	}	
}

break;

	case 'answered':
			
	$qasql = "SELECT business_qa.*, bus_customers.bcust_code, bus_customers.bcust_id, bus_customers.bcust_type, customers_type.*  , users.user_name FROM business_qa 
	LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id
	LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id 
	LEFT Join  users on business_qa.bqa_ans_user_id = users.user_id
	WHERE business_qa.bqa_bsn_id = ".$includes['bus_id']." AND length(trim(business_qa.bqa_ans_plain)) >= 1 ";
		
	break;
	
	case 'unanswered':
		
	$qasql = "SELECT business_qa.*, bus_customers.bcust_code, bus_customers.bcust_id, bus_customers.bcust_type, customers_type.*  , users.user_name FROM business_qa 
	LEFT JOIN bus_customers ON bus_customers.bcust_id = business_qa.bqa_cust_id
	LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id 
	LEFT Join  users on business_qa.bqa_ans_user_id = users.user_id
	WHERE business_qa.bqa_bsn_id = ".$includes['bus_id']." AND length(trim(business_qa.bqa_ans_plain)) = 0 ";
	
	break;
		
}	

if($qasql)
{	
    $data_wsexport= $fwDb->query($qasql);
	//db($data_wsexport);
	//exit;
}

if($data_wsexport)
{
$color = "#CCCCCC";
	foreach($data_wsexport as $k => $v) 
			{
			unset($qua);
			unset($ans);
				
			$qua = stripslashes($v['bqa_que']);
			$qua = str_replace("•","'",$qua);
			$qua = str_replace("’","'",$qua);
			$qua = str_replace("”","'",$qua);
			$qua = str_replace("“","'",$qua);
			$qua = str_replace("”","'",$qua);
			$qua = str_replace("–","-",$qua);
			
			$ans = stripslashes($v['bqa_ans']);
			$ans = str_replace("•"," ",$ans);
			$ans = str_replace("’","'",$ans);
			$ans = str_replace("”","'",$ans);
			$ans = str_replace("“","'",$ans);
			$ans = str_replace("”","'",$ans);
			$ans = str_replace("–","-",$ans);
			
 			//unset($bcode);
			$date = $v['bqa_created_date'];
			$uname = $v['user_name'];
			$listdata[] = '<tr>
			               <td><b>Question</b> <br>'
						   .$date. '<br>'.trim($qua).'<br><br><b>Answer - '.trim($uname). '</b><br>'.trim($ans).'</td>
			       			</tr>';
			
			if($color == "#CCCCCC"){$color = "#FFFFFF";}else{$color = "#CCCCCC";}	
			}
}
$curdate = date("d/m/Y"); 		

require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');

// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {

    /*//Page header
    public function Header() {
        // Logo
        $image_file = K_PATH_IMAGES.'logo_example.jpg';
        $this->Image($image_file, 10, 10, 15, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
        // Set font
        $this->SetFont('helvetica', 'B', 20);
        // Title
        $this->Cell(0, 15, '<< TCPDF Example 003 >>', 0, false, 'C', 0, '', 0, false, 'M', 'M');
    }
*/
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

// create new PDF document
$pdf = new MYPDF('P', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_AUTHOR);
$pdf->SetTitle('Questions you have asked about your project with CGFB '.SET_PDF_AUTHOR.' <br> Project Address: '.$detail['bsn_name'].' Print Date<br>'.date("d/m/Y"));
$pdf->SetSubject('Questions you have asked about your project with CGFB  '.SET_PDF_AUTHOR);
$pdf->SetKeywords('BES, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, "Questions you have asked about your project with CGFB ", "Project Address: ".$detail['bsn_name']." \nPrint Date: ".date("d/m/Y"));

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
$pdf->SetFont('helvetica', '13', 1);

// add a page
$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------


/*if($listdata)
   {
	foreach($listdata as $k => $v)
			{
			  $combtr .= $v;
				if($counter > 2)
					{
						$trcmb[] = stripslashes($combtr);
						$counter = 0;
						unset($combtr);
					}
			$counter++;
			}
	$trcmb[] = stripslashes($combtr);		
	}*/

$header = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 10pt;
        border: 0px solid #fff;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
  
</style>

EOF;

if($listdata)
	{	
foreach($listdata as $ke => $vl)
		{
			$listdata_tr[] = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
     b {
        color: #333;
        font-family: helvetica;
		font-weight:bold;
        font-size: 11pt;
		padding:0;
    }
	span {
        color: #333;
        font-family: helvetica;
		font-weight:bold;
        font-size: 10pt;
		padding:0;
    }
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 10pt;
        border: 0px solid #fff;
        background-color: #FFF;
		
    }
    td {
        border: 1px solid #333;
        background-color: #ffffee;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
   
</style>
<table class="first" cellpadding="10" cellspacing="15">
	$vl
</table>				
EOF;
		}
}

// output the HTML content
$pdf->writeHTML($header, true, false, true, false, '');

if($listdata_tr)
{

foreach($listdata_tr as $key => $vbody)
		{
		if($vbody)
			{       $vbody = utf8_decode($vbody);
				$pdf->writeHTML($vbody, true, false, true, false, '');
			}
		}
	}
else
	{
	$errorbody = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>

       table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 10pt;
        border: 0px solid #fff;
        background-color: #FFF;
    }
    td {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.second {
        border: 2px dashed green;
    }
    div.test {
        color: #CC0000;
        background-color: yellow;
        font-family: helvetica;
        font-size: 13pt;
        border: 0px solid #fff;
        text-align: center;
	
    }
</style>
<div class="test">No record found.!!!</div>
				
EOF;
	$pdf->writeHTML($errorbody, true, false, true, false, '');
	}
$filename ="Q_A_Report_".date('Y-m-d').".pdf";
$filenamepath = BASE_DIR."reports/".$filename;
$pdf->Output($filenamepath , 'F');

$filenameurl = BASE_URL."reports/".$filename;
$fwViewData['gen_report_path'] = $filenameurl;

if($print_QA_email){if($buyer_count= send_auto_answer_to_buyers($bsn_id, $filenameurl)){$fwViewData['report_msg'] = $buyer_count;}}
elseif($print_QA_edit_email){$_SESSION['attach']['file_name'] = $filename;}
else{Location($filenameurl);}
}
if($bsn_id)
	{			 
//$buyers_data_sql = "SELECT byer_enquiry.be_customer_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, business.bsn_name FROM byer_enquiry 
//			LEFT JOIN bus_customers ON bus_customers.bcust_id = byer_enquiry.be_customer_id
//			LEFT JOIN business ON business.bsn_id = byer_enquiry.be_business_id
//			 WHERE byer_enquiry.be_status = 1 AND byer_enquiry.be_answer_required = 1 AND  byer_enquiry.be_business_id = ".$bsn_id;			 

 $buyers_data_sql  = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname,
                      bus_customers.bcust_lname, bus_customers.bcust_misc_email1 from business_sellers 		
		              Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
					  where business_sellers.bs_business_id = ". $bsn_id;

		
			$buyers = $fwDb->query($buyers_data_sql);	
			$fwViewData['buyers_count'] = count($buyers);
			$fwViewData['buyers'] = $buyers;	
			
			$tableTemp = new Fw_Db_Table('email_template'); 
			$tableTemp->setWhere('et_section = '.BUYER_REPORT_QA_SECTION.' AND et_status = 1');
			$email_template_data = $tableTemp->getRow();
			
			
	$fwViewData['subject']=$email_template_data['et_subject'];
	$fwViewData['body'] =$email_template_data['et_body']; 
	
			
}			
			
$logged_usename = $_SESSION['user']['user_name'];
$send_email = $fwRequest->getParam('send_email', '');

if($send_email)
	{
	$buyer_id = $fwRequest->getParam('buyer_name', array());
	$subject = trim($fwRequest->getParam('subject', ''));
	$email_body = $fwRequest->getParam('email_body', '');
	
	
	$fromname = "Cgfb";
	//$from= SITE_EMAIL_SEND;
	$from = "info@cgfb.com.au";
	$type = BUYER_REPORT_QA_SECTION;
	$count = 0;
	$attachment = "None";		
	if($_SESSION['attach']['file_name'])
		{
		$attachmentpath[] = BASE_URL."reports/".$_SESSION['attach']['file_name'];
		$attachment = serialize($attachmentpath);
		}
	$fwViewData['sent_mail'] = "Email hasn't sent successfully.";	

	if($buyers)	
		{	
		
		
			
	foreach($buyers as $sk => $sv)
			{
			  	foreach($buyer_id as $k => $v)
						{
						 if($sv['be_customer_id'] == $v)
							{
								$email_body2 = str_replace("{{buyerfname}}", $sv['bcust_fname'], $email_body);
								$email_body2 = str_replace("{{buyerlname}}", $sv['bcust_lname'], $email_body2);
								$email_body2 = str_replace("{{businessname}}", $sv['bsn_name'], $email_body2);
	
								$toname = $sv['bcust_fname']." ".$sv['bcust_lname'];
								$email = trim($sv['bcust_misc_email1']);
								//$email = "manojsoniephp@gmail.com";

								if(send_email($toname, $email, $fromname, $from, $subject, $email_body2, $attachment))
									{
									email_tracking($toname, $email, $fromname, $from, $subject, $email_body2, $attachment, $type);
									}
							$count++;
							
							}
						
						}
			
			
			}
	$fwViewData['sent_mail'] = $count." Email has sent successfully.";
			
		}

}

if($_SESSION['attach']['file_name'])
	{
	$fwViewData['attach_file'] = $_SESSION['attach']['file_name'];
	}
else{
$fwViewData['attach_file']="";
}
$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['title'] = "Send Q/A report email";
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////