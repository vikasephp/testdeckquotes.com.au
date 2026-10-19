<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('incl_tracker_docs');
$submit = $fwRequest->getParam('weeklydoc', '');
$tableBusiness = new Fw_Db_Table('business');
$table = new Fw_Db_Table('business_sellers');



// Save commencement_date
$ccd = $fwRequest->getParam('bsn_incl_cc_date', '');
if(!empty($ccd)) {
	$cc_date = $fwRequest->getParam('bsn_incl_cc_date', '');
	
	foreach($cc_date as $kc=>$vc)
	{
		$ccdDetail['bsn_incl_cc_date'] = $vc;
	
		$tableBusiness->setWhere('bsn_id = '.$kc);
		$detail = $tableBusiness->updateRow($ccdDetail);		
	}
}
//End commencement_date

$sqlH = "Select distinct bst_task_id, bst_ptt_summary from busness_status_task
	where bst_business_status_id = 4 order by bst_order";
$colhead = $fwDb->query($sqlH);

$tottask = count($colhead);

$fwViewData['colhead'] = $colhead;

$searchaddr = $fwRequest->getParam('searchaddr', '');
$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);
	
	
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
		
$ord = " Order by STR_TO_DATE( business.bsn_status_sys_date, '%d-%m-%Y' ) DESC ";

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        bus_customers.bcust_misc_business, business.bsn_id, business.bsn_name,  business.bsn_sub_status,  bus_customers.bcust_id,
	business.bsn_status_sys_date, business.bsn_address, person_responsible_detail.prd_name,
	business.bsn_per_complete from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
	Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
	person_responsible_detail.prd_prm_id = 10 "
	. $where. " And  business.bsn_status like '%|4|%' 
	 Group By business.bsn_id " .$ord;


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

 $setdata2 = $fwDb->query($sql2);
 
foreach($setdata2 as $k => $v)
{
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
		$link  = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
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

		$setdata2[$k]['prd_name'] = $v['prd_name'];
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['link2'] = $link2;
		$setdata2[$k]['dayscount'] = $dayscount;

		
//		$setdata2[$k]['bs_tl_user_incl'] = $v['bs_tl_user_incl'];
//		$setdata2[$k]['bs_tl_date_incl'] = $v['bs_tl_date_incl'];
//		$setdata2[$k]['bcust_itt_letter_text'] = $v['bcust_itt_letter_text'];
//		$setdata2[$k]['bcust_wcr_occ_date'] = $v['bcust_wcr_occ_date'];
//		$setdata2[$k]['bcust_wcr_occ_dt_who'] = $v['bcust_wcr_occ_dt_who'];	   
		
		foreach($colhead as $kh => $kv)
		{
	
		$taskid = $kv['bst_task_id'];
			
		    $sql2 = "Select business_tasks.* from business_tasks
			     where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = " .$kv['bst_task_id'];
		   
		    $data2 = $fwDb->queryOne($sql2);
		    
		    if($data2['bt_task_not_required'] == 1)
		    {
			   $taskdata[$taskid] = 'N / R'; 
		    } else {
		    	   $taskdata[$taskid] = changedate_d_m_y($data2['bt_completed_date']);
		    }
		   $taskdata123[$taskid] = $data2['bt_position_resp'];
		}

		$setdata2[$k]['data']['task'] = $taskdata;
		$setdata2[$k]['data']['per'] = $taskdata123;
		
				
		$sql3 = "Select count(*) as cnt_1 from business_tasks
			 inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
			where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And bt_complete = 1 And business_tasks.bt_task_status_id = 4";
		
		 $data3 = $fwDb->queryOne($sql3);
		 
		 $percomp = round($data3['cnt_1'] / $tottask * 100);
		 $setdata2[$k]['completed'] = $percomp;
		 
		 $sql4 = "Select count(*) as cnt_2 from business_tasks
			  inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
			  where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And bt_task_not_required = 1 
			  And business_tasks.bt_task_status_id = 4";
		
		 $data4 = $fwDb->queryOne($sql4);
		 $nr = round($data4['cnt_2'] / $tottask * 100,2);
		 $setdata2[$k]['notreq'] = $nr;
		
}
	

 	$fwViewData['list'] =  $setdata2;
	
	$report = new Fw_Db_Table('report_inclusion_task_tracker');
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

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Complete Task Tracker";

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
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

$objPHPExcel = new PHPExcel();

$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Design report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Inclusion Task Tracker");

//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);

$j=3;
	foreach($colhead as $ke=>$ve)
	{		
		$objPHPExcel->getActiveSheet()->getColumnDimension($col2[$j])->setWidth(14);
		$j++;	
	}
	

// Add some data
$objPHPExcel->setActiveSheetIndex(0)
       			 ->setCellValue('A1', 'Address')
           		 ->setCellValue('B1', 'Customer Name');
			
	$i=3;
	foreach($colhead as $ke=>$ve)
	{		
		$objPHPExcel->setActiveSheetIndex(0)->setCellValue($col[$i],$ve['bst_task_id']);
		$i++;	
	}
	
	;

$from = "A1"; // or any value
$to = "AZ1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );

$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	$cno =3;
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['bsn_address'])
				->setCellValue('B'.$row, $v['bcust_fname'] . ' ' .$v['bcust_lname']);
				
				
	foreach($setdata2[$k]['data']['task'] as $kc=>$vc)
	{
	
		$objPHPExcel->getActiveSheet()->setCellValue($col2[$cno].$row , $vc);
		$cno++;
	}

	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Complete Task Tracker');
$objPHPExcel->setActiveSheetIndex(0);

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="complete_task_tracker.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

	}
		
// Print All Task

$printall = $fwRequest->getParam('printall', 0);

if($printall)
{	
	
$sqlBus = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
           business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address, business.bsn_cp_incl_choices
	  FROM business_sellers
	  INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
	  INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id
	  WHERE business.bsn_status LIKE '%|4|%'
	  GROUP BY business.bsn_id
	  ORDER BY business.bsn_status_sys_date DESC";
	
if($sqlBus){ $businessDetail = $fwDb->query($sqlBus); }
	
$html = "<html><body>";
foreach($businessDetail as $bk => $bv)
{
	
	$sqlT = "select * from busness_status_task where bst_business_status_id = 4 order by  bst_order";
	$taskdata = $fwDb->query($sqlT);
		
	foreach($taskdata as $tk => $tv)
	{
	
		$sqlbt = "select business_tasks.*, users.user_name from business_tasks 
		Inner join users on business_tasks.bt_completed_by = users.user_id
		where bt_task_id = " .$tv['bst_task_id']." And bt_bsn_id = ".$bv['bsn_id'];		
		
		$taskdetail = $fwDb->queryOne($sqlbt);	
			
		$setdata3[$tk]['bst_task_id'] = $tv['bst_task_id'];
		$setdata3[$tk]['bst_task_name'] = $tv['bst_task_name'];	
		
		if($taskdetail['bt_complete'] == 1) { $comp = 'Yes'; } else { $comp = 'No'; }
		$setdata3[$tk]['bt_complete'] = $comp;
		
		if($taskdetail['bt_complete'] == 1) {
			$setdata3[$tk]['bt_completed_date'] = $taskdetail['bt_completed_date'];
			} else {
				
			$setdata3[$tk]['bt_completed_date'] =  '';	
			}
		$setdata3[$tk]['user_name'] = $taskdetail['user_name'];	
		
	}
	

	$html .= '<table border="1" cellpadding="5">
		<tr><th colspan="5" style="text-align:center; color:#25b4e5;"><h1>'.$bv['bsn_name']. '</h1></th></tr>
		  <tr><th style="width:6%;"><strong>UID</strong></th><th style="width:58%;"><strong>Task Name</strong></th>
	          <th style="width:8%;"><strong>Complete</strong></th><th style="width:14%;"><strong>Complete Date</strong></th>
		  <th style="width:14%;"><strong>Completed By</strong></th></tr>';
	
	foreach($setdata3 as $k2 =>$v2)
	{
		$html .= '<tr>';
		$html .= '<td>' . $v2['bst_task_id']. '</td>';
		$html .= '<td>' . $v2['bst_task_name']. '</td>';
		$html .= '<td>' . $v2['bt_complete']. '</td>';
		$html .= '<td>' . $v2['bt_completed_date']. '</td>';
		$html .= '<td>' . $v2['user_name']. '</td>';
		$html .= '</tr>';
	}
	
	$html .='</table><br><br>';
	$html .='<div style="page-break-before:always">&nbsp;</div>';
}
	$html .='</body></html><br><br>';
	$heading="Complete Task Tracker";
	$fname="Manoj";
	create_inclusion_report($heading,$html,$fname);	
}
	

 		