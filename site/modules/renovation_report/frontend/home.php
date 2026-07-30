<?php
$pagenum = $fwRequest->getparam('pagenum','');

$tablebusiness = new Fw_Db_Table('business');
$searchaddr = $fwRequest->getParam('searchaddr', '');
$searchchk = $fwRequest->getParam('searchchk', '');

$tabledpn = new Fw_Db_Table('document_renovation_name');

$where = " WHERE document_renovation_name.dpn_rr_hide = 0 ";
$fwViewData['ran'] =  rand(100000,999999);

$unhide = $fwRequest->getParam('unhide', '');
if($unhide)
{
$where = " WHERE 1 = 1 ";		
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 foreach($hide as $kh=>$vh)
	 {
		  $id = $kh; 
	 }
	
	  $detail['dpn_rr_hide'] = $vh;
	
	  $tabledpn->setWhere("dpn_unique_id = ".$id);
	  if($tabledpn->rowExists())
	  {
		 $this_id = $tabledpn->updateRow($detail);
	  }
}

// Save Onsite Measure Completed
$onsite_meas = $fwRequest->getParam('onsite_meas', '');
if(!empty($onsite_meas)) {
	$onsite = $fwRequest->getParam('onsite', '');
	
	foreach($onsite as $ko=>$vo)
	{
		$onDetail['dpn_rr_onsite'] = $vo;
		$tabledpn->setWhere('dpn_unique_id = '.$ko);
		$detail = $tabledpn->updateRow($onDetail);		
	}
}
//End Onsite Measure Completed

// Save First Meeting date
$fmd = $fwRequest->getParam('fmd', '');
if(!empty($fmd)) {
	$fm_dt = $fwRequest->getParam('first_met_dt', '');
	
	foreach($fm_dt as $k1=>$v1)
	{
		$fmdDetail['dpn_rr_fm_date'] = $v1;
		$tabledpn->setWhere('dpn_unique_id = '.$k1);
		$detail = $tabledpn->updateRow($fmdDetail);		
	}
}
//End First Meeting Date

// Save Next Plan Due Date
$nextplan_date = $fwRequest->getParam('nextplan_date', '');
if(!empty($nextplan_date)) {
	$next_plan = $fwRequest->getParam('next_plan', '');
	
	foreach($next_plan as $k11=>$v11)
	{
		$npDetail['dpn_rr_next_plan'] = $v11;
		$tabledpn->setWhere('dpn_unique_id = '.$k11);
		$detail = $tabledpn->updateRow($npDetail);		
	}
}
//End Next Plan Due Date

// Target Design Sign Off Date
$tar_sign = $fwRequest->getParam('tar_sign', '');
if(!empty($tar_sign)) {
	$target = $fwRequest->getParam('target', '');
	
	foreach($target as $k2=>$v2)
	{
		$tarDetail['dpn_rr_target_design'] = $v2;
	
		$tabledpn->setWhere('dpn_unique_id = '.$k2);
		$detail = $tabledpn->updateRow($tarDetail);		
	}
}
//End Design Sign Off Date

// Actual Design Approved Date
$act_design = $fwRequest->getParam('actual_design', '');
if(!empty($act_design)) {
	$actual = $fwRequest->getParam('actual', '');
	
	foreach($actual as $k3=>$v3)
	{
		$actDetail['dpn_rr_actual_de_dt'] = $v3;
	
		$tabledpn->setWhere('dpn_unique_id = '.$k3);
		$detail = $tabledpn->updateRow($actDetail);		
	}
}
//End Actual Design Approved Date

//Sign off Sent date
$signoff = $fwRequest->getParam('signoff_date', '');
if(!empty($signoff)) {
	$sign_off = $fwRequest->getParam('sign_off', '');
	
	foreach($sign_off as $k4=>$v4)
	{
		$offDetail['dpn_rr_sign_off'] = $v4;
	
		$tabledpn->setWhere('dpn_unique_id = '.$k4);
		$detail = $tabledpn->updateRow($offDetail);		
	}
}
//End Sign off Sent date

//Project Proposal Meeting Date
$ppmeet_date = $fwRequest->getParam('ppmeet_date', '');
if(!empty($ppmeet_date)) {
	$pp_meet = $fwRequest->getParam('pp_meet', '');
	
	foreach($pp_meet as $k5=>$v5)
	{
		$ppDetail['dpn_rr_pp_meeting_dt'] = $v5;
	
		$tabledpn->setWhere('dpn_unique_id = '.$k5);
		$detail = $tabledpn->updateRow($ppDetail);		
	}
}
//End Project Proposal Meeting Date

//Date Finalise Sent Request 
$finalize_date = $fwRequest->getParam('finalize_date', '');
if(!empty($finalize_date)) {
	$finadate = $fwRequest->getParam('finadate', '');
	
	foreach($finadate as $k6=>$v6)
	{
		$finDetail['dpn_rr_dt_finalise'] = $v6;
	
		$tabledpn->setWhere('dpn_unique_id = '.$k6);
		$detail = $tabledpn->updateRow($finDetail);		
	}
}
//End Date Finalise Sent Request 

$ascdsc = $fwRequest->getParam('sortorder','');
if($ascdsc == 1) { $ad = "ASC"; } elseif($ascdsc == 2) {  $ad = "DESC"; }

$fsp = $fwRequest->getParam('fsp', '');

$pbd = $fwRequest->getParam('pbd', '');
if(!empty($pbd)) {
	$ord =  " Order by  document_renovation_name.dpn_rr_percentage ".$ad;
	//$ord =  "ORDER BY if(  business.bsn_pcp_pbd = ' '
        //         OR business.bsn_pcp_pbd IS NULL , 1, 0 ) , STR_TO_DATE( business.bsn_pcp_pbd, '%d-%m-%Y' ) ";
}

$des = $fwRequest->getParam('des', '');
if(!empty($des)) {
	//$ord =  " Order by  document_renovation_name.dpn_customer_designer ".$ad;
	$ord =  " ORDER BY if(  document_renovation_name.dpn_customer_designer = ' '
                OR document_renovation_name.dpn_customer_designer IS NULL , 1, 0 ) , document_renovation_name.dpn_customer_designer ".$ad;
}


if(!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
}

   
$flag='';  
if($searchkey):

	$flag = 'true';
	
	$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
		
		$_SESSION['searchkey'] = $searchkey;
		$fwViewData['searchkey']=$_SESSION['searchkey'];
	
elseif($_SESSION['searchkey'] && $pagenum > 0):
	
		$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'" ;
		$fwViewData['searchkey']=$_SESSION['searchkey'];
endif;   
	   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		
 
   if($clear)
   {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	$where = "WHERE 1=1 ";
  }

 
     $sql = "Select business.bsn_id, business.bsn_address,  document_renovation_name.* , 
             document_check_list_renovation_count.dcnt_counter from business 
	     Inner Join document_check_list_renovation_count ON business.bsn_id  = document_check_list_renovation_count.dcnt_bsn_id
	     Right Join document_renovation_name on business.bsn_id  = document_renovation_name.dpn_bsn_id 
		". $where . $ord;


if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 1000;
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
$setdata = $fwDb->query($sql2);
 
foreach($setdata as $k => $v)
{
		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		$sqlcust = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname,
		            bus_customers.bcust_lname, bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2, 
			    bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
			    bus_customers.bcust_misc_home,  business.bsn_id
			    from business_sellers 		
			    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			    Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			    where business_sellers.bs_business_id = ".$v['bsn_id'];
		 $custdata = $fwDb->queryOne($sqlcust);
		
		$dayscount='';
		if($v['dpn_rr_fm_date']) {
			$ccdate = $v['dpn_rr_fm_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
		if($v['dpn_design_type'] == 1 ) { $type = "Concept Design" ; }
		elseif($v['dpn_design_type'] == 2 ) { $type = "Modification Design" ; }
		elseif($v['dpn_design_type'] == 3 ) { $type = "Existing Design" ; }
		elseif($v['dpn_design_type'] == 4 ) { $type = "External Design" ; }
		
		 $sql592 = "Select business_tasks.bt_completed_date from business_tasks
			    where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 592";
		
		 $data592 = $fwDb->queryOne($sql592);
		
		
		$sql5 = "SELECT document_check_list_renovation.doc_file_name , document_renovation_name.dpn_unique_id
			  FROM document_check_list_renovation
			  INNER JOIN document_renovation_name ON document_check_list_renovation.doc_bsn_id = document_renovation_name.dpn_bsn_id
			  WHERE document_check_list_renovation.doc_name_id = 5
			  AND document_check_list_renovation.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			  AND document_renovation_name.dpn_bsn_id =  " .$v['bsn_id'] . "
			  AND document_renovation_name.dpn_unique_id =" .$v['dpn_unique_id'];
		
		$data5 = $fwDb->queryOne($sql5);
	
				
		$sql54 = "SELECT document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded, 
		          document_renovation_name.dpn_unique_id
			  FROM document_check_list_mini
			  INNER JOIN document_renovation_name ON document_check_list_mini.doc_bsn_id = document_renovation_name.dpn_bsn_id
			  WHERE document_check_list_mini.doc_name_id = 54
			  AND document_check_list_mini.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			  AND document_renovation_name.dpn_bsn_id =  " .$v['bsn_id'] . "
			  AND document_renovation_name.dpn_unique_id =" .$v['dpn_unique_id'];
			 
		$data54 = $fwDb->queryOne($sql54);
	
		
		$days='';
		if($data54['doc_date_uploaded']) {
			$ccdate = $data54['doc_date_uploaded'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$days = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
		$sql3 = "SELECT document_check_list_renovation.doc_file_name , document_renovation_name.dpn_unique_id
			  FROM document_check_list_renovation
			  INNER JOIN document_renovation_name ON document_check_list_renovation.doc_bsn_id = document_renovation_name.dpn_bsn_id
			  WHERE document_check_list_renovation.doc_name_id = 3
			  AND document_check_list_renovation.doc_checklist_number = " .$v['dpn_proposal_number'] . "
			  AND document_renovation_name.dpn_bsn_id =  " .$v['bsn_id'] . "
			  AND document_renovation_name.dpn_unique_id =" .$v['dpn_unique_id'];
		
		$data3 = $fwDb->queryOne($sql3);
				 
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
				$setdata2[$k]['dpn_rr_deagree'] = $v['dpn_rr_deagree'];
				$setdata2[$k]['dpn_rr_onsite'] = $v['dpn_rr_onsite'];
				$setdata2[$k]['type'] = $type;
				$setdata2[$k]['data592'] = changedate_d_m_y($data592['bt_completed_date']);
				$setdata2[$k]['data592_sort'] = $data592['bt_completed_date'];
				$setdata2[$k]['dpn_rr_fm_date'] =  changedate_d_m_y($v['dpn_rr_fm_date']);
				$setdata2[$k]['dayscount'] = $dayscount;
				$setdata2[$k]['dpn_customer_designer'] = $v['dpn_customer_designer']; 	
				$setdata2[$k]['dpn_architect'] = $v['dpn_architect']; 
				$setdata2[$k]['checklist5'] = $data5['doc_file_name'];
				$setdata2[$k]['dpn_rr_percentage'] = $v['dpn_rr_percentage']; 
				$setdata2[$k]['dpn_rr_where_are'] = $v['dpn_rr_where_are']; 
				$setdata2[$k]['dpn_rr_letter_text'] = $v['dpn_rr_letter_text'];
				$setdata2[$k]['checklist54_date'] = changedate_d_m_y($data54['doc_date_uploaded']);
				$setdata2[$k]['days'] = $days;
				$setdata2[$k]['dpn_rr_alerts'] = $v['dpn_rr_alerts'];
				$setdata2[$k]['dpn_rr_target_design'] =  changedate_d_m_y($v['dpn_rr_target_design']);
				$setdata2[$k]['dpn_rr_actual_de_dt'] =  changedate_d_m_y($v['dpn_rr_actual_de_dt']);
				$setdata2[$k]['dpn_rr_cust_de_hour'] =  $v['dpn_rr_cust_de_hour'];
				$setdata2[$k]['dpn_rr_over_arch_hour'] =  $v['dpn_rr_over_arch_hour'];
				$setdata2[$k]['dpn_rr_total_hours'] =  $v['dpn_rr_total_hours'];
				$setdata2[$k]['dpn_rr_sign_off'] =  $v['dpn_rr_sign_off'];
				$setdata2[$k]['dpn_budget'] =  $v['dpn_budget'];
				$setdata2[$k]['dpn_rr_sqm'] =  $v['dpn_rr_sqm'];
				$setdata2[$k]['dpn_rr_est_cost'] =  $v['dpn_rr_est_cost'];
				$setdata2[$k]['dpn_rr_likely'] =  $v['dpn_rr_likely'];
				$setdata2[$k]['dpn_rr_pp_meeting_dt'] =  $v['dpn_rr_pp_meeting_dt'];
				$setdata2[$k]['dpn_rr_dt_finalise'] =  $v['dpn_rr_dt_finalise'];
				$setdata2[$k]['dpn_rr_building_file'] =  $v['dpn_rr_building_file'];
				$setdata2[$k]['dcnt_counter'] =  $v['dcnt_counter'];
				$setdata2[$k]['checklist3'] = $data3['doc_file_name'];
			        $setdata2[$k]['dpn_rr_hide'] = $v['dpn_rr_hide'];
				$setdata2[$k]['bcust_fname'] = $custdata['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $custdata['bcust_lname'];
				$setdata2[$k]['bcust_misc_email1'] = $custdata['bcust_misc_email1'];
				$setdata2[$k]['bcust_misc_email2'] = $custdata['bcust_misc_email2'];
				$setdata2[$k]['bcust_misc_moble'] = $custdata['bcust_misc_moble'];
				$setdata2[$k]['bcust_misc_business'] = $custdata['bcust_misc_business'];
				$setdata2[$k]['bcust_misc_home'] = $custdata['bcust_misc_home'];
				$setdata2[$k]['dpn_rr_next_plan'] =  $v['dpn_rr_next_plan'];
				
}
			
		if(!empty($fsp)) 
		{
			if(!empty($setdata2)) {
	 	       		 foreach ($setdata2 as $key => $row) 
		        	{
					
					$desig[$key]  = $row['data592_sort'];
				}
				if($ascdsc == 1) {
					array_multisort($desig, SORT_ASC, $setdata2);
				} else {
					array_multisort($desig, SORT_DESC, $setdata2);
				}
		   }
		}
		
		
 		$fwViewData['list'] =  $setdata2;		
  }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Renovation Design Report";


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

$objPHPExcel = new PHPExcel();

$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Proposal Control Panel Report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Renovation Report");

//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('R')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('S')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('T')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('U')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('V')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('W')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('X')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('Y')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('Z')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('AA')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('AB')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('AC')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('AD')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('AE')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('AF')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('AG')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('AH')->setAutoSize(true);
	
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
           	->setCellValue('A1', 'Address')
          	->setCellValue('B1', 'Customer Name')
		->setCellValue('C1', 'Design Agreement$$')
		->setCellValue('D1', 'Onsite Measure Completed')
		->setCellValue('E1', 'Relevant Checklist Numbers')
		->setCellValue('F1', 'Type')
		->setCellValue('G1', 'Design Agreement Signed Date')
		->setCellValue('H1', 'First Meeting Date')
		->setCellValue('I1', 'Initial Design Sent')
		->setCellValue('J1', 'Day Count')
		->setCellValue('K1', 'Designer')
		->setCellValue('L1', 'Overseas Architect')
		->setCellValue('M1', 'Latest Merge Meeting Notes')
		->setCellValue('N1', '% Completed')
		->setCellValue('O1', 'Where are we at?')
		->setCellValue('P1', 'Letter Text')
		->setCellValue('Q1', 'Last Meeting')
		->setCellValue('R1', 'Number of Days')
		->setCellValue('S1', 'Alerts')
		->setCellValue('T1', 'Targert Design Sign Off')
		->setCellValue('U1', 'Actual Design Approved Date')
		->setCellValue('V1', 'Customer Designer Hours')
		->setCellValue('W1', 'Overseas Architect Hours')
		->setCellValue('X1', 'Total Hours')
		->setCellValue('Y1', 'Next Plan Due Date')
		->setCellValue('Z1', 'Sign off Sent date')
		->setCellValue('AA1', 'Customer Budget')
		->setCellValue('AB1', 'SQM')
		->setCellValue('AC1', 'Estimate Cost')
		->setCellValue('AD1', 'Likely site scope value')
		->setCellValue('AE1', 'Project Proposal Meeting date')
		->setCellValue('AF1', 'Date Finalise Sent Request')
		->setCellValue('AG1', 'Building File')
		->setCellValue('AH1', 'Proposal Checklist')	
		;

$from = "A1"; // or any value
$to = "AH1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{

			$objPHPExcel->getActiveSheet()
			->setCellValue('A'.$row, $v['bsn_address'])
			->setCellValue('B'.$row, $v['bcust_fname']. ''.$v['bcust_lname'])
			->setCellValue('C'.$row, $v['dpn_rr_deagree'])
			->setCellValue('D'.$row, $v['dpn_rr_onsite'])
			->setCellValue('E'.$row, $v['dpn_unique_id'])
			->setCellValue('F'.$row, $v['type'])
			->setCellValue('G'.$row, $v['data592'])
			->setCellValue('H'.$row, $v['dpn_rr_fm_date'])
			->setCellValue('I'.$row, '')
			->setCellValue('J'.$row, $v['dayscount'])
			->setCellValue('K'.$row, $v['dpn_customer_designer'])
			->setCellValue('L'.$row, $v['dpn_architect'])
			->setCellValue('M'.$row, '')
			->setCellValue('N'.$row, $v['dpn_rr_percentage'])
			->setCellValue('O'.$row, $v['dpn_rr_where_are'])
			->setCellValue('P'.$row, $v['dpn_rr_letter_text'])
			->setCellValue('Q'.$row, $v['checklist54_date'])
			->setCellValue('R'.$row, $v['days'])
			->setCellValue('S'.$row, $v['dpn_rr_alerts'])
		        ->setCellValue('T'.$row, $v['dpn_rr_target_design'])
			->setCellValue('U'.$row, $v['dpn_rr_actual_de_dt'])
		        ->setCellValue('V'.$row, $v['dpn_rr_cust_de_hour'])
			->setCellValue('W'.$row, $v['dpn_rr_over_arch_hour'])
			->setCellValue('X'.$row, $v['dpn_rr_total_hours'])
			->setCellValue('Y'.$row, $v['dpn_rr_next_plan'])
		        ->setCellValue('Z'.$row, $v['dpn_rr_sign_off'])
			->setCellValue('AA'.$row, $v['dpn_budget'])
			->setCellValue('AB'.$row, $v['dpn_rr_sqm'])
			->setCellValue('AC'.$row, $v['dpn_rr_est_cost'])
			->setCellValue('AD'.$row, $v['dpn_rr_likely'])
			->setCellValue('AE'.$row, $v['dpn_rr_pp_meeting_dt'])
			->setCellValue('AF'.$row, $v['dpn_rr_dt_finalise'])
			->setCellValue('AG'.$row, $v['dpn_rr_building_file'])
			->setCellValue('AH'.$row, $v['dcnt_counter'])
				
			;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Renovation Report');
$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="renovation_report.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');
// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

	}