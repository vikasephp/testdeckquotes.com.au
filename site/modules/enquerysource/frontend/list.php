<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$tablestatus = new Fw_Db_Table('customers_status');
$tableintrest = new Fw_Db_Table('customers_type');
$submit = $fwRequest->getParam('search', '');
$tablePages->setOrderBy($ID.' DESC');
$export = $fwRequest->getParam('export', '');
$print = $fwRequest->getParam('print', '');
$logged_username = $_SESSION['user']['user_name'];

//////////////////////////////////// Export Print Start///////////////////////////////////////////

if(($export || $print) && empty($_SESSION['last_sql']) )
	{Location(BASE_URL . $XFA['list']);}


if(!empty($print))
	{
/////////////////////////////////////////////
if($_SESSION['last_sql']){$exportdata = $fwDb->query($_SESSION['last_sql']);}			
////////////////////////////////////////////
require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');

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

foreach($exportdata as $k => $v) {

if($v['buse_initial_phone_call_date'] !== '0000-00-00' ){$bipcd = 'Yes';}else{$bipcd = 'No';}
if($v['bcust_gendec_sent_date'] !== '0000-00-00' ){$gipcd = 'Yes';}else{$gipcd = 'No';}
		$listdata[]= '
<tr><td width="20%"><b>Business Name:</b></td>
	<td colspan="5"><b>'.$v[bsn_name].'</b></td>
</tr>
   	<tr><td width="15%">Customer</td>
	<td width="20%">General Disclaimer</td>
	<td width="10%">Mobile Number</td>
	<td width="10%">Business Number</td>
	<td width="10%">Phone Number</td>
	<td width="25%">Email</td>
	<td width="10%">Date Enquired</td>
	</tr>
	<tr><td height="10">'.$v[bcust_fname] .' '.$v[bcust_lname].'</td>
	<td >'.$gipcd.'</td>
	<td >'.$v[bcust_misc_moble].'</td>
	<td >'.$v[bcust_misc_business].'</td>
	<td >'.$v[bcust_misc_home].'</td>
	<td >'.$v["bcust_misc_email1"].'</td>
	<td >'.$v[buse_created_date].'</td>
	</tr>
	<tr><td >Initial Phone Call</td>
	<td >Feedback</td>
	<td colspan="3">Question asked information request</td>
	<td >New feedback</td>
	<td ></td>
	</tr>
	<tr><td >'.$bipcd.'</td>
	<td ></td>
	<td colspan="3"></td>
	<td ></td>
	<td ></td>
	</tr>';
        }
		

// create new PDF document
$pdf = new MYPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Capital Commercial Business Sales');
$pdf->SetTitle('Buyer Feedback Report - ".$bus_name." - ".date("d/m/Y")."<br>Capital Commercial Business Sales');
$pdf->SetSubject('Buyer Feedback Report');
$pdf->SetKeywords('BES, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, "Buyer Enquiry Call Sheet");

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
$header = <<<EOF
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
        background-color: #FFFFAA;
    }
    table.first {
        color: #003300;
        font-family: helvetica;
        font-size: 10pt;
        border: 0px solid #333;
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
        background-color: #fff;
        font-family: helvetica;
        font-size: 58pt;
        border: 0px solid #fff;
        text-align: left;	
    }
</style>
<div class="test"><div></div></div>

<br />

EOF;



if($listdata)
	{
foreach($listdata as $ke => $vl)
		{
		if($vl)
			{
			$listdata_tr[] = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
     b {
        color: #333;
        font-family: helvetica;
		font-weight:bold;
        font-size: 10pt;
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
        border: 0px solid #fff;
        background-color: #ffffee;
		padding-left:20pt;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.second {
        border: 2px dashed green;
    }
   
</style>
<table class="first" cellpadding="4" cellspacing="2">
	$vl
</table>				
EOF;
	}
		}
}		
$footer = <<<EOF
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

</style>
EOF;

if($listdata_tr)
{
$pdf->writeHTML($summery_chart, true, false, true, false, '');
$count = 0;
foreach($listdata_tr as $key => $vbody)
		{
		if($count < 500)
			{
			if($vbody)
				{
				$pdf->writeHTML($vbody, true, false, true, false, '');
				}
			}	
			$count++;
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
//$pdf->writeHTML($footer, true, false, true, false, '');

// reset pointer to the last page
//$pdf->lastPage();

// ---------------------------------------------------------

//Close and output PDF document


$pdf->Output($filename, 'I');
exit;

	}


if($export)
	{
$csv_output = "";
if($_SESSION['last_sql'])
{	
$exportdata = $fwDb->query($_SESSION['last_sql']);

	$fields = array( "bcust_fname", "bcust_lname","bcust_misc_email1","bcust_misc_moble","bcust_gendec_signed_date","cs_name","be_created_date","be_answer_required","be_sed_date","be_easts_date","be_ipc_date");	
	
	$fields_head = array("CUSTOMER_FIRST_NAME","CUSTOMER_LAST_NAME","EMAIL","PHONE_NUMBER","SIGNED_DISCLAIMER","STATUS","CREATED_DATE","ANSWER_REQUIRED","SEND_DOSSIER","EMAIL_ADVICE","INITIAL_PHONE_CALL");
	
$csv_output .= strtoupper(implode(",\t", $fields_head));
$csv_output .= "\n";	
foreach($exportdata as $k => $v)
		{
	$phonecall = 0;	

			foreach($v as $k2 => $v2)
					{
						if(in_array($k2, $fields))
								{
								if($k2 == 'be_answer_required')
									{
										if($v2 == 0){$data = "No";}else{$data = "Yes";}
										$csv_output .= trim($data).",\t";
										
									}
									
									elseif( ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})", trim($v2), $regs))
									{
							$csv_output .= $regs[3]."/".$regs[2]."/".$regs[1].",\t";
									}
									else
									{
							$csv_output .= trim($v2).",\t";
									}	
								
						}
					}
			$csv_output .= "\n";	
		}
		
		
$filename ="export"."_".date("YmdHi",time()).".csv";
$contents = "testdata1 \t testdata2 \t testdata3 \t \n";
header('Content-type: application/ms-excel');
header('Content-Disposition: attachment; filename='.$filename);
echo $csv_output;
exit;
}

}

if(empty($pagenum))
	{
	unset($_SESSION['last_sql']);
	unset($_SESSION['detail']);
	}
if(!empty($submit))
{
    
    $detail = $fwRequest->getParam($TABLE, array());
//	db($detail);

$detail = clean_array($detail);

	$string ="";
	if($detail['bcust_fname']){$string.= "bcust_fname LIKE '".trim($detail['bcust_fname'])."%' AND ";}
	if($detail['bcust_lname']){$string.= "bcust_lname LIKE '".trim($detail['bcust_lname'])."%' AND ";}
	if($detail['bcust_misc_email1']){$string.= "bcust_misc_email1 LIKE '%".trim($detail['bcust_misc_email1'])."%' AND ";}
	if($detail['bcust_status']){$string.= "bcust_status = ".trim($detail['bcust_status'])." AND ";}
	if($detail['bcust_misc_logged_date_date_from'] AND empty($detail['be_created_date'])){$string.= "be_created_date >= '".trim($detail['bcust_misc_logged_date_date_from'])."' AND ";}
	
	if(empty($detail['bcust_misc_logged_date_date_from']) AND $detail['bcust_misc_logged_date_date_to']){$string.= "be_created_date <= '".trim($detail['bcust_misc_logged_date_date_to'])."' AND ";}
	
	if($detail['bcust_misc_logged_date_date_from'] AND $detail['bcust_misc_logged_date_date_to']){$string.= "be_created_date BETWEEN '".trim($detail['bcust_misc_logged_date_date_from'])."' AND '".trim($detail['bcust_misc_logged_date_date_to'])."' AND ";}
	
	if($detail['bcust_isbuyer']){$string.= "bcust_isbuyer = 1 AND ";}
	
	if($detail['bcust_isseller']){$string.= "bcust_isseller = 1 AND ";}	
	
	if($detail['phones']){$string.= "bcust_misc_moble LIKE '%".trim($detail['phones'])."%' OR bcust_misc_business LIKE '%".trim($detail['phones'])."%' OR bcust_misc_home LIKE '%".trim($detail['phones'])."%' AND ";}

	$string = substr($string, 0, -5);
	unset($_SESSION['last_sql']);

    $string2="";
	if($detail['disclamer_type'] == 1)
	{
	$string2 = "bus_customers.bcust_gendec_sent_date NOT LIKE '0000-00-00' AND  bus_customers.bcust_gendec_signed_date LIKE '0000-00-00'";
	}
    else if($detail['disclamer_type'] == 2)
	  {
		 $string2 = "byer_enquiry.be_ipc_date LIKE '0000-00-00'";
      } 
	else if($detail['disclamer_type'] == 3)
	{
	    $string2 = "byer_enquiry.be_sed_date LIKE '0000-00-00' AND bus_customers.bcust_gendec_signed_date NOT LIKE '0000-00-00'";
	}
   else if($detail['disclamer_type'] == 4)
	{
    $string2 = "bus_customers.bcust_id NOT IN (SELECT distinct bef_cust_id from befollowups)";
	}
	 else if($detail['disclamer_type'] == 5)
	{
    $string2 = "bus_customers.bcust_id IN (Select distinct bef_cust_id from befollowups WHERE bef_create_date NOT LIKE '%0000-00-00%' AND bef_done_date LIKE '%0000-00-00%')";
	}
	else if($detail['disclamer_type'] == 6)
	{
	    $string2 = "byer_enquiry.be_answer_required = 1 ";
	}
	

$fwViewData['detail'] = $detail;
$_SESSION['detail'] = $detail;
if($string)
			{
				if($string2)
				{
					$sql = "SELECT bus_customers.*, customers_status.*, customers_type.*, byer_enquiry.*,  business.bsn_id, business.bsn_name, enquirysource.*
			FROM bus_customers 
			LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id  
			Right JOIN byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id  
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry WHERE " .$string ." AND ".$string2;
				}
				else
				 {
					$sql = "SELECT bus_customers.*, customers_status.*, customers_type.*, byer_enquiry.*,  business.bsn_id, business.bsn_name, enquirysource.*
			FROM bus_customers 
			LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id  
			Right JOIN byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id  
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry WHERE " .$string; 
				 }
			}
			else if($string2)
			{
			$sql = "SELECT bus_customers.*, customers_status.*, customers_type.*, byer_enquiry.*,  business.bsn_id, business.bsn_name, enquirysource.*
			FROM bus_customers 
			LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id  
			Right JOIN byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id  
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry WHERE ".$string2;
			}
			else
			{
			$sql = "SELECT bus_customers.*, customers_status.*, customers_type.*, byer_enquiry.*,  business.bsn_id, business.bsn_name, enquirysource.*
			FROM bus_customers 
			LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id  
			Right JOIN byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id  
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry"; 
			
			}
			
			
if($detail['sorting']){

	switch($detail['sorting'])
		{
			case 1:
			$order = " ORDER BY byer_enquiry.be_ipc_date DESC";
			break;
			
			case 2:
			$order = " ORDER BY byer_enquiry.be_id DESC";
			break;
			
			case 3:
			$order = " ORDER BY business.bsn_name ASC";
			break;
			
			case 4:
			$order = " ORDER BY bus_customers.bcust_fname ASC, byer_enquiry.be_id DESC";
			break;
			
			case 5:
			$order = " ORDER BY enquirysource.soe_name ASC";
			break;
		
		}
if($sql){$sql .= $order;}


//db($detail['sorting']); exit;

}		
}
if(!empty($_SESSION['last_sql']))
{
$sql = $_SESSION['last_sql'];
$fwViewData['detail'] = $_SESSION['detail'];
	
}


if($sql){$userData = $fwDb->query($sql);}

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 20;
    $last = ceil($rows/$page_rows); 
    
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
	$fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for($i=0; $i<9; $i++)
		{
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext ++;
		}
		$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;	
	for($i=0; $i<9; $i++)
		{
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev --;
		}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $sql." ".$max;

if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
}
//DB($fwViewData['list']);
$fwViewData['title'] = $MODULE_PLURAL;
$tablestatus->setOrderBy('cs_id'.' ASC');
$fwViewData['customers_status']=$tablestatus->getAllRows();
$tableintrest->setOrderBy('ct_id'.' ASC');
$fwViewData['customers_type']=$tableintrest->getAllRows();
$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');