<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebusiness = new Fw_Db_Table('business');
$table = new Fw_Db_Table('business_sellers');
$tableBus_task = new Fw_Db_Table('business_tasks');
$table_toplink = new Fw_Db_Table('top_links');

$update_link = $fwRequest->getParam('update_link', '');
if(!empty($update_link)){
	$proc = $fwRequest->getParam('proc', '');
        $tlDetail['tl_link'] = $proc;
	$table_toplink->setWhere("tl_slug = 'pre_construction_report'");
	$table_toplink->updateRow($tlDetail);
}




// Add Task Starts
$add_task = $fwRequest->getParam('add_task', '');
if(!empty($add_task)) {
	
	$sqlta =  "SELECT  business_sellers.bs_business_id, business.bsn_id
			  from business_sellers 		
			  Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			  Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
			  Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
			  person_responsible_detail.prd_prm_id = 8 where business.bsn_status like '%|6|%' 
			  Group By business.bsn_id 
			  Order By business_sellers.bs_ptt_sub_status_order ASC";
	
	$bsndata = $fwDb->query($sqlta);	
	
		
	$sql_gettasks = "SELECT  st.st_id, st.st_name, bst.bst_id, bst.bst_business_types, bst.bst_task_name 
					FROM busness_status as st
					LEFT JOIN busness_status_task as bst
					ON st.st_id = bst.bst_business_status_id
					WHERE st.st_id = 6";
		
	$tasksOfstatus = $fwDb-> query($sql_gettasks);


	foreach($bsndata as $k=>$v)
	{
		foreach($tasksOfstatus as $k2=>$v2)
		{
				$tableBus_task->setWhere("bt_bsn_id = " .$v['bsn_id'] ." and bt_task_status_id = 6 and bt_task_id = ".$v2['bst_id']);
				
				if(!$tableBus_task->rowExists())
				{ 
					$detail['bt_bsn_id'] = $v['bsn_id'];
					$detail['bt_task_status_id'] = 6;
					$detail['bt_task_id'] = $v2['bst_id'];
					
					$tableBus_task -> insertRow($detail);
					
				}
		}
	}
}

// Add Tasks Ends


$searchaddr = $fwRequest->getParam('searchaddr', '');
$where = " WHERE business_sellers.bs_cpr_hide = 0 ";
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


$hide658 = $fwRequest->getParam('hide658','');
$hide387 = $fwRequest->getParam('hide387','');
$hide386 = $fwRequest->getParam('hide386','');
$hide363 = $fwRequest->getParam('hide363','');
$hide364 = $fwRequest->getParam('hide364','');

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
		

//$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
//        business.bsn_advert_text,  business.bsn_id, business.bsn_name, business.bsn_address, person_responsible_detail.prd_name,
//	    business.bsn_ptt_d_type,  business_sellers.bc_planning_task_report, business_sellers.bs_traffic_light, business_sellers.bs_traffic_light_incl,
//		business_sellers.bs_tl_user_incl, business_sellers.bs_tl_date_incl,
//		business_sellers.bs_tl_user, business_sellers.bs_tl_date, business_sellers.bs_ppr_target_date, business.bsn_starting_onsite_date
//		from business_sellers 		
//		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
//		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
//		person_responsible_detail.prd_prm_id = 14 "
//		. $where. " And  business.bsn_status like '%|6|%' 
//		 Group By business.bsn_id " . $ord;
		 
		 
$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_advert_text,  business.bsn_id, business.bsn_name, business.bsn_address, person_responsible_detail.prd_name,
	    business.bsn_ptt_d_type,  business_sellers.bc_planning_task_report, business_sellers.bs_traffic_light, business_sellers.bs_traffic_light_incl,
		business_sellers.bs_tl_user_incl, business_sellers.bs_tl_date_incl,
		business_sellers.bs_tl_user, business_sellers.bs_tl_date, business_sellers.bs_ppr_target_date, business.bsn_starting_onsite_date
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 14 " . $where. " 
	    And  ( business.bsn_status like '%|2|%' Or business.bsn_status like '%|5|%' Or business.bsn_status like '%|6|%' 
	   Or business.bsn_addto_cpr = 1 Or business.bsn_showin_cpr = 1 ) 
	   Group By business.bsn_id " .$ord ;


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
		
		$sql142 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 142";
		$data142 = $fwDb->queryOne($sql142);
		
		$sql658 = "Select business_tasks.bt_completed_date, business_tasks.bt_complete from business_tasks
		          where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  658";
		$data658 = $fwDb->queryOne($sql658);
		
		
		$sql387 = "Select business_tasks.bt_completed_date, business_tasks.bt_complete from business_tasks
		         where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  387";
		$data387 = $fwDb->queryOne($sql387);
		
		$sql386 = "Select business_tasks.bt_completed_date, business_tasks.bt_complete from business_tasks
		         where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  386";
		$data386 = $fwDb->queryOne($sql386);

		

		
		
		$sql122 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 122";
		$data122 = $fwDb->queryOne($sql122);
		
		$sql363 = "Select business_tasks.bt_completed_date, business_tasks.bt_complete from business_tasks
		         where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  363";
		$data363 = $fwDb->queryOne($sql363);
	

				
		$sql478 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 478";
		$data478 = $fwDb->queryOne($sql478);		
				
				
		$sql364 = "Select business_tasks.bt_completed_date, business_tasks.bt_complete from business_tasks
		         where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id =  364";
		$data364 = $fwDb->queryOne($sql364);
		
		
		$sql421 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 421";
		$data421 = $fwDb->queryOne($sql421);
		
		$sql258 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 258";
		$data258 = $fwDb->queryOne($sql258);
		
		
		$sql121 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 121";
		$data121 = $fwDb->queryOne($sql121);	
		
		$sql625 = "Select document_check_list.doc_file_name from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 625";
		$data625 = $fwDb->queryOne($sql625);
				
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdata2[$k]['prd_name'] = $v['prd_name'];
		$setdata2[$k]['bsn_ptt_d_type'] = $v['bsn_ptt_d_type'];
	    $setdata2[$k]['link'] = $link;
		$setdata2[$k]['link2'] = $link2;
		$setdata2[$k]['bsn_starting_onsite_date'] = $v['bsn_starting_onsite_date'];
		
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['bc_planning_task_report'] = $v['bc_planning_task_report'];
		$setdata2[$k]['dd'] = $day;
		$setdata2[$k]['bs_traffic_light'] = $v['bs_traffic_light'];	
		$setdata2[$k]['bs_tl_user'] = $v['bs_tl_user'];
		$setdata2[$k]['bs_tl_date'] = changedate_d_m_y($v['bs_tl_date']);
		
		
		$setdata2[$k]['bs_traffic_light_incl'] = $v['bs_traffic_light_incl'];	
		$setdata2[$k]['bs_tl_user_incl'] = $v['bs_tl_user_incl'];
		$setdata2[$k]['bs_tl_date_incl'] = changedate_d_m_y($v['bs_tl_date_incl']);
		
		$setdata2[$k]['bs_ppr_target_date'] = changedate_d_m_y($v['bs_ppr_target_date']);
		$setdata2[$k]['construction_package'] = $data142['doc_file_name'];		   
		$setdata2[$k]['wall_roof'] = $data122['doc_file_name'];
		$setdata2[$k]['floor_system'] = $data478['doc_file_name'];
	

       	$setdata2[$k]['com658'] = $data658['bt_complete'];
		$setdata2[$k]['com387'] = $data387['bt_complete'];
		$setdata2[$k]['com386'] = $data386['bt_complete'];
		$setdata2[$k]['com363'] = $data363['bt_complete'];
		$setdata2[$k]['com364'] = $data364['bt_complete'];

		if($data658['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid658'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid658'] = changedate_d_m_y($data658['bt_completed_date']);
		           }
		
		
		if($data387['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid387'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid387'] = changedate_d_m_y($data387['bt_completed_date']);
		           }		

		
		if($data386['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid386'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid386'] = changedate_d_m_y($data386['bt_completed_date']);
		           }	
		
		
		if($data363['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid363'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid363'] = changedate_d_m_y($data363['bt_completed_date']);
		           }
			   
		if($data364['bt_task_not_required'] == 1)
		    {
			   $setdata2[$k]['uid364'] = 'N / R'; 
		    } else {
		    	   $setdata2[$k]['uid364'] = changedate_d_m_y($data364['bt_completed_date']);
		           }	   



		
		$setdata2[$k]['doc_file_name_421'] = $data421['doc_file_name'];
		$setdata2[$k]['doc_file_name_258'] = $data258['doc_file_name'];
		$setdata2[$k]['doc_file_name_121'] = $data121['doc_file_name'];
		$setdata2[$k]['doc_file_name_625'] = $data625['doc_file_name'];
		
		
	   
		
}


       foreach ($setdata2 as $key => $row) {
   			$desig[$key]  = $row['dayscount'];
		}
		
		if($ascdsc == 1 ) {
			array_multisort($desig, SORT_ASC, $setdata2);
		} elseif($ascdsc == 2 ) {
			array_multisort($desig, SORT_DESC, $setdata2);
		}


       if(!empty($hide658)) {
			foreach($setdata2 as $h1=>$s1)
			{
				if($s1['com658'] == 1) { unset($setdata2[$h1]);  }
			}
		}
		
		if(!empty($hide387)) {
			foreach($setdata2 as $h2=>$s2)
			{
				if($s2['com387'] == 1) { unset($setdata2[$h2]);  }
			}
		}
		
		
		if(!empty($hide386)) {
			foreach($setdata2 as $h3=>$s3)
			{
				if($s3['com386'] == 1) { unset($setdata2[$h3]);  }
			}
		}
		
		if(!empty($hide363)) {
			foreach($setdata2 as $h4=>$s4)
			{
				if($s4['com363'] == 1) { unset($setdata2[$h4]);  }
			}
		}
		
		if(!empty($hide364)) {
			foreach($setdata2 as $h5=>$s5)
			{
				if($s5['com364'] == 1) { unset($setdata2[$h5]);  }
			}
		}


//		
 	$fwViewData['list'] =  $setdata2;
	

	
 }
}


//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Pre Construction Report";

$sqlpp = "Select * from pre_construction_report";
$fwViewData['ppdata'] = $fwDb->queryOne($sqlpp);



// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
{

	
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
							 ->setCategory("Planning Task Tracker");


$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);

// Add some data
$objPHPExcel->setActiveSheetIndex(0)
       		->setCellValue('A1', 'Address')
           	->setCellValue('B1', 'Customer Name')
			 ->setCellValue('C1', 'D Type')
			 ->setCellValue('D1', 'Pre Construction Manager');
		;

$from = "A1"; // or any value
$to = "D1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	$cno = 4;
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['bsn_address'])
				->setCellValue('B'.$row, $v['bcust_fname'] . ' ' .$v['bcust_lname'])
				->setCellValue('C'.$row, $v['bsn_ptt_d_type'])
				->setCellValue('D'.$row, $v['prd_name']);
					
	$row= $row+1;			
	$sr=$sr+1;
}

$objPHPExcel->getActiveSheet()->setTitle('Pre Construction Report');

$objPHPExcel->setActiveSheetIndex(0);

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="pcr.xls"');
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
$table_toplink->setWhere("tl_slug = 'pre_construction_report'");
$fwViewData['proc_detail'] = $table_toplink->getRow();