<?php
$fwMainView = 'file:' . getcwd() . '/report.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', 0); 
$fwViewData['opt'] = $fwRequest->getParam('opt', '');
unset($_SESSION['attach']);
$submit = $fwRequest->getParam('submit', '');

$submit_email = $fwRequest->getParam('submit_email', '');
$submit_edit_email = $fwRequest->getParam('submit_edit_email', '');
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

$option = $fwRequest->getParam('option', '');
$osti = $fwRequest->getParam('osti', '');


$fwViewData['report_type'] = $option;
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

//$image_path = BASE_DIR."files/business_images/Form.jpg";
}
if($option)
{
switch ($option)
	{
	
	case 2:
	$dbs = $fwRequest->getParam('dbs', '');
	$buyerstatus = $fwRequest->getParam('buyerstatus', '');
	$reportuses = $fwRequest->getParam('reportuse', 0);
	require_once(BASE_DIR."libchart/classes/libchart.php");
	if($busdata['bf_name'])
	{
	$image_path = BASE_DIR.FILE_PATH."files/business_images/".$busdata['bf_name'];
	}
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
WHERE byer_enquiry.be_business_id = ".$bsn_id. " AND ".$status." ORDER BY bus_customers.bcust_id ASC";
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
$newinspectiondata = count($inspectiondata);

$sqlmakeoffer = "SELECT byer_enquiry.be_id, byers_other_data.*									
FROM byer_enquiry 
RIGHT JOIN byers_other_data  ON byer_enquiry.be_id = byers_other_data.bod_be_id AND byers_other_data.bod_type = 2
WHERE byer_enquiry.be_business_id = ".$bsn_id;
$makeofferdata =$fwDb->query($sqlmakeoffer);

$newmakeofferdata = count($makeofferdata);
$sqlinforeq = "SELECT byer_enquiry.be_id, byers_other_data.* 
FROM byer_enquiry 
RIGHT JOIN byers_other_data ON byer_enquiry.be_id = byers_other_data.bod_be_id AND byers_other_data.bod_type = 3		 
WHERE byer_enquiry.be_business_id = ".$bsn_id;
$inforeqdata =$fwDb->query($sqlinforeq);

$sqlqa = "SELECT business_qa.* 
FROM business_qa WHERE business_qa.bqa_bsn_id = ".$bsn_id. " AND business_qa.bqa_status = 1";
$qadata =$fwDb->query($sqlqa);

$all_enq_sql = "Select byer_enquiry.be_id, byer_enquiry.be_customer_id, byer_enquiry.be_source_of_enquiry , byer_enquiry.be_created_date, byer_enquiry.be_created_time, byer_enquiry.be_sed_date, byer_enquiry.be_sed_time, byer_enquiry.be_request_info, byer_enquiry.be_business_id, byer_enquiry.be_status, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_gendec_signed_date, bus_customers.bcust_status, bus_customers.bcust_code, enquirysource.* From byer_enquiry
				LEFT Join bus_customers On bus_customers.bcust_id = byer_enquiry.be_customer_id
				RIGHT Join enquirysource On byer_enquiry.be_source_of_enquiry = enquirysource.soe_id 	 	  
WHERE byer_enquiry.be_business_id = ".$bsn_id;
$all_enquiries =$fwDb->query($all_enq_sql);
//$all_enquiries = count($all_enquiries);

$dat['count']=0;
foreach($all_enquiries as $k=> $v){$vdata[] = $v['soe_name'];}
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

$count = 0;
$signedcount = 0;
$follcount = 0;
$countinspections = 0;
$countmakeoffers = 0;
$countinforqslist = 0;
$sndcount = 0;

$follcount = count($followupsdata);
/*foreach($followupsdata as $fk => $fv)
					{
$follcount ++;
}
*/foreach($followdata  as $k => $v)
		{
		$followups ="";
		$inspections = "";
		$makeoffers = "";
		$inforqslist = "";
		$questionlist = "";

		if($v['bcust_gendec_signed_date'] == "0000-00-00"){$gendec_signed = "No";}else{$gendec_signed = "Yes"; $signedcount ++;}
		if($v['be_sed_date'] == "0000-00-00"){$ddate = "No ";}else{$ddate = "Yes ".date("d/m/Y", strtotime($v['be_sed_date'])) ." ".$v['be_sed_time']; $sndcount++;}	
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
<tr><th class='fildsname'>Buyer feedback:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$fv[bef_comments]</div></td></tr>
<tr><td colspan='2' width='100%' height='12'>&nbsp;</td><td></td></tr>";
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
$be_id = $v['be_id'];

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
				
				case 4:
				$name = stripcslashes($v['bcust_fname'])." ".stripcslashes($v['bcust_lname']);
				$code = $v['bcust_code'];
				break;
			}
			if($name && $reportuses > 0){ $name = '<a href="'.BASE_URL.'business.detail/bsn_id/'.$bsn_id.'/be_id/'.$be_id.'" target="_blank">'.$name.'</a>';}
			//if($name){ $name = '<a href="javascript:alert("ok")" title="test">'.$name.'</a>';}

		if($osti == 2)
			{
			$outstandingtaskdata = "<tr><td colspan='2' width='100%' ><div class='fildhead'><span>Outstanding Information Requests Summary</span></div></td></tr>
	<tr><th width='50%' class='fildsname'>Question</th><td width='50%' >".$questionlist."</td></tr>
	<tr><th width='50%' class='fildsname'>Document Request</th><td width='50%' >".$inforqslist."</td></tr>";
			}
			
	$listdata []= '
	<tr><td colspan="2" width="100%" ><div class="fildhead"><b>Enquiry Summary</b></div></td></tr>	
	<tr><th class="fildsname" width="50%">Buyer name:</th><td class="fildsvalue" width="50%"><div class="fildsvalue">'.$name.'</div></td></tr>
<tr><th class="fildsname">Buyer code:</th><td class="fildsvalue"><div class="fildsvalue">'.$code.'</div></td></tr>
<tr><th class="fildsname">Initial enquiry date:</th><td class="fildsvalue"><div class="fildsvalue">'.$v['be_created_date'].' '.$v['be_created_time'].'</div></td></tr>
<tr><th class="fildsname">Enquiry source:</th><td class="fildsvalue"><div class="fildsvalue">'.$v['soe_name'].'</div></td></tr>
<tr><th class="fildsname">Signed Deed of Confidentiality:</th><td class="centerdiv"><div class="fildsvalue">'.$gendec_signed.'</div></td></tr>
<tr><th class="fildsname">Sent e-dossier:</th><td class="centerdiv"><div class="fildsvalue">'.$ddate.'</div></td></tr>
<tr><th class="fildsname">Active buyer:</th><td class="centerdiv"><div class="fildsvalue">'.$dactive.'</div></td></tr>
<tr><th class="fildsname">Buyer story:</th><td class="centerdiv"><div class="fildsvalue">TBC</div></td></tr>
<tr><td colspan="2" width="100%" ><div class="fildhead"><strong>Follow up summary</strong></div></td></tr>
'.$followups.'
'.$outstandingtaskdata.'
<tr><td colspan="2" width="100%" ><div class="fildhead"><span>Other Actions Summary</span></div></td></tr>
<tr><th class="fildsname" width="50%">Inspection:</th><td class="centerdiv_valu2">'.$inspections.'</td></tr>';	
$count++;	
unset($outstandingtaskdata);
$lastid = $v['be_customer_id'];
}


$activecount = 0;

	$sql_sub = "Select byer_enquiry.be_id From byer_enquiry WHERE byer_enquiry.be_business_id = ".$bsn_id;
$all_buyers =$fwDb->query($sql_sub);
$allcount = count($all_buyers);

	$sql_sub_active_buyers = "Select byer_enquiry.be_id From byer_enquiry WHERE byer_enquiry.be_business_id = ".$bsn_id." AND byer_enquiry.be_status=1";
$active_buyers =$fwDb->query($sql_sub_active_buyers);
$activecount = count($active_buyers);

$inactivecount = $allcount - $activecount;

$sql_alll = "Select byer_enquiry.be_id, byer_enquiry.be_sed_date, byer_enquiry.be_customer_id, bus_customers.bcust_id, bus_customers.bcust_gendec_signed_date From byer_enquiry
LEFT JOIN bus_customers ON bus_customers.bcust_id = byer_enquiry.be_customer_id WHERE byer_enquiry.be_business_id = ".$bsn_id;
$all_buyers =$fwDb->query($sql_alll);

$bgsdcount = 0;
$sendosirecount = 0;
foreach($all_buyers as $k => $v){if($v['bcust_gendec_signed_date'] != '0000-00-00'){$bgsdcount++;}
				if($v['be_sed_date'] != '0000-00-00'){$sendosirecount++;}}

if($listdata)
{
$newsummerydata = '<tr><td colspan="2" width="100%"><div align="center"><b>Report Summary</b></div></td></tr>
<tr><th width="50%" class="fildsvalue"><span>Date this report was created:</span></th><td width="50%" ><div class="fildsvalue">'.date("d/m/Y").'</div></td></tr>
<tr><th width="50%" class="fildsvalue"><span>Business  name:</span></th><td width="50%" ><div class="fildsvalue">'.$bus_name.'</div></td></tr>
<tr><th width="50%" class="fildsvalue"><span>Total number of buyer enquiries:</span></th><td width="50%" ><div class="fildsvalue">'.$allcount.'</div></td></tr>
<tr><th width="50%" class="fildsvalue"><span>Total number buyers that have signed the Deed:</span></th><td width="50%" ><div class="fildsvalue">'.$bgsdcount.'</div></td></tr>
<tr><th width="50%" class="fildsname"><span>Total number of active-interest buyers:</span></th><td width="50%" ><div class="fildsvalue">'.$activecount.'</div></td></tr>
<tr><th width="50%" class="fildsname"><span>Total number if inactive-interest buyers:</span></th><td width="50%" ><div class="fildsvalue">'.$inactivecount.'</div></td></tr>
<tr><td width="50%" ><div class="fildsvalue"><span>Total number of dossiers sent:</span></div></td><td width="50%" ><div class="fildsvalue">'.$sendosirecount.'</div></td></tr>
<tr><td width="50%" ><div class="fildsvalue"><span>Total number of follow-ups undertaken:</span></div></td><td width="50%" ><div class="fildsvalue">'.$follcount.'</div></td></tr>
<tr><td width="50%" ><div class="fildsvalue"><span>Total number of offers:</span></div></td><td width="50%" ><div class="fildsvalue">'.$newmakeofferdata.'</div></td></tr>
<tr><td width="50%" ><div class="fildsvalue"><span>Total Number of Inspections:</span></div></td><td width="50%" ><div class="fildsvalue">'.$newinspectiondata.'</div></td></tr>';
}else{
$summerydata = '<tr><th colspan="2" align="right" style="padding-right:0px;" class="fildsname"><div align="center">Buyer enquiry Not found.</div></th><td></td></tr>';
}


//$trdata = explode("|", $listdata);
$counter = 0;


if($listdata)
   {
	foreach($listdata as $k => $v)
			{
				
				$combtr .= $v;
				
				if($counter <= 15)
					{
						$trcmb[] = $combtr;
						
						unset($combtr);
						$counter = 0;
					}
			$counter++;
			}
	$trcmb[] = $combtr;		
	}
$filename = "Buyer_feedback_report.pdf";
$headtext = "Buyer Feedback Report - ".$bus_name." - ".date("d/m/Y");

	break;
	case 3:
	
	break;
	case 4:
	$sql = "Select business_tasks.*, busness_status.*, project_types_task.*, busness_status_task.*, users.user_name From business_tasks 
	LEFT Join busness_status ON busness_status.st_id = business_tasks.bt_task_status_id	
	LEFT Join project_types_task ON business_tasks.bt_task_id = project_types_task.bst_id
	LEFT Join busness_status_task ON business_tasks.bt_task_id = busness_status_task.bst_id	
			  
	LEFT Join users ON business_tasks.bt_completed_by = users.user_id		  
WHERE business_tasks.bt_bsn_id = ".$bsn_id." ORDER BY busness_status_task.bst_order ASC";
 
$all_taskdata =$fwDb->query($sql);

$listdata[]= '
<tr><td class="fildsname" width="50" ><b>Seq</b></td>
<td width="220" align="center"><b>Task Name</b></td>
<td width="220" align="center"><strong>Instructions\Explanation</strong></td>
<td width="130" align="center"><strong>Date Completed</strong></td>
<td width="100" align="center"><strong>Completed By</strong></td>
<td width="200" align="center"><strong>Comment</strong></td></tr>';

foreach($all_taskdata as $k=>$v)
		{
		if($v['bt_completed_date'] !== '0000-00-00 00:00:00')
			{$compledate = $v['bt_completed_date'];}else
			{$compledate ="";}
$listdata[]='
<tr><td>'.$v['bst_order'].'</td>
<td>'.$v['bst_task_name'].'</td>
<td >'.$v['bst_instruction'].'</td>
<td ><div>'.r_date($compledate).'</div></td>
<td >'.$v['user_name'].'</td>
<td >'.$v['bt_comment'].'&nbsp;</td></tr>';
	}
$counter =0;
if($listdata)
   {
	foreach($listdata as $k => $v)
			{
				$combtr .= $v;
				
				if($counter > 15)
					{
						$trcmb[] = $combtr;
						
						unset($combtr);
						$counter = 0;
					}
			$counter++;
			}
	$trcmb[] = $combtr;		
	}

$PDF_PAGE_ORIENTATION = "L";	
$filename = "All_tasks.pdf";
$headtext = "All tasks Report - ".$bus_name." - ".date("d/m/Y");
	break;
	case 5:
	$sql = "Select business_tasks.*, busness_status.*, busness_status_task.*, project_types_task.*, users.user_name From business_tasks 
	LEFT Join busness_status ON busness_status.st_id = business_tasks.bt_task_status_id	
	LEFT Join busness_status_task ON business_tasks.bt_task_id = busness_status_task.bst_id	
	LEFT Join project_types_task ON business_tasks.bt_task_id = project_types_task.bst_id	  
	LEFT Join users ON business_tasks.bt_completed_by = users.user_id		  
WHERE business_tasks.bt_bsn_id = ".$bsn_id." AND  business_tasks.bt_complete = 0 ORDER BY busness_status_task.bst_order ASC";
 
$all_taskdata =$fwDb->query($sql);

$listdata[]= '
<tr><td class="fildsname" width="50" ><b>Seq</b></td>
<td width="220" align="center"><b>Task Name</b></td>
<td width="220" align="center"><strong>Instructions\Explanation</strong></td>
<td width="130" align="center"><strong>Date Completed</strong></td>
<td width="100" align="center"><strong>Completed By</strong></td>
<td width="200" align="center"><strong>Comment</strong></td></tr>';

foreach($all_taskdata as $k=>$v)
		{
		if($v['bt_completed_date'] !== '0000-00-00 00:00:00')
			{$compledate = $v['bt_completed_date'];}else
			{$compledate ="";}
$listdata[]='
<tr><td>'.$v['bst_order'].'</td>
<td>'.$v['bst_task_name'].'</td>
<td >'.$v['bst_instruction'].'</td>
<td ><div>'.r_date($compledate).'</div></td>
<td >'.$v['user_name'].'</td>
<td >'.$v['bt_comment'].'&nbsp;</td></tr>';
	}
$counter =0;
if($listdata)
   {
	foreach($listdata as $k => $v)
			{
				$combtr .= $v;
				
				if($counter > 15)
					{
						$trcmb[] = $combtr;
						
						unset($combtr);
						$counter = 0;
					}
			$counter++;
			}
	$trcmb[] = $combtr;		
	}

$PDF_PAGE_ORIENTATION = "L";	
$filename = "Uncompleted_tasks.pdf";
$headtext = "Uncompleted tasks report - ".$bus_name." - ".date("d/m/Y");
	break;
	case 6:
	$sql = "Select business_tasks.*, busness_status.*, busness_status_task.*, project_types_task.*, users.user_name From business_tasks 
	LEFT Join busness_status ON busness_status.st_id = business_tasks.bt_task_status_id	
	LEFT Join busness_status_task ON business_tasks.bt_task_id = busness_status_task.bst_id	
	LEFT Join project_types_task ON business_tasks.bt_task_id = project_types_task.bst_id	  
	LEFT Join users ON business_tasks.bt_completed_by = users.user_id		  
WHERE business_tasks.bt_bsn_id = ".$bsn_id." AND  business_tasks.bt_complete = 1 ORDER BY busness_status_task.bst_order ASC";
 
$all_taskdata =$fwDb->query($sql);
if($all_taskdata)
{
$listdata[]= '
<tr><td class="fildsname" width="50" ><b>Seq</b></td>
<td width="220" align="center"><b>Task Name</b></td>
<td width="220" align="center"><strong>Instructions\Explanation</strong></td>
<td width="130" align="center"><strong>Date Completed</strong></td>
<td width="100" align="center"><strong>Completed By</strong></td>
<td width="200" align="center"><strong>Comment</strong></td></tr>';

foreach($all_taskdata as $k=>$v)
		{
		if($v['bt_completed_date'] !== '0000-00-00 00:00:00')
			{$compledate = $v['bt_completed_date'];}else
			{$compledate ="";}
$listdata[]='
<tr><td>'.$v['bst_order'].'</td>
<td>'.$v['bst_task_name'].'</td>
<td >'.$v['bst_instruction'].'</td>
<td ><div>'.r_date($compledate).'</div></td>
<td >'.$v['user_name'].'</td>
<td >'.$v['bt_comment'].'&nbsp;</td></tr>';
	}
	
}	
$counter =0;
if($listdata)
   {
	foreach($listdata as $k => $v)
			{
				$combtr .= $v;
				
				if($counter > 15)
					{
						$trcmb[] = $combtr;
						
						unset($combtr);
						$counter = 0;
					}
			$counter++;
			}
	$trcmb[] = $combtr;		
	}

$PDF_PAGE_ORIENTATION = "L";	
$filename = "Completed_tasks.pdf";
$headtext = "Completed tasks report - ".$bus_name." - ".date("d/m/Y");
	break;
	}


// create new PDF document
$pdf = new MYPDF($PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(SET_PDF_AUTHOR);
$pdf->SetTitle('Buyer Feedback Report - ".$bus_name." - ".date("d/m/Y")."<br>'.SET_PDF_AUTHOR);
$pdf->SetSubject('Buyer Feedback Report');
$pdf->SetKeywords('BES, PDF');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_BES_LOGO, PDF_HEADER_LOGO_WIDTH, $headtext, SET_PDF_AUTHOR);

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
if($image_path)
{
$pdf->Image($image_path, 60, 22, 87, 65, '', '', '', true, 100);
}
// output the HTML content
//$pdf->writeHTML($html, true, false, true, false, '');

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
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
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




if($trcmb)
	{
foreach($trcmb as $ke => $vl)
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
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
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
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }
	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.second {
        border: 2px dashed green;
    }

</style>
<table class="first" cellpadding="4" cellspacing="2">$summerydata</table>
<div><img src="$chart_url_old"></div>
EOF;
if($chart_url_old)
{
$summery_chart = <<<EOF
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
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
    }

	 th {
        border: 0px solid #fff;
        background-color: #ffffee;
    }
    td.second {
        border: 2px dashed green;
    }

</style>
<table class="first" cellpadding="4" cellspacing="2">$newsummerydata</table>
<div><img src="$chart_url_old"></div>
EOF;
}

if($image_path)
{
// output the HTML content
$pdf->writeHTML($header, true, false, true, false, '');
}


if($listdata_tr)
{
if($summery_chart)
{
$pdf->writeHTML($summery_chart, true, false, true, false, '');
}

foreach($listdata_tr as $key => $vbody)
		{
		
		if($vbody)
			{
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
	  td a{ color: #003300;
      
    }
	td a:hover{ color: #003300;
		  text-decoration: none;
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

if($submit)
	{
		//Close and output PDF document
		//$pdf->Output($filename, 'I');
		
		$filename = date('His')."_".strtolower($filename);
		$filenamepath = BASE_DIR."reports/".$filename;
		$openfilenamepath = BASE_URL."reports/".$filename;
		$pdf->Output($filenamepath , 'F');
		Location($openfilenamepath);
		exit;
	}elseif($submit_email)
	{
		//Close and output PDF document
$filename = date('His')."_".strtolower($filename);
$filenamepath = BASE_DIR."reports/".$filename;
$pdf->Output($filenamepath , 'F');

	$emailsend = send_auto_business_report($bsn_id, $filename);
	
	if($emailsend)	
		  {
		  $fwViewData['send_msg'] ="Report has generated & sent successfully.";
		  }		
	else	
		  {
		  $fwViewData['send_msg'] = "Error while sending report.";
		  }	
	}elseif($submit_edit_email)
		{
			//Close and output PDF document
$filename = date('His')."_".strtolower($filename);
$filenamepath = BASE_DIR."reports/".$filename;
$pdf->Output($filenamepath , 'F');

		//Close and output PDF document
$filename = date('Hi').$filename;
$filenamepath = BASE_DIR."reports/".$filename;
$pdf->Output($filenamepath , 'F');
$_SESSION['attach']['file_name'] = $filename;

Location(BASE_URL . $XFA['buyer_report_email']."/bsn_id/".$bsn_id);
exit;
	}
		
}

	switch($fwViewData['opt'])
		{
		case 2:
		$fwViewData['title'] ="Buyer feedback report"; 
		break;
		case 3:
		$fwViewData['title'] ="Buyer matches report"; 
		break;
		case 4:
		$fwViewData['title'] ="All tasks report report"; 
		break;
		case 5:
		$fwViewData['title'] ="Uncompleted tasks report report"; 
		break;
		case 6:
		$fwViewData['title'] ="Completed tasks report report"; 
		break;
		}		