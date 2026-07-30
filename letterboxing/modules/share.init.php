<?php

/* common stuff to both admin and frontend */

// load table model
require_once(LIB_DIR . 'Fw/Db/Table.php');
function create_PDFS($heading, $html, $fname)
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
$filename = $nameoffile."_".date('d_m_Y').".pdf";
$headtext = $heading." - ".date("d/m/Y");
// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Capital Commercial Business Sales');
$pdf->SetTitle('Seller answer - ".date("d/m/Y")."<br>Capital Commercial Business Sales');
$pdf->SetSubject('Seller answer');
$pdf->SetKeywords('BES, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, "Capital Commercial Business Sales");

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

//foreach
if(is_array($html))
	{
	
	
	foreach($html as $k => $v)
			{
			
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
$v		
EOF;
	
$pdf->writeHTML($vbody, true, false, true, false, '');	
			
			
			
			}
	
	}
else
{
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
}

//Close and output PDF document
$filepath = 'reports/'.$filename;
$filepath_save =BASE_DIR.$filepath;
$filepath_url =BASE_URL.$filepath;

$pdf->Output($filepath_save, 'F');
 return $filepath_url;

		}	
		
		
		
function send_vender_email_qa_bk($bsn_id,$queid,$custid)
	{
	
	$tableTemp = new Fw_Db_Table('bus_customers'); 
	$tableTemp->setWhere('bcust_id = '.$custid);
	$byerdata = $tableTemp->getRow();

	$tableTemp = new Fw_Db_Table('business_qa'); 
	$tableTemp->setWhere('bqa_id = '.$queid);
	$qadata = $tableTemp->getRow();

	$to = $byerdata['bcust_misc_email1'];
	$tonames = $byerdata['bcust_fname']." ".$byerdata['bcust_lname'];
	$to = "dharmendra@ephpsolutions.com";
	
	$fromname = FROM_NAME;
	$from = SITE_EMAIL_SEND;
	
	
	$tableTemp = new Fw_Db_Table('email_template'); 
	$tableTemp->setWhere('et_section = 7 AND et_status = 1');
	$email_template_data = $tableTemp->getRow();
	
	$subject =$email_template_data['et_subject'];
	$et_body = str_replace("{{buyerfname}}", $byerdata['bcust_fname'], $email_template_data['et_body']);
	$et_body = str_replace("{{buyerlname}}", $byerdata['bcust_lname'], $et_body);
	$et_body = str_replace("{{businessname}}", $busdata['bsn_name'], $et_body);
	$email_body = $et_body;

$heading = "Answer your question.";
$ques = trim($qadata['bqa_que']);
$ans = trim($qadata['bqa_ans']);
$notes =  trim($qadata['bqa_notes']);
$html = '<table class="first"><tr><td width="50">Que.</td><td>'.$ques.'<br></td></tr>
							  <tr><td>Ans.</td><td>'.$ans.'<br></td></tr>
							  <tr><td>Notes.</td><td>'.$notes.'</td></tr></table>';
	$filename = "q_a_answer";	
	$pdfattach = create_PDFS($heading, $html, $filename);


$attachment = "None";
if($pdfattach)
	{
	$att_data[] = $pdfattach;
	$attachment = serialize($att_data);	
	}
	
	
	send_email($tonames, $to, $fromname, $from, $subject, $email_body,$attachment);
	email_tracking($tonames, $to, $fromname, $from, $subject, $email_body,$attachment,7);
$action = 1;
return $action;	  
	}	
			
function send_answer_to_all_buyers_qa($bsn_id)
	{
	$fwDb = new Fw_Db();
	$buyersql = "SELECT byer_enquiry.be_id, byer_enquiry.be_business_id, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_id, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 FROM byer_enquiry LEFT JOIN bus_customers ON bus_customers.bcust_id = byer_enquiry.be_customer_id WHERE byer_enquiry.be_status = 1 AND byer_enquiry.be_answer_required = 1 AND byer_enquiry.be_business_id = ".$bsn_id;
		
	$buyers = $fwDb->query($buyersql);
	
	
	$questionsql = "SELECT business_qa.* FROM business_qa WHERE business_qa.bqa_status = 1 AND business_qa.bqa_bsn_id = ".$bsn_id;	
	$qadata = $fwDb->query($questionsql);
	$fromname = FROM_NAME;
	$from = SITE_EMAIL_SEND;
	
	
	$tableTemp = new Fw_Db_Table('email_template'); 
	$tableTemp->setWhere('et_section = 7 AND et_status = 1');
	$email_template_data = $tableTemp->getRow();
	

	$heading = "Answer your question.";

		
			foreach($qadata as $key => $value)
					{
		$html[]= '<table class="first">
					<tr><td width="100" valign="top">Que.</td><td>'.stripslashes($value['bqa_que']).'<br></td></tr>
					<tr><td>Ans.</td><td>'.stripslashes($value['bqa_ans']).'<br></td></tr>
					<tr><td>Ans. Date</td><td>'.date("d-m-Y",strtotime(stripslashes($value['bqa_ans_date']))).'<br></td></tr>
					<tr><td>Notes.</td><td>'.stripslashes($value['bqa_notes']).'</td></tr>
				  </table>';
					}				  
				  
							  
	$filename = "q_a_answer";	
	$pdfattach[] = create_PDFS($heading, $html, $filename);
		$attachment= serialize($pdfattach);

	$count = 0;

	foreach($buyers as $k => $v)
			{
	$subject =$email_template_data['et_subject'];
	$et_body = str_replace("{{buyerfname}}", $v['bcust_fname'], $email_template_data['et_body']);
	$et_body = str_replace("{{buyerlname}}", $v['bcust_lname'], $et_body);
	$et_body = str_replace("{{businessname}}", $busdata['bsn_name'], $et_body);
	$email_body = $et_body;

	$toemail = trim($v['bcust_misc_email1']);
	$toname = $v['bcust_fname']." ".$v['bcust_lname'];
	//$toemail = "dharmendra@ephpsolutions.com";

		$count ++;

		if(send_email($toname, $toemail, $fromname, $from, $subject, $email_body, $attachment))
			{
			email_tracking($toname, $toemail, $fromname, $from, $subject, $email_body, $attachment, 7);
			}
	}
return $count;	  
	}			
