<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tableBusiness = new Fw_Db_Table('business');
$tableBus_task = new Fw_Db_Table('business_tasks');


$clear_database_for_print_all_files = $fwRequest->getParam('clear_database_for_print_all_files', '');
$download_all_files_report = $fwRequest->getParam('download_all_files_report', '');
if(!empty($clear_database_for_print_all_files)) {
 	
 	$thisTable = new Fw_Db_Table("construction_task_tracker_manage_reports");	$thisTable->setWhere("`id` != ''");
   $thisTable->deleteRows();
    // loop through the files one by one
    $files_list = glob($_SERVER['DOCUMENT_ROOT']."/reports/*");
    foreach($files_list as $file){
        // check if is a file and not sub-directory
        if(is_file($file)){
            // delete file
            unlink($file);
        }
    }
    
     $files_list = glob($_SERVER['DOCUMENT_ROOT']."/reports/full_report/*");
    foreach($files_list as $file){
        // check if is a file and not sub-directory
        if(is_file($file)){
            // delete file
            unlink($file);
        }
    }
}

if(!empty($download_all_files_report))
{
   require_once($_SERVER['DOCUMENT_ROOT'].'/PDFMerger-master/PDFMerger.php'); 	$pdf = new PDFMerger; 

          $fn = "printed_reports"."_".time().".pdf";  
    	//  $po_pdf_newfile = $_SERVER['DOCUMENT_ROOT'].'/reports/'.$v['file_name']; 
         
        foreach(glob($_SERVER['DOCUMENT_ROOT'].'/reports/*.*') as $filename){
     		$pdf->addPDF($_SERVER['DOCUMENT_ROOT'].'/reports/'.basename($filename));
    	  }
        $pdf->merge('file', $_SERVER['DOCUMENT_ROOT'].'/reports/full_report/'.$fn);
        $file_absolute_path = $_SERVER['DOCUMENT_ROOT'].'/reports/full_report/'.$fn;

        header('Content-Description: File Transfer');
        header('Content-Disposition: attachment; filename='.basename($file_absolute_path));
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . filesize($file_absolute_path));

        header("Content-type:application/pdf"); 
        readfile($file_absolute_path);

          exit();
}



// Add Task Starts
$add_task = $fwRequest->getParam('add_task', '');
if(!empty($add_task)) {
	
	$sqlta =  "SELECT  business_sellers.bs_business_id, business.bsn_id, business.bsn_name, business.bsn_address
				from business_sellers 		
				Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
				Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
				Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
				person_responsible_detail.prd_prm_id = 10 WHERE  business.bsn_status like '%|3|%' 
				Group By business.bsn_id   Order By business.bsn_status_sys_date DESC";
	
	$bsndata = $fwDb->query($sqlta);	
	
		
	$sql_gettasks = "SELECT  st.st_id, st.st_name, bst.bst_id, bst.bst_business_types, bst.bst_task_name 
					FROM busness_status as st
					LEFT JOIN busness_status_task as bst
					ON st.st_id = bst.bst_business_status_id
					WHERE st.st_id = 3";
		
	$tasksOfstatus = $fwDb-> query($sql_gettasks);


	foreach($bsndata as $k=>$v)
	{
		foreach($tasksOfstatus as $k2=>$v2)
		{
				$tableBus_task->setWhere("bt_bsn_id = " .$v['bsn_id'] ." and bt_task_status_id = 3 and bt_task_id = ".$v2['bst_id']);
				
				if(!$tableBus_task->rowExists())
				{ 
					$detail['bt_bsn_id'] = $v['bsn_id'];
					$detail['bt_task_status_id'] = 3;
					$detail['bt_task_id'] = $v2['bst_id'];
					
					$tableBus_task -> insertRow($detail);
				}
		}
	}
}

// Add Tasks Ends

$ord = " Order By business.bsn_status_sys_date DESC ";
$sort_project = $fwRequest->getParam('sort_project', '');
if(!empty($sort_project)) {
	$ord = " Order by business.bsn_address ";	
}
$sort_manager = $fwRequest->getParam('sort_manager', '');
if(!empty($sort_manager)) {
	//$ord = " Order by person_responsible_detail.prd_name ";
	$ord =  " ORDER BY if( person_responsible_detail.prd_name = ' '
        OR person_responsible_detail.prd_name IS NULL , 1, 0 ) ,  person_responsible_detail.prd_name, '%d-%m-%Y'  ";	
}
$sort_days = $fwRequest->getParam('sort_days', '');
if(!empty($sort_days)) {
	$ord = " Order by business.bsn_status_sys_date DESC ";	
}





// Save Orginal CSBD
$orginal_csbd = $fwRequest->getParam('bsn_orginal_csbd_ctt', '');
if(!empty($orginal_csbd)) {
	$o_csbd = $fwRequest->getParam('bsn_orginal_csbd_ctt', '');
	
	foreach($o_csbd as $kp=>$vp)
	{
		$pbdDetail['bsn_orginal_csbd_ctt'] = $vp;
	
		$tableBusiness->setWhere('bsn_id = '.$kp);
		$detail = $tableBusiness->updateRow($pbdDetail);		
	}
}
//End Orginal CSBD

// Save Latest CSBD
$latest_csbd = $fwRequest->getParam('bsn_latest_csbd_ctt', '');
if(!empty($latest_csbd)) {
	$l_csbd = $fwRequest->getParam('bsn_latest_csbd_ctt', '');
	
	foreach($l_csbd as $kp=>$vp)
	{
		$lcsbdDetail['bsn_latest_csbd_ctt'] = $vp;
	
		$tableBusiness->setWhere('bsn_id = '.$kp);
		$detail = $tableBusiness->updateRow($lcsbdDetail);		
	}
}
//End Latest CSBD


$submit = $fwRequest->getParam('upload_letter', '');
if($submit)
{
	$bus_id = $fwRequest->getParam('business_id', '');
	if($_FILES['weekly'])
		{
			
				
				$docfile_1 = $_FILES['weekly']['name'];
				$file_type = $_FILES['weekly']['type'];				
				
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$src = $_FILES['weekly']['tmp_name'];
				
				upload($docfile_1, $src);
				$detail['bsn_weekly_letter_const'] = $docfile_1;
				
			//	$destination = BASE_DIR.'files/weekly_letter_construction/'.$docfile_1;
//				
//					if(!move_uploaded_file($src, $destination))
//							{
//								//echo "Possible file upload attack";
//							}
//					else
//							{
//								$detail['bsn_weekly_letter_const'] = $docfile_1;
//								chmod($destination, 0664);
//							}						
		}	
		 $tableBusiness->setWhere("bsn_id = $bus_id");
	     	 $opr = $tableBusiness->updateRow($detail);   
	
}

$sqlH = "Select distinct bst_task_id, bst_ptt_summary from busness_status_task
	where bst_business_status_id = 3 order by bst_order";
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
		

 $sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
	    bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address, person_responsible_detail.prd_name, business.bsn_cp_incl_choices,
		business.bsn_per_complete, business.bsn_weekly_letter_const , business.bsn_orginal_csbd_ctt, business.bsn_latest_csbd_ctt
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 10 "
		. $where. " And  business.bsn_status like '%|3|%' 
		 Group By business.bsn_id  ". $ord;

if($sql){$userData = $fwDb->query($sql);}


$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 50;
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
		$link2 = "http://www.documentclick.com.au/site.documents/bsn_id/".$v['bsn_id'];	
		
		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		
		$o_date = $v['bsn_orginal_csbd_ctt'];
		$c_date = $v['bsn_latest_csbd_ctt'];
		$date1 = changedate_y_m_d($o_date);
		$date2 = changedate_y_m_d($c_date);
		$day='';
		if(!empty($date1) AND !empty($date2)) {
			
			$day = daysDifference($date2, $date1);
			
		}
		
		
		$sql_143 = "Select document_check_list.doc_file_name from document_check_list 
			    where document_check_list.doc_bsn_id = ".$v['bsn_id']. " And
			    document_check_list.doc_name_id = 143";
		
		$data143 = $fwDb->queryOne($sql_143);			   
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdata2[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdata2[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
		$setdata2[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdata2[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdata2[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
		$setdata2[$k]['prd_name'] = $v['prd_name'];
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['link2'] = $link2;
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['bsn_per_complete'] = $v['bsn_per_complete'];	
		$setdata2[$k]['doc_file_name'] = $data143['doc_file_name'];
		$setdata2[$k]['bsn_weekly_letter_const'] = $v['bsn_weekly_letter_const'];
		
		$setdata2[$k]['bsn_orginal_csbd_ctt'] = $v['bsn_orginal_csbd_ctt'];
		$setdata2[$k]['bsn_latest_csbd_ctt'] = $v['bsn_latest_csbd_ctt'];
		$setdata2[$k]['dd'] = $day;		   
		
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
		}

		$setdata2[$k]['task'] = $taskdata;
		
				
		$sql3 = "Select count(*) as cnt_1 from business_tasks
			 inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
			where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And bt_complete = 1 And business_tasks.bt_task_status_id = 3";
		
		 $data3 = $fwDb->queryOne($sql3);
		 
		 $percomp = round($data3['cnt_1'] / $tottask * 100);
		 $setdata2[$k]['completed'] = $percomp;
		 
		 $sql4 = "Select count(*) as cnt_2 from business_tasks
			  inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
			  where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And bt_task_not_required = 1 
			  And business_tasks.bt_task_status_id = 3";
		
		 $data4 = $fwDb->queryOne($sql4);
		 $nr = round($data4['cnt_2'] / $tottask * 100,2);
		 $setdata2[$k]['notreq'] = $nr;
		
}

 	$fwViewData['list'] =  $setdata2;
	
	$report = new Fw_Db_Table('report_construction_task_tracker');
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
$fwViewData['title'] = "Construction Task Tracker";


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

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Design report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Construction Task Tracker");

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
           		 ->setCellValue('B1', 'Customer Name')
			->setCellValue('C1', 'Inclusion Coordinator');
			
	
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
				->setCellValue('B'.$row, $v['bcust_fname'] . ' ' .$v['bcust_lname'])
				->setCellValue('C'.$row, $v['prd_name']);
			
				
	foreach($setdata2[$k]['task'] as $kc=>$vc)
	{
		$objPHPExcel->getActiveSheet()->setCellValue($col2[$cno].$row , $vc);
		$cno++;
	}
					
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Construction Task Tracker');

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel2007)
//header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
// Redirect output to a client’s web browser (Excel5)

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="design_report.xls"');
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

	
// Print Task

$bus_id = $fwRequest->getParam('print', 0);

if($bus_id > 0)
{
	$sql1 = "select business.bsn_name from business where bsn_id = ". $bus_id;
	$busdata = $fwDb->queryOne($sql1);
	
	$sqlT = "select * from busness_status_task where bst_business_status_id = 3 order by bst_order";
	$taskdata = $fwDb->query($sqlT);
	
	
	
	foreach($taskdata as $tk => $tv)
	{
	
		$sqlbt = "select business_tasks.*, users.user_name from business_tasks 
		Inner join users on business_tasks.bt_completed_by = users.user_id
		where bt_task_id = " .$tv['bst_task_id']." And bt_bsn_id = ".$bus_id;		
		
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
	
	
	$html = "<html><body><h1>".$busdata['bsn_name']."</h1><br>";
	$html .= '<table border="1" cellpadding="5">
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
	
	$html .='</table></body></html>';
	
	$heading="Construction Task Tracker";
	$fname="Manoj";
	
	create_construction_report_2($heading,$html,$fname);	
}
	

// Print All Task

$printall = $fwRequest->getParam('printall', 0);

if($printall)
{
    $total_counted = 0;  $is_record_exist = 0;
     $printed_r_sql = "SELECT record_id FROM `construction_task_tracker_manage_reports` WHERE is_printed = 1"; $total_printed_ids = [];
    if($printed_r_sql){ $total_printed_records = $fwDb->query($printed_r_sql);  }
   
    if(!empty($total_printed_records)){
         foreach($total_printed_records as $bk => $bv)
         {
             $total_printed_ids[] = $bv['record_id'];
         }
    }
   //  echo "<pre> Check Count of Projects"; print_r($total_printed_ids); exit;
    	
    $sqlBus = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, bus_customers.bcust_misc_home, business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address, business.bsn_cp_incl_choices
    FROM business_sellers
    INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
    INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id
    WHERE business.bsn_status LIKE '%|3|%'
    GROUP BY business.bsn_id
    ORDER BY business.bsn_status_sys_date DESC";
    	 if($sqlBus){ $businessDetail = $fwDb->query($sqlBus); }
       //echo "<pre> Check Count of Projects"; echo count($businessDetail); print_r($businessDetail); exit;
    $html = "<html><body>"; 
    foreach($businessDetail as $bk => $bv)
    {
    	 if(!in_array($bv['bs_business_id'], $total_printed_ids))
        {
    	$sqlT = "select * from busness_status_task where bst_business_status_id = 3 order by bst_order";
    	$taskdata = $fwDb->query($sqlT);   $is_record_exist = 1;
    		
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
    	
        $table_poincc2_merge_po_files = new Fw_Db_Table('construction_task_tracker_manage_reports');
        $insertData = ["record_id"=> $bv['bs_business_id'] , "is_printed"=> 1];
        $table_poincc2_merge_po_files->insertRow($insertData);
        
    	if ($total_counted > 20){ break; } $total_counted++;
        }
    }
    	$html .='</body></html><br><br>';
    	$heading="Construction Task Tracker";
    	$fname="Manoj";
    //	echo "<pre>"; print_r($html); echo "<pre>";exit('checking');
    if($is_record_exist > 0){	create_construction_report($heading,$html,$fname); }
}

    	
  $sqlBus = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, bus_customers.bcust_misc_home, business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address, business.bsn_cp_incl_choices
    FROM business_sellers
    INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
    INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id
    WHERE business.bsn_status LIKE '%|3|%'
    GROUP BY business.bsn_id
    ORDER BY business.bsn_status_sys_date DESC";
    
 if($sqlBus){ $businessDetail = $fwDb->query($sqlBus); $fwViewData['total_records_of_print_reports'] = $total_records = count($businessDetail); }
    
    $printed_r_sql = "SELECT record_id FROM `construction_task_tracker_manage_reports` WHERE is_printed = 1";
    if($sqlBus){ $businessDetail = $fwDb->query($printed_r_sql); 
    $fwViewData['total_printed_records'] = $total_printed_records = $total_records = count($businessDetail); 
        
       // echo "<pre> Check Count of Projects";  print_r($businessDetail); exit;
    }
			