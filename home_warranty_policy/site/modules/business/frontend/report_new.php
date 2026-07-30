<?php 
$fwMainView = 'file:' . getcwd() . '/report.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', 0); 
$fwViewData['opt'] = $fwRequest->getParam('opt', '');
//require_once(BASE_DIR."dompdf/dompdf_config.inc.php");
$option = $fwRequest->getParam('option', '');
switch ($fwViewData['opt'])
	{
	case 2:
	$fwViewData['report_name'] = "Buyer Feedback Report - ".date("d-m-Y");
	break;
	}

if($bsn_id)
	{
	$bus_sql = "SELECT business.bsn_id,business.bsn_name,business.bsn_cd_contact, business_file.* FROM business
	LEFT JOIN business_file ON business_file.bf_bsn_id = business.bsn_id AND business_file.bf_role = 1 WHERE business.bsn_id = ".$bsn_id ;	
	$busdata= $fwDb->queryOne($bus_sql);
	$agent = $_SESSION['user']['user_name'];
	$sellers_name = $busdata['bsn_cd_contact'];	
$bus_name = $busdata['bsn_name'];
$fwViewData['bsn_id'] = $bsn_id;

$image_path = BASE_DIR."files/business_images/".$busdata['bf_name'];
}
if($option)
{


switch ($option)
	{
	
	case 2:
	$dbs = $fwRequest->getParam('dbs', '');
	$buyerstatus = $fwRequest->getParam('buyerstatus', '');
	require_once(BASE_DIR."libchart/classes/libchart.php");
	
	

	switch ($buyerstatus)
		{
			case 1:
			$status = "byer_enquiry.be_status != ''";
			break;
			
			case 2:
			$status = "byer_enquiry.be_status = 1";
			break;
			
			case 3:
			$status = "byer_enquiry.be_status = 2";
			break;
		
		}
	
	
	
 $sql = "Select byer_enquiry.be_id, byer_enquiry.be_customer_id, byer_enquiry.be_source_of_enquiry , byer_enquiry.be_created_date, byer_enquiry.be_created_time, byer_enquiry.be_sed_date, byer_enquiry.be_sed_time, byer_enquiry.be_request_info, byer_enquiry.be_business_id, byer_enquiry.be_status, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_gendec_signed_date, bus_customers.bcust_status, bus_customers.bcust_code, enquirysource.* From byer_enquiry
				LEFT Join bus_customers On bus_customers.bcust_id = byer_enquiry.be_customer_id
				RIGHT Join enquirysource On byer_enquiry.be_source_of_enquiry = enquirysource.soe_id 	 	  
WHERE byer_enquiry.be_business_id = ".$bsn_id. " AND ".$status." ORDER BY bus_customers.bcust_id ASC LIMIT 0, 42";


$followdata =$fwDb->query($sql);

$sqlfollowups = "SELECT befollowups.*, users.user_id, users.user_name										
FROM befollowups  
LEFT Join users On users.user_id = befollowups.bef_done_user
WHERE befollowups.bef_bus_id = ".$bsn_id;
$followupsdata =$fwDb->query($sqlfollowups);


$sqlinspection = "SELECT byer_enquiry.be_id, byers_other_data.*										
FROM byer_enquiry 
RIGHT JOIN byers_other_data ON byer_enquiry.be_id = byers_other_data.bod_be_id AND byers_other_data.bod_type = 1 	 
WHERE byer_enquiry.be_business_id = ".$bsn_id;
$inspectiondata =$fwDb->query($sqlinspection);


$sqlmakeoffer = "SELECT byer_enquiry.be_id, byers_other_data.*									
FROM byer_enquiry 
RIGHT JOIN byers_other_data  ON byer_enquiry.be_id = byers_other_data.bod_be_id AND byers_other_data.bod_type = 2
WHERE byer_enquiry.be_business_id = ".$bsn_id;
$makeofferdata =$fwDb->query($sqlmakeoffer);

$sqlinforeq = "SELECT byer_enquiry.be_id, byers_other_data.* 
FROM byer_enquiry 
RIGHT JOIN byers_other_data ON byer_enquiry.be_id = byers_other_data.bod_be_id AND byers_other_data.bod_type = 3		 
WHERE byer_enquiry.be_business_id = ".$bsn_id;
$inforeqdata =$fwDb->query($sqlinforeq);

$sqlqa = "SELECT business_qa.* 
FROM business_qa WHERE business_qa.bqa_bsn_id = ".$bsn_id. " AND business_qa.bqa_status = 1";
$qadata =$fwDb->query($sqlqa);

/*DB($qadata);
*/



$dat['count']=0;
foreach($followdata as $k=> $v){$vdata[] = $v['soe_name'];}
if($vdata){
$chart_data = array_count_values($vdata);	}
$chart = new PieChart();
	
	$dataSet = new XYDataSet();
	if(is_array($chart_data))
	{
	foreach($chart_data as $k => $v)
		{
		if($v)
				{
			$dataSet->addPoint(new Point($k, $v));
				}
		}
}
	$chart->setDataSet($dataSet);

	$chart->setTitle("Enquiry Source Report");
	$chart->render(BASE_DIR."charts/chart.png");
$chart_url_old = BASE_DIR.'charts/chart.png';

$chart_url = BASE_DIR.'charts/chart.jpg';
$image = imagecreatefrompng($chart_url_old);
imagejpeg($image, $chart_url, 100);
imagedestroy($image);

$count = 0;
$signedcount = 0;
$follcount = 0;
$countinspections = 0;
$countmakeoffers = 0;
$countinforqslist = 0;
foreach($followupsdata as $fk => $fv)
					{
$follcount ++;
}
foreach($followdata  as $k => $v)
		{
		$followups ="";
		$inspections = "";
		$makeoffers = "";
		$inforqslist = "";
		$questionlist = "";

		if($v['bcust_gendec_signed_date'] == "0000-00-00"){$gendec_signed = "No";}else{$gendec_signed = "Yes"; $signedcount ++;}
		if($v['be_sed_date'] == "0000-00-00"){$ddate = "No ";}else{$ddate = "Yes ".date("d/m/Y", strtotime($v['be_sed_date'])) ." ".$v['be_sed_time'];}	
		if($v['be_status'] == 1){$dactive = "Active";}else{$dactive = "No longer active";}			
		if($followupsdata)
		{
		foreach($followupsdata as $fk => $fv)
					{
					if($v['be_id'] == $fv['bef_be_id'] && $v['be_customer_id'] == $fv['bef_cust_id'])
						{
						
						switch ($fv['bef_source'])
				{
				case 1:
				$how = "By Telephone";
				break;
				
				case 2:
				$how = "In Person";
				break;
				
				case 3:
				$how = "By Email";
				break;
				}
						
	$followups .= "
<tr><th class='fildsname' width='50%'>When:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$fv[bef_create_date] $fv[bef_cerate_time]</div></td></tr>
<tr><th class='fildsname'>Who:</th><td class='centerdiv_valu2'><div class='fildsvalue'> $fv[user_name]</div></td></tr>
<tr><th class='fildsname'>How:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$how</div></td></tr>
<tr><th class='fildsname'>Buyer Feedback:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$fv[bef_comments]</div></td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>&nbsp;</div></td></tr>
<tr><td colspan='2' width='100%' height='12'>&nbsp;</td></tr>";
					}
				
		}		
					
		}
		
	if($inspectiondata)
			{
					foreach($inspectiondata as $ik => $iv)
									{
						if($v['be_id'] == $iv['bod_be_id'] && $v['be_customer_id'] == $iv['bod_cust_id'])
							{				
					$inspections .= "
				<div class='fildsvalue'>$iv[bod_body]</div>";
				$countinspections ++;	
							}
										
						}	
						
					
						
			}
			
		if($makeofferdata)
			{		
		foreach($makeofferdata as $ik => $mv)
					{
						if($v['be_id'] == $mv['bod_be_id'] && $v['be_customer_id'] == $mv['bod_cust_id'])
							{				
					$makeoffers .= "
				<div class='fildsvalue'>$mv[bod_body]</div>";
				$countmakeoffers ++;		
							}
								
					}
			}
		if($inforeqdata)
			{			
			foreach($inforeqdata as $ik => $infoqv)
					{
		if($v['be_id'] == $infoqv['bod_be_id'] && $v['be_customer_id'] == $infoqv['bod_cust_id'])
							{				
								$inforqslist .= "<div class='fildsvalue'>$infoqv[bod_body]</div>";
								$countinforqslist ++;
							}			
					}
				}
				if(empty($followups))
					{
					$followups="<tr><td colspan='2' width='100%' height='12' >&nbsp;</td></tr>";
					}
			if($qadata)
				{	
			foreach($qadata as $qak => $qav)
					{
					if($v['be_customer_id'] == $qav['bqa_cust_id'])
						{
							$questionlist .="<div class='fildsvalue'>$qav[bqa_que]</div>"; 
						}
					}
				}
$name="";
$code="";
		switch($dbs)
			{
				case 1:
				$name = stripcslashes($v['bcust_fname']);
				$code = "";
				break;
				
				case 2:
				$name = "";
				$code = $v['bcust_code'];
				break;
				
				case 3:
				$name = stripcslashes($v['bcust_fname']);
				$code = $v['bcust_code'];
				break;
			}
		
			
	$listdata .= "
	<tr><td colspan='2' width='100%' ><div class='fildhead' align='center'>Enquiry Summary</div></td><td></td></tr>	
	<tr><th class='fildsname' width='50%'>Buyer Name: </th><th width='50%'>".$name."</th></tr>
<tr><th class='fildsname'>Buyer Code:</th><td class='fildsvalue'><div class='fildsvalue'>".$code."</div></td></tr>
<tr><th class='fildsname'>Initial Enquiry Date:</th><td class='fildsvalue'><div class='fildsvalue'>$v[be_created_date] $v[be_created_time]</div></td></tr>
<tr><th class='fildsname'>Enquiry Source:</th><td class='fildsvalue'><div class='fildsvalue'>$v[soe_name]</div></td></tr>
<tr><th class='fildsname'>Sign deed of confidentiality</th><td class='centerdiv'><div class='fildsvalue'>".$gendec_signed."</div></td></tr>
<tr><th class='fildsname'>Sent E-dossier:</th><td class='centerdiv'><div class='fildsvalue'>".$ddate."</div></td></tr>
<tr><th class='fildsname'>Active Buyer:</th><td class='centerdiv'><div class='fildsvalue'>".$dactive."</div></td></tr>
<tr><th class='fildsname'>Buyer story:</th><td class='centerdiv'><div class='fildsvalue'>TBC</div></td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>Follow Up Summary</div></td><td></td></tr>
".$followups."
<tr><td colspan='2' width='100%' ><div class='fildhead'>Outstanding Information Requests Summary</div></td></tr>
<tr><th width='50%' class='fildsname'>Question</th><td width='50%' >".$questionlist."</td></tr>
<tr><th width='50%' class='fildsname'>Document Request</th><td width='50%' >".$inforqslist."</td></tr>

<tr><td colspan='2' width='100%' ><div class='fildhead'>Other Actions Summary</div></td></tr>
<tr><th class='fildsname' width='50%'>Inspection:</th><td class='centerdiv_valu2'>".$inspections."</td></tr>
<tr><th width='50%' class='fildsname'>Offer to buy</th><td width='50%' >".$makeoffers."</td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>Agent Comment</div></td></tr>
<tr><th width='50%' class='fildsname'>".$agent."</th><td width='50%' >
<div class='fildsvalue'>Buyer has been called and emailed and he has not signed the deed of confidentiality.</div></td></tr>
<tr><td colspan='2' width='100%' ><hr></td><td><hr></td></tr>			
";	
$count++;	

$lastid = $v['be_customer_id'];
}
//$listdata .= "<tr><th colspan='2' width='100%'><hr /></td></tr>";
//$listdata .= "<tr><th colspan='2' align='right' style='padding-right:80px;' class='fildsname'>&nbsp;</th></tr>";

/*DB($listdata);
exit;*/
if($listdata)
{
$summerydata = "<tr><td colspan='2' width='100%' ><div class='fildhead'>Report Summary</div></td></tr>
<tr><th width='50%' class='fildsvalue'>Date this report was created:</th><td width='50%' ><div class='fildsvalue'>".date('d/m/Y')."</div></td></tr>
<tr><th width='50%' class='fildsvalue'>Report for:</th><td width='50%' ><div class='fildsvalue'>".$sellers_name."</div></td></tr>
<tr><th width='50%' class='fildsvalue'>Agent:</th><td width='50%' ><div class='fildsvalue'>".$agent."</div></td></tr>
<tr><th width='50%' class='fildsvalue'>Filter rules:</th><td width='50%' ><div class='fildsvalue'>--</div></td></tr>
<tr><th width='50%' class='fildsname'>Total Enquires:</th><td width='50%' ><div class='fildsvalue'>".$count."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Total Signed Deeds of Confidentiality:</div></td><td width='50%' ><div class='fildsvalue'>".$signedcount."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Total Buyer Inspections:</div></td><td width='50%' ><div class='fildsvalue'>".$countinspections."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Offers made:</div></td><td width='50%' ><div class='fildsvalue'>".$countmakeoffers."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Follow ups made:</div></td><td width='50%' ><div class='fildsvalue'>".$follcount."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Outstanding questions and document request:</div></td><td width='50%' ><div class='fildsvalue'>".$countinforqslist."</div></td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>Enquiry Source Summary</div></td><td></td></tr>
";
}else{
$summerydata = "<tr><th colspan='2' align='right' style='padding-right:0px;' class='fildsname'><div align='center'>Buyer enquiry Not found.</div></th></tr>";
}

$htmldata = "
<style>
table.first {
		color: #003300;
		font-family: helvetica;
		font-size: 8px;
		border-left: 3px solid red;
		border-right: 0px solid #FF00FF;
		border-top: 0px solid green;
		border-bottom: 3px solid blue;
		background-color: #ccffcc;
	}
	td {
		border: 0px solid blue;
		background-color: #ffffee;
		font-size: 24px;
		padding:5px;
	}
		th {
		border: 0px solid blue;
		background-color: #ffffee;
		font-size: 24px;
		padding:5px;
	}
</style>
<table width='100%' class='first'>
<tr> <td colspan='2' ><div align='center'> <img src='".$image_path."' width='300' height='300'></div></td><td></td></tr>
".$listdata."
".$summerydata."
</table>";

$filename = "Buyer_feedback_report.pdf";
	break;
	
	
	}

require_once(BASE_DIR.'tcpdf/config/lang/eng.php');
require_once(BASE_DIR.'tcpdf/tcpdf.php');

if($htmldata)
{
//if ( get_magic_quotes_gpc() )

   
    //$html = stripslashes($htmldata);
	$html = $htmldata;	

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Capital Commercial Business Sales');
$pdf->SetTitle('Buyer Feedback Report - ".$bus_name." - ".date("d/m/Y")."<br>Capital Commercial Business Sales');
$pdf->SetSubject('TCPDF Tutorial');
$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, "Buyer Feedback Report - ".$bus_name." - ".date("d/m/Y"), "Capital Commercial Business Sales");

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
$pdf->SetFont('helvetica', '', 14);

// add a page
$pdf->AddPage();

//set some language-dependent strings
$pdf->setLanguageArray($l);

// -------------------------------------------------------------------

// add a page
//$pdf->AddPage();

// set JPEG quality
$pdf->setJPEGQuality(75);

// Image method signature:
// Image($file, $x='', $y='', $w=0, $h=0, $type='', $link='', $align='', $resize=false, $dpi=300, $palign='', $ismask=false, $imgmask=false, $border=0, $fitbox=false, $hidden=false, $fitonpage=false)

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// Image example with resizing
$pdf->Image($image_path, 5, 10, 55, 53, '', 'http://www.tcpdf.org', '', true, 150, '', false, false, 1, false, false, false);
//$pdf->ImageSVG($file=$image_path, $x=30, $y=100, $w='', $h=100, $link='', $align='', $palign='', $border=0, $fitonpage=false);

// create some HTML content
//$html = '<h1>Example of HTML text flow</h1>';

// output the HTML content
$pdf->writeHTML($html, true, false, true, false, '');
//$pdf->writeHTML($html, true, 0, true, 0);

// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------

//Close and output PDF document


$pdf->Output('example_021.pdf', 'I');
exit;










 /* $dompdf = new DOMPDF();
  $dompdf->load_html($html);
  $dompdf->set_paper('c4', 'portrait');
  $dompdf->render();
  $dompdf->stream($filename, array("Attachment" => false));
  exit(0);*/
}
}