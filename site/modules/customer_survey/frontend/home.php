<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebs = new Fw_Db_Table('business_sellers');
$fwViewData['ran'] =  rand(100000,999999);
$search = $fwRequest->getParam('search', '');

$save_survey = $fwRequest->getParam('save_survey', '');
if($save_survey) 
{ 
		
		if($_FILES['survey']['name'])
		{

			$bs_business_id = $fwRequest->getParam('bs_business_id', '');
			$doc1 = $_FILES['survey']['name'];
			$file_type = $_FILES['survey']['type'];	
							
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
			$src =  $_FILES['survey']['tmp_name']; 
			
			upload($doc1, $src);
			$surveyData['bs_cs_survey'] = $doc1;
			
//			$destination = BASE_DIR.'files/uploads/'.$doc1;
//		
//			if(!move_uploaded_file($src, $destination))
//				{
//					//echo "Possible file upload attack";
//				}
//			else
//				{
//				
//					$surveyData['bs_cs_survey'] = $doc1;
//					chmod($destination, 0664);
//				}
				
				$tablebs->setWhere('bs_business_id = '.$bs_business_id);
				if($tablebs->rowExists())
				{
				
					$detail = $tablebs->updateRow($surveyData);	
				}		
		}	
}

$upload_letter = $fwRequest->getParam('upload_letter', '');
if($upload_letter) 
{ 
		if($_FILES['letter']['name'])
		{

			$docfile_11 = $_FILES['letter']['name'];
			$docfile_11 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_11);
			$temp_name_11 = $_FILES['letter']['tmp_name'];
			$clData['bs_cs_latest_letter'] = $docfile_11;
			
			upload($docfile_11, $temp_name_11);
			
			$bs_business_id = $fwRequest->getParam('bs_business_id', '');
				
				$tablebs->setWhere('bs_business_id = '.$bs_business_id);
				if($tablebs->rowExists())
				{
				
					$detail = $tablebs->updateRow($clData);	
				}		
		}	
}




// Sava Auto Send Slider
$auto = $fwRequest->getParam('auto', '');
if(!empty($auto)) {
	//$last_date = $fwRequest->getParam('last_sent', '');
	$key = array_keys($auto);
	$ky = $key[0];
	$autoDetail['bs_cs_auto_send'] = $auto[$ky];
	$tablebs->setWhere('bs_business_id = '.$ky);
	$detail = $tablebs->updateRow($autoDetail);		
}
//End Auto Send Slider


// Sava Last Sent Date
$last = $fwRequest->getParam('last', '');
if(!empty($last)) {
	$last_date = $fwRequest->getParam('last_sent', '');
	$key = array_keys($last_date);
	$ky = $key[0];
	$lslDetail['bs_cs_last_sent'] = $last_date[$ky];
	$tablebs->setWhere('bs_business_id = '.$ky);
	$detail = $tablebs->updateRow($lslDetail);		
}
//End Last Sent Date

// Sava Last complete
$comp = $fwRequest->getParam('comp', '');
if(!empty($comp)) {
	$last_comp = $fwRequest->getParam('last_comp', '');
	$key = array_keys($last_comp);
	$ky = $key[0];
	$lcDetail['bs_cs_last_complete'] = $last_comp[$ky];
	$tablebs->setWhere('bs_business_id = '.$ky);
	$detail = $tablebs->updateRow($lcDetail);		
}
//End Last complete

$clearsearch = $fwRequest->getParam('clear', '');
if(!empty($clearsearch)){
	unset($search);
	unset($_SESSION['status']);
}

$where = " where  business.bsn_status Like '%|12|%'  OR  
	business.bsn_status Like  '%|2|%' OR  
	business.bsn_status Like '%|6|%'  OR
	business.bsn_status Like '%|5|%'  OR  
	business.bsn_status Like '%|3|%' ";
		
if(!empty($search)  || isset($_SESSION['status'])) :
	$where =' where ';
	$sqlvar = 1; 
	
	if(isset($_SESSION['status']))
	{
		$status = $_SESSION['status'];
	}else {
		$status = $fwRequest->getParam('status', '');
		$_SESSION['status'] = $status;
	}
	
	
	$data='';
	foreach($status as $k => $v)
	{
		$data .= "  business.bsn_status like '%|".$v."|%'". " OR ";
		$data3 .= $v .",";
	}
	
	$fwViewData['data3'] = $data3;
	$where .= $data;	
	$where .= "business.bsn_status like '%" .'X' ."%'";
	
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
	
	
$sql = "SELECT  business_sellers.bs_business_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business_sellers.bs_cs_last_result,
	business.bsn_id, business.bsn_name, business.bsn_status_date, business_sellers.bs_cs_last_sent, business_sellers.bs_cs_survey,
	bsn_status , business_sellers.bs_cs_servey_tobe, business_sellers.bs_cs_who_sent , business_sellers.bs_cs_auto_send, 
	business_sellers.bs_cs_last_complete, business_sellers.bs_cs_latest_letter
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id ". $where. "  Order by business_sellers.bs_cs_last_complete Desc "; 
	
//	where  business.bsn_status Like '%|12|%'  OR  
//	business.bsn_status Like  '%|2|%' OR  
//	business.bsn_status Like '%|6|%'  OR
//	business.bsn_status Like '%|5|%'  OR  
//	business.bsn_status Like '%|3|%' ";


$data =  $fwDb->query($sql);

if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 300;
    $last = ceil($rows/$page_rows); 

    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
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

	if($sql2)
	{  
		foreach($userData as $k => $v)
		{
				
				$status = '';
				$st = explode("|",$v['bsn_status']);
				foreach($st as $k2=>$v2)
				{
					$sqlsts = "Select st_name from busness_status where st_id = ".$v2;
					$stdata = $fwDb->queryOne($sqlsts);
					if(!empty($stdata)) {
						$status .= $stdata['st_name']. " - ";
					}
				}
				
				$status = rtrim($status, " - ");
				
				$ccdate = $v['bsn_status_date'];
				$Statusdate = changedate_y_m_d($ccdate);
				$curdate_y_m_d = date('Y-m-d');
				$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
				
				$setdata2[$k]['bs_business_id'] = $v['bs_business_id'];
				$setdata2[$k]['bsn_name'] = $v['bsn_name'];
				$setdata2[$k]['bs_cs_servey_tobe'] = $v['bs_cs_servey_tobe'];
				$setdata2[$k]['bs_cs_last_complete'] = $v['bs_cs_last_complete'];
				
				$setdata2[$k]['customer_1'] = $v['bcust_fname'] ." ".$v['bcust_lname'];
				$setdata2[$k]['status'] = $status;
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['days'] = $dayscount;
				$setdata2[$k]['bs_cs_last_sent'] = $v['bs_cs_last_sent'];
				$setdata2[$k]['bs_cs_who_sent'] = $v['bs_cs_who_sent'];
				$setdata2[$k]['bs_cs_last_result'] = $v['bs_cs_last_result'];
				$setdata2[$k]['bs_cs_survey'] = $v['bs_cs_survey'];
				$setdata2[$k]['bs_cs_auto_send'] = $v['bs_cs_auto_send'];
				$setdata2[$k]['bs_cs_latest_letter'] = $v['bs_cs_latest_letter'];
				
				
				
								
		}
		
		$fwViewData['list'] =  $setdata2;
	  }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Customer Survey";
$sqlse = "Select * from busness_status";
$fwViewData['statuslist'] = $fwDb->query($sqlse);

$sqlse = "Select * from survey_options";
$fwViewData['optionlist'] = $fwDb->query($sqlse);
