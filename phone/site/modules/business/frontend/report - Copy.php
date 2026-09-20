<?php 
$fwMainView = 'file:' . getcwd() . '/report.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', 0); 
$opt = $fwRequest->getParam('opt', '');
require_once(BASE_DIR."dompdf/dompdf_config.inc.php");

if($bsn_id)
	{
	$bus_sql = "SELECT business.bsn_id,business.bsn_name,business.bsn_cd_contact, business_file.* FROM business
	LEFT JOIN business_file ON business_file.bf_bsn_id = business.bsn_id AND business_file.bf_role = 1 WHERE business.bsn_id = ".$bsn_id ;	
	$busdata= $fwDb->queryOne($bus_sql);
	$agent = $_SESSION['user']['user_name'];
	$sellers_name = $busdata['bsn_cd_contact'];	
$bus_name = $busdata['bsn_name'];
$image_path = BASE_DIR."files/business_images/".$busdata['bf_name'];
}
switch ($opt)
	{
	
	case 2:
	require_once(BASE_DIR."libchart/classes/libchart.php");
	
 $sql = "Select byer_enquiry.be_id, byer_enquiry.be_customer_id, byer_enquiry.be_source_of_enquiry , byer_enquiry.be_created_date, byer_enquiry.be_created_time, byer_enquiry.be_sed_date, byer_enquiry.be_sed_time, byer_enquiry.be_request_info, byer_enquiry.be_business_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_gendec_signed_date, bus_customers.bcust_status, bus_customers.bcust_code, befollowups.*, enquirysource.*, users.user_id, users.user_name From byer_enquiry 
				LEFT Join befollowups On byer_enquiry.be_id = befollowups.bef_be_id	 
				LEFT Join users On users.user_id = befollowups.bef_done_user
				LEFT Join bus_customers On bus_customers.bcust_id = byer_enquiry.be_customer_id
				RIGHT Join enquirysource On byer_enquiry.be_source_of_enquiry = enquirysource.soe_id 	 	  
WHERE byer_enquiry.be_business_id = ".$bsn_id. " ORDER BY bus_customers.bcust_id ASC";

$followdata =$fwDb->query($sql);

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

/*DB($inspectiondata);
DB($makeofferdata);
DB($inforeqdata);
exit*/;



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
$chart_url = BASE_DIR.'charts/chart.png';



$count = 0;
$signedcount = 0;
$follcount = 0;


foreach($followdata  as $k => $v)
		{

		$follcount ++;
		if($v['be_customer_id'] == $lastid)
			{
			
			switch ($v['bef_source'])
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
	
			if(!empty($v['bef_create_date']))
			{
		$listdata .= "
<tr><th class='fildsname' width='50%'>When:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$v[bef_create_date] $v[bef_cerate_time]</div></td></tr>
<tr><th class='fildsname'>Who:</th><td class='centerdiv_valu2'> <div class='fildsvalue'>$agent</div></td></tr>
<tr><th class='fildsname'>How:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$how</div></td></tr>
<tr><th class='fildsname'>Buyer Feedback:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$v[bef_comments]</div></td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>&nbsp;</div></td></tr>	";
		}
	}
	else{
		
		
		if($k == 0)
		{

		if($v['bcust_gendec_signed_date'] == "0000-00-00"){$gendec_signed = "No";}else{$gendec_signed = "Yes"; $signedcount ++;}
		if($v['be_sed_date'] == "0000-00-00"){$ddate = "No ";}else{$ddate = "Yes ".date("d/m/Y", strtotime($v['be_sed_date'])) ." ".$v['be_sed_time'];}	
		if($v['bcust_status'] == 1){$dactive = "Active";}else{$dactive = "No longer active";}	
		
				switch ($v['bef_source'])
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
		
		$listdata .= "
		
	<tr><td colspan='2' width='100%' ><div class='fildhead'>Enquiry Summary</div></td></tr>	
	<tr><th class='fildsname' width='50%'>Buyer Name:</th><td class='fildsvalue' width='50%'><div class='fildsvalue'>".stripcslashes($v['bcust_fname'])."</div></td></tr>
<tr><th class='fildsname'>Buyer Code:</th><td class='fildsvalue'><div class='fildsvalue'>".$v['bcust_code']."</div></td></tr>
<tr><th class='fildsname'>Initial Enquiry Date:</th><td class='fildsvalue'><div class='fildsvalue'>$v[be_created_date] $v[be_created_time]</div></td></tr>
<tr><th class='fildsname'>Enquiry Source:</th><td class='fildsvalue'><div class='fildsvalue'>$v[soe_name]</div></td></tr>
<tr><th class='fildsname'>Sign deed of confidentiality</th><td class='centerdiv'><div class='fildsvalue'>".$gendec_signed."</div></td></tr>
<tr><th class='fildsname'>Sent E-dossier:</th><td class='centerdiv'><div class='fildsvalue'>".$ddate."</div></td></tr>
<tr><th class='fildsname'>Active Buyer:</th><td class='centerdiv'><div class='fildsvalue'>".$dactive."</div></td></tr>
<tr><th class='fildsname'>Buyer story:</th><td class='centerdiv'><div class='fildsvalue'>TBC</div></td></tr>
";
foreach($inspectiondata as $ke => $ve)
				{
				if($ve['bod_cust_id'] == $v['be_customer_id'])
					{
			
						$linsinne .=$ve['bod_body']."<br>";
					
					}
				}
	
				
				foreach($makeofferdata as $ke => $ve)
						{
						if($ve['bod_cust_id'] == $v['be_customer_id'])
							{
								$lmoinne .=$ve['bod_body']."<br>";
							
							}
						}
				foreach($inforeqdata as $ke => $ve)
						{
					if($ve['bod_cust_id'] == $v['be_customer_id'])
							{
								$linfoqinne .=$ve['bod_body']."<br>";
							
							}
						}
		//DB($linsinne );
		
				DB($v );
		//exit;
if(!empty($v['bef_create_date']))
			{
			$listdata .= "<tr><td colspan='2' width='100%' ><div class='fildhead'>Follow Up Summary</div></td></tr>	
<tr><th class='fildsname' width='50%'>When:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$v[bef_create_date] $v[bef_cerate_time]</div></td></tr>
<tr><th class='fildsname'>Who:</th><td class='centerdiv_valu2'><div class='fildsvalue'> $agent</div></td></tr>
<tr><th class='fildsname'>How:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$how</div></td></tr>
<tr><th class='fildsname'>Buyer Feedback:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$v[bef_comments]</div></td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>&nbsp;</div></td></tr>";
			}
		}else
		{
		if($v['bcust_gendec_signed_date'] == "0000-00-00"){$gendec_signed = "No";}else{$gendec_signed = "Yes"; $signedcount ++;}
		if($v['be_sed_date'] == "0000-00-00"){$ddate = "No ";}else{$ddate = "Yes ".date("d/m/Y", strtotime($v['be_sed_date'])) ." ".$v['be_sed_time'];}	
		if($v['bcust_status'] == 1){$dactive = "Active";}else{$dactive = "No longer active";}			
				switch ($v['bef_source'])
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
		
								
	$listdata .="<tr><td colspan='2' width='100%' ><div class='fildhead'>DharOutstanding Information Requests Summary</div></td></tr>
<tr><th width='50%' class='fildsname'>Document Request</th><td width='50%' ><div class='fildsvalue'>".$linfoqinne."</div></td></tr>

<tr><td colspan='2' width='100%' ><div class='fildhead'>Other Actions Summary</div></td></tr>
<tr><th width='50%' class='fildsname'>Inspection </th><td width='50%' ><div class='fildsvalue'>
".$linsinne."
</div></td></tr>
<tr><th width='50%' class='fildsname'>Offer to buy</th><td width='50%' ><div class='fildsvalue'>".$lmoinne."</div></td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>Agent Comment</div></td></tr>
<tr><th width='50%' class='fildsname'>".$agent."</th><td width='50%' >
<div class='fildsvalue'>Buyer has been called and emailed and he has not signed the deed of confidentiality.</div></td></tr>
<tr><td colspan='2' width='100%' ><hr></td></tr>";			
	$listdata .= "
	<tr><td colspan='2' width='100%' ><div >&nbsp;</div></td></tr>	
	<tr><td colspan='2' width='100%' ><div class='fildhead'>Enquiry Summary</div></td></tr>	
	<tr><th class='fildsname' width='50%'>Buyer Name:</th><td class='fildsvalue' width='50%'><div class='fildsvalue'>".stripcslashes($v['bcust_fname'])."</div></td></tr>
<tr><th class='fildsname'>Buyer Code:</th><td class='fildsvalue'><div class='fildsvalue'>".$v['bcust_code']."</div></td></tr>
<tr><th class='fildsname'>Initial Enquiry Date:</th><td class='fildsvalue'><div class='fildsvalue'>$v[be_created_date] $v[be_created_time]</div></td></tr>
<tr><th class='fildsname'>Enquiry Source:</th><td class='fildsvalue'><div class='fildsvalue'>$v[soe_name]</div></td></tr>
<tr><th class='fildsname'>Sign deed of confidentiality</th><td class='centerdiv'><div class='fildsvalue'>".$gendec_signed."</div></td></tr>
<tr><th class='fildsname'>Sent E-dossier:</th><td class='centerdiv'><div class='fildsvalue'>".$ddate."</div></td></tr>
<tr><th class='fildsname'>Active Buyer:</th><td class='centerdiv'><div class='fildsvalue'>".$dactive."</div></td></tr>
<tr><th class='fildsname'>Buyer story:</th><td class='centerdiv'><div class='fildsvalue'>TBC</div></td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>Follow Up Summary</div></td></tr>
";
	$linsinne = "";
				$lmoinne = "";
				$linfoqinne = "";

if(!empty($v['bef_create_date']))
			{
			$listdata .="
<tr><th class='fildsname' width='20%'>When:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$v[bef_create_date] $v[bef_cerate_time]</div></td></tr>
<tr><th class='fildsname'>Who:</th><td class='centerdiv_valu2'><div class='fildsvalue'> $agent</div></td></tr>
<tr><th class='fildsname'>How:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$how</div></td></tr>
<tr><th class='fildsname'>Buyer Feedback:</th><td class='centerdiv_valu2'><div class='fildsvalue'>$v[bef_comments]</div></td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>&nbsp;</div></td></tr>";
			}
}
	
$count++;	
	
	}
	
	
	
	
	
$lastid = $v['be_customer_id'];
}
//$listdata .= "<tr><th colspan='2' width='100%'><hr /></td></tr>";
$listdata .= "<tr><th colspan='2' align='right' style='padding-right:80px;' class='fildsname'>&nbsp;</th></tr>";



$htmldata = "
<html>
<head>
<style>
body { margin:0; font-family:Geneva, Arial, Helvetica, sans-serif; font-size:12px; color:#606060; }
#list-table {
    border:1px solid #999999;    
    border-collapse:collapse; 
	padding:0px;
}

#list-table th {
    border:1px solid #999999;    
    border-collapse:collapse;
    text-align:left;
	font-size:13px;	
	padding-left:5px;
	padding-right:0px;
}

#list-table td {
    border:1px solid #999999;
    border-collapse:collapse;
	font-weight:normal;
    text-align:left;
	font-size:11px;
	padding-left:0px;
	padding-right:0px;
	padding-top:0px;
	padding-bottom:0px;
}



.headdiv{ font-size:18px; color:#000000; text-align:center; font-weight:bold; background-color:#999999; height:50px; font-family:Geneva, Arial, Helvetica, sans-serif; padding-top:5px;}
.fildhead{ font-size:15px; color:#000000; text-align:center; font-weight:bold; background-color:#999999;}
.bnamediv{ font-size:25px; color:#000000; text-align:left; vertical-align:baseline; padding-top:100px; font-weight:bold;}
.fildsname{ font-size:12px; text-align:right; color:#000000; padding-right:10px; padding-top:2px; padding-bottom:2px; font-weight:bold;}
.fildsvalue{ font-size:13px; text-align:left; color:#000000; padding-left:10px; padding-top:5px; padding-bottom:5px;}
.centerdiv{ font-size:18px; text-align:center; color:#000000; padding-left:40px; padding-top:5px; padding-bottom:5px; font-weight:bold;}
.centerdiv_valu{ font-size:18px; text-align:center; color:#000000; padding-left:40px; padding-top:5px; padding-bottom:5px;}
.centerdiv_valu2{ font-size:18px; text-align:right; color:#000000; padding-left:40px; padding-top:5px; padding-bottom:5px;}
</style>
</head>

<body>
<table width='100%' id='list-table'>
<tr> <td colspan='2' width='100%' align='center'><div class='headdiv'> Buyer Feedback Report - ".$bus_name." - ".date('d/m/Y')."<br>Capital Commercial Business Sales	</div> </td></tr>
<tr> <td colspan='2' ><div align='center' style='padding-top:20px; padding-bottom:10px;'> <img src='".$image_path."' width='300' height='300'></div></td></tr>

".$listdata."

<tr><td colspan='2' width='100%' ><div class='fildhead'>Report Summary</div></td></tr>
<tr><th width='50%' class='fildsvalue'>Date this report was created:</th><td width='50%' ><div class='fildsvalue'>".date('d/m/Y')."</div></td></tr>
<tr><th width='50%' class='fildsvalue'>Report for:</th><td width='50%' ><div class='fildsvalue'>".$sellers_name."</div></td></tr>
<tr><th width='50%' class='fildsvalue'>Agent:</th><td width='50%' ><div class='fildsvalue'>".$agent."</div></td></tr>
<tr><th width='50%' class='fildsvalue'>Filter rules:</th><td width='50%' ><div class='fildsvalue'>--</div></td></tr>
<tr><th width='50%' class='fildsname'>Total Enquires:</th><td width='50%' ><div class='fildsvalue'>".$count."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Total Signed Deeds of Confidentiality:</div></td><td width='50%' ><div class='fildsvalue'>".$signedcount."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Total Buyer Inspections:</div></td><td width='50%' ><div class='fildsvalue'>".$tbicount."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Offers made:</div></td><td width='50%' ><div class='fildsvalue'>".$omcount."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Follow ups made:</div></td><td width='50%' ><div class='fildsvalue'>".$follcount."</div></td></tr>
<tr><td width='50%' ><div class='fildsvalue'>Outstanding questions and document request:</div></td><td width='50%' ><div class='fildsvalue'>".$oqdrcount."</div></td></tr>
<tr><td colspan='2' width='100%' ><div class='fildhead'>Enquiry Source Summary</div></td></tr>
<tr> <th colspan='2'><div align='center' style='padding-top:0px;'> <img src='".$chart_url."'></div></th></tr>
</table>
</body>
</html>
	";
$filename = "Buyer_feedback_report.pdf";
	break;
	
	case 3:
	
	
	break;
	
	case 4:
	$sql = "Select business_tasks.*, busness_status.*, busness_status_task.*, users.user_name From business_tasks 
	LEFT Join busness_status ON busness_status.st_id = business_tasks.bt_task_status_id	
	LEFT Join busness_status_task ON business_tasks.bt_task_id = busness_status_task.bst_id		  
	LEFT Join users ON business_tasks.bt_completed_by = users.user_id		  
WHERE business_tasks.bt_bsn_id = ".$bsn_id;
 
$all_taskdata =$fwDb->query($sql);
$listdata .= "
<tr><th class='fildsname' width='10' ><b>Seq</b></th>
<td class='centerdiv' width='180' align='center'><b>Task Name</b></td>
<td class='centerdiv' width='180' align='center'><strong>Instructions\Explanation</strong></td>
<td class='centerdiv' width='130' align='center'><strong>Date Completed</strong></td>
<td class='centerdiv' width='100' align='center'><strong>Completed By</strong></td>
<td class='centerdiv' width='200' align='center'><strong>Comment</strong></td></tr>";

foreach($all_taskdata as $k=>$v)
		{
$listdata .= "

<tr><td class='centerdiv_valu2' width='10'>&nbsp;0</td>
<td class='centerdiv_valu2' width='180'>$v[bst_task_name]</td>
<td class='centerdiv_valu2' width='180'>$v[bst_instruction]</td>
<td class='centerdiv_valu2' width='130'><div>$v[bt_completed_date] </div></td>
<td class='centerdiv_valu2' width='100'>$v[user_name]</td>
<td class='centerdiv_valu2' width='200'>$v[bt_comment]&nbsp;</td></tr>";
	}


$htmldata = "
<html>
<head>
<style>
</style>
</head>
<body>
<table cellpadding='0' cellspacing='0' border='1'>
<tr> <td colspan='6' align='center'><div class='headdiv'> <h1>Business: $bus_name - All Tasks</h1></div> </td></tr>

".$listdata."

</table>
</body>
</html>
	";
$filename = "All_tasks.pdf";
	break;
	
	case 5:
	
		$sql = "Select business_tasks.*, busness_status.*, busness_status_task.*, users.user_name From business_tasks 
	LEFT Join busness_status ON busness_status.st_id = business_tasks.bt_task_status_id	
	LEFT Join busness_status_task ON business_tasks.bt_task_id = busness_status_task.bst_id		  
	LEFT Join users ON business_tasks.bt_completed_by = users.user_id		  
WHERE business_tasks.bt_bsn_id = ".$bsn_id ." AND business_tasks.bt_complete = 0";
 
$all_taskdata =$fwDb->query($sql);
$listdata .= "
<tr><th class='fildsname' width='10' ><b>Seq</b></th>
<td class='centerdiv' width='180' align='center'><b>Task Name</b></td>
<td class='centerdiv' width='180' align='center'><strong>Instructions\Explanation</strong></td>
<td class='centerdiv' width='130' align='center'><strong>Date Completed</strong></td>
<td class='centerdiv' width='100' align='center'><strong>Completed By</strong></td>
<td class='centerdiv' width='200' align='center'><strong>Comment</strong></td></tr>";

foreach($all_taskdata as $k=>$v)
		{
$listdata .= "

<tr><td class='centerdiv_valu2' width='10'>&nbsp;0</td>
<td class='centerdiv_valu2' width='180' ><div style='color: #FF0000;'>$v[bst_task_name]</div></td>
<td class='centerdiv_valu2' width='180'>$v[bst_instruction]</td>
<td class='centerdiv_valu2' width='130'><div>$v[bt_completed_date] </div></td>
<td class='centerdiv_valu2' width='100'>$v[user_name]</td>
<td class='centerdiv_valu2' width='200'>$v[bt_comment]&nbsp;</td></tr>";
	}


$htmldata = "
<html>
<head>
<style>
</style>
</head>
<body>
<table cellpadding='0' cellspacing='0' border='1'>
<tr> <td colspan='6' align='center'><div class='headdiv'> <h1>Business: $bus_name - Incomplete Tasks</h1></div> </td></tr>

".$listdata."

</table>
</body>
</html>
	";
$filename = "Incomplete_tasks.pdf";
	break;
	
	case 6:
	
		$sql = "Select business_tasks.*, busness_status.*, busness_status_task.*, users.user_name From business_tasks 
	LEFT Join busness_status ON busness_status.st_id = business_tasks.bt_task_status_id	
	LEFT Join busness_status_task ON business_tasks.bt_task_id = busness_status_task.bst_id		  
	LEFT Join users ON business_tasks.bt_completed_by = users.user_id		  
WHERE business_tasks.bt_bsn_id = ".$bsn_id ." AND business_tasks.bt_complete = 1";
 
$all_taskdata =$fwDb->query($sql);
$listdata .= "
<tr><th class='fildsname' width='10' ><b>Seq</b></th>
<td class='centerdiv' width='180' align='center'><b>Task Name</b></td>
<td class='centerdiv' width='180' align='center'><strong>Instructions\Explanation</strong></td>
<td class='centerdiv' width='130' align='center'><strong>Date Completed</strong></td>
<td class='centerdiv' width='100' align='center'><strong>Completed By</strong></td>
<td class='centerdiv' width='200' align='center'><strong>Comment</strong></td></tr>";

foreach($all_taskdata as $k=>$v)
		{
$listdata .= "

<tr><td class='centerdiv_valu2' width='10'>&nbsp;0</td>
<td class='centerdiv_valu2' width='180'>$v[bst_task_name]</td>
<td class='centerdiv_valu2' width='180'>$v[bst_instruction]</td>
<td class='centerdiv_valu2' width='130'><div>$v[bt_completed_date] </div></td>
<td class='centerdiv_valu2' width='100'>$v[user_name]</td>
<td class='centerdiv_valu2' width='200'>$v[bt_comment]&nbsp;</td></tr>";
	}


$htmldata = "
<html>
<head>
<style>
</style>
</head>
<body>
<table cellpadding='0' cellspacing='0' border='1'>
<tr> <td colspan='6' align='center'><div class='headdiv'> <h1>Business: $bus_name - Complete Tasks</h1></div> </td></tr>
".$listdata."
</table>
</body>
</html>";
$filename = "Complete_tasks.pdf";	
	break;
	}
DB($htmldata);
exit;	
if($htmldata)
{
if ( get_magic_quotes_gpc() )
    $html = stripslashes($htmldata);
  $dompdf = new DOMPDF();
  $dompdf->load_html($htmldata);
  $dompdf->set_paper('c4', 'portrait ');
  $dompdf->render();
  $dompdf->stream($filename, array("Attachment" => false));
  exit(0);
}
