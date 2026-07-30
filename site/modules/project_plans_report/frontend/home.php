<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebusiness = new Fw_Db_Table('business');
$table = new Fw_Db_Table('business_sellers');


$searchaddr = $fwRequest->getParam('searchaddr', '');
$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);

$daysat = $fwRequest->getParam('daysat','');
if(!empty($daysat)) {
	
	$ascdsc = $fwRequest->getParam('sortorder','');
	
}

$traffic = $fwRequest->getParam('traffic','');
if(!empty($traffic)) {	
	$t_ascdsc = $fwRequest->getParam('sortorder','');	
	if($t_ascdsc == 1 ) {
		$ord = " order by business_sellers.bs_tl_date ASC ";
	} elseif ($t_ascdsc == 2 ) {
		$ord = " order by business_sellers.bs_tl_date DESC ";
	}
}


$hide312 = $fwRequest->getParam('hide312','');
$hide301 = $fwRequest->getParam('hide301','');
$hide330 = $fwRequest->getParam('hide330','');
$hide369 = $fwRequest->getParam('hide369','');


// Save Commenced Onsite
$ccd = $fwRequest->getParam('bs_ppr_target_date', '');
if(!empty($ccd)) {
	$cc_date = $fwRequest->getParam('bs_ppr_target_date', '');
	
	foreach($cc_date as $kc=>$vc)
	{
		$ccdDetail['bs_ppr_target_date'] = $vc;
	
		$table->setWhere('bs_business_id = '.$kc);
		$detail = $table->updateRow($ccdDetail);		
	}
}
//End Commenced Onsite
	
	
if(!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
}	
	
if($keyword):
$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
   
if($searchkey):

$where .= " AND business.bsn_address LIKE '%".$searchkey."%'";
	
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey']=$_SESSION['searchkey'];

elseif($_SESSION['searchkey'] && $pagenum > 0):

	$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%'";
	
	$fwViewData['searchkey']=$_SESSION['searchkey'];
endif; 
  
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_advert_text,  business.bsn_id, business.bsn_name, business.bsn_address, person_responsible_detail.prd_name,
	business.bsn_ptt_d_type,  business_sellers.bc_planning_task_report, business_sellers.bs_traffic_light,
	business_sellers.bs_tl_user, business_sellers.bs_tl_date, business_sellers.bs_ppr_target_date, business_sellers.bs_ppr_survey_imple,
	business_sellers.bs_ppr_survey_imp_user , business_sellers.bs_ppr_survey_date
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
	Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
	person_responsible_detail.prd_prm_id = 8 "
	. $where. " And  business.bsn_status like '%|2|%' 
	 Group By business.bsn_id " . $ord;


if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 100;
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
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];
		$link2 = "http://www.documentclick.com.au/site.documents/bsn_id/".$v['bsn_id'];	
		
		
		if(!empty($data['doc_file_name']))
		 {
			$ccdate = $data['doc_date_uploaded'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		   
		} else { $ccdate = ''; 
			 $dayscount='';
		       }
		
		$o_date = $v['bsn_orginal_csbd'];
		$c_date = $v['bsn_latest_csbd'];
		$date1 = changedate_y_m_d($o_date);
		$date2 = changedate_y_m_d($c_date);
		$day='';
		if(!empty($date1) AND !empty($date2)) {
			
			$day = daysDifference($date2, $date1);
			
		}			   
		
		$sql73 = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 73";
		$data73 = $fwDb->queryOne($sql73);
		
		
		$sql312 = "Select business_tasks.* from business_tasks
		         where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  312";
		$data312 = $fwDb->queryOne($sql312);
		
		
		$sql301 = "Select business_tasks.* from business_tasks
		         where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  301";
		$data301 = $fwDb->queryOne($sql301);
		
		$sql330 = "Select business_tasks.* from business_tasks
		         where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  330";
		$data330 = $fwDb->queryOne($sql330);
		
		
		$sql369 = "Select business_tasks.* from business_tasks
		         where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  369";
		$data369 = $fwDb->queryOne($sql369);
		
		//
		
		$sql374 = "Select business_tasks.* from business_tasks
		where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  374";
		$data374 = $fwDb->queryOne($sql374);
		
		$sql357 = "Select business_tasks.* from business_tasks
		where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  357";
		$data357 = $fwDb->queryOne($sql357);
		
		$sql514 = "Select business_tasks.* from business_tasks
		where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  514";
		$data514 = $fwDb->queryOne($sql514);
		
				
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdata2[$k]['prd_name'] = $v['prd_name'];
		$setdata2[$k]['bsn_ptt_d_type'] = $v['bsn_ptt_d_type'];
	        $setdata2[$k]['link'] = $link;
		$setdata2[$k]['link2'] = $link2;
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['bc_planning_task_report'] = $v['bc_planning_task_report'];
		$setdata2[$k]['dd'] = $day;
		$setdata2[$k]['bs_traffic_light'] = $v['bs_traffic_light'];	
		$setdata2[$k]['bs_tl_user'] = $v['bs_tl_user'];
		$setdata2[$k]['bs_tl_date'] = changedate_d_m_y($v['bs_tl_date']);
		$setdata2[$k]['bs_ppr_target_date'] = changedate_d_m_y($v['bs_ppr_target_date']);
		$setdata2[$k]['project_plan'] = $data73['doc_file_name'];
		
		$setdata2[$k]['bs_ppr_survey_imple'] = $v['bs_ppr_survey_imple'];
		$setdata2[$k]['bs_ppr_survey_imp_user'] = $v['bs_ppr_survey_imp_user'];
		$setdata2[$k]['bs_ppr_survey_date'] = $v['bs_ppr_survey_date'];		   

		$setdata2[$k]['com312'] = $data312['bt_complete'];
		$setdata2[$k]['com301'] = $data301['bt_complete'];
		$setdata2[$k]['com330'] = $data330['bt_complete'];
		$setdata2[$k]['com369'] = $data369['bt_complete'];
		
		$setdata2[$k]['com374'] = $data374['bt_complete'];
		$setdata2[$k]['com357'] = $data357['bt_complete'];
		$setdata2[$k]['com514'] = $data514['bt_complete'];
		
		if($data312['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid312'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid312'] = changedate_d_m_y($data312['bt_completed_date']);
		           }
		
		
		if($data301['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid301'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid301'] = changedate_d_m_y($data301['bt_completed_date']);
		           }		

		
		if($data330['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid330'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid330'] = changedate_d_m_y($data330['bt_completed_date']);
		           }	
		
		
		if($data369['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid369'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid369'] = changedate_d_m_y($data369['bt_completed_date']);
		           }
			   
		if($data374['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid374'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid374'] = changedate_d_m_y($data374['bt_completed_date']);
		           }
			   
		if($data357['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid357'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid357'] = changedate_d_m_y($data357['bt_completed_date']);
		           }	   	   
		
		if($data514['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid514'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid514'] = changedate_d_m_y($data514['bt_completed_date']);
		           }
		
}


       	        foreach ($setdata2 as $key => $row) {
   			$desig[$key]  = $row['dayscount'];
		}
		
		if($ascdsc == 1 ) {
			array_multisort($desig, SORT_ASC, $setdata2);
		} elseif($ascdsc == 2 ) {
			array_multisort($desig, SORT_DESC, $setdata2);
		}

		if(!empty($hide312)) {
			foreach($setdata2 as $h1=>$s1)
			{
				if($s1['com312'] == 1) { unset($setdata2[$h1]);  }
			}
		}
		
		if(!empty($hide301)) {
			foreach($setdata2 as $h2=>$s2)
			{
				if($s2['com301'] == 1) { unset($setdata2[$h2]);  }
			}
		}
		
		
		if(!empty($hide330)) {
			foreach($setdata2 as $h3=>$s3)
			{
				if($s3['com330'] == 1) { unset($setdata2[$h3]);  }
			}
		}
		
		if(!empty($hide369)) {
			foreach($setdata2 as $h4=>$s4)
			{
				if($s4['com369'] == 1) { unset($setdata2[$h4]);  }
			}
		}
		
		
 	$fwViewData['list'] =  $setdata2;
	
	$report = new Fw_Db_Table('report_project_plans');
	$report->setWhere("1=1");
	$report->deleteRows();
	
	foreach($setdata2 as $rk => $rv)
	{
		if(!empty($rv['bsn_id'])) {
			$detailrp['re_bsn_id'] = $rv['bsn_id'];
			$this_id = $report->insertRow($detailrp);
			}
	}
	
 }
}


//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Project Plans Report";

$sqlpp = "Select * from project_plans_report";
$fwViewData['ppdata'] = $fwDb->queryOne($sqlpp);


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
{

	for ($char = 'A'; $char <= 'Z'; $char++) {
	    $col[] = $char.'1';
	}
	for ($char = 'A'; $char <= 'Z'; $char++) {
	    $col2[] = $char;
	}
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Design report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Project Plans Report");

//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);




// Add some data
$objPHPExcel->setActiveSheetIndex(0)
       			 ->setCellValue('A1', 'Address')
           		 ->setCellValue('B1', 'Customer Name')
			 ->setCellValue('C1', 'D Type')
			 ->setCellValue('D1', 'Planning Manager')
			 ->setCellValue('E1', 'Days at Status')
			 ->setCellValue('F1', 'Target Date')
			 ->setCellValue('G1', 'Traffic Light')
			 ->setCellValue('H1', 'Survey Implemented')
			 
			 ;
			
$from = "A1"; // or any value
$to = "AZ1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );
$objPHPExcel->getActiveSheet()->getStyle("G")->getAlignment()->setWrapText(true);
$objPHPExcel->getActiveSheet()->getStyle("H")->getAlignment()->setWrapText(true);

$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	
	if($v['bs_traffic_light'] == 1) { $clr = '00CC33'; }
	if($v['bs_traffic_light'] == 2) { $clr = 'ff7f27'; }
	if($v['bs_traffic_light'] == 3) { $clr = 'F00'; }
	
	$objPHPExcel->getActiveSheet()
        ->getStyle('G'.$row)
        ->getFill()
        ->setFillType(PHPExcel_Style_Fill::FILL_SOLID)
        ->getStartColor()
        ->setRGB($clr);
	
	
	$cno = 4;
	$objPHPExcel->getActiveSheet()
		->setCellValue('A'.$row, $v['bsn_address'])
		->setCellValue('B'.$row, $v['bcust_fname'] . ' ' .$v['bcust_lname'])
		->setCellValue('C'.$row, $v['bsn_ptt_d_type'])
		->setCellValue('D'.$row, $v['prd_name'])
		->setCellValue('E'.$row, $dayscount)
		->setCellValue('F'.$row, $v['bs_ppr_target_date'])
		->setCellValue('G'.$row, $v['bs_tl_user']."\n".$v['bs_tl_date'])
		->setCellValue('H'.$row, $v['bs_ppr_survey_imple']."\n".$v['bs_ppr_survey_imp_user']." ".$v['bs_ppr_survey_date'])
		 ;

					
	$row= $row+1;			
	$sr=$sr+1;
}

$objPHPExcel->getActiveSheet()->setTitle('Planning Task Tracker');


$objPHPExcel->setActiveSheetIndex(0);


header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="project_plans_report.xls"');
header('Cache-Control: max-age=0');
header('Cache-Control: max-age=1');
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

}
