<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebusiness = new Fw_Db_Table('business');
$table = new Fw_Db_Table('business_sellers');
$fwViewData['ran'] =  rand(100000,999999);
$table_toplink = new Fw_Db_Table('top_links');
$update_link = $fwRequest->getParam('update_link', '');
if(!empty($update_link)){
	$proc = $fwRequest->getParam('proc', '');
        $tlDetail['tl_link'] = $proc;
	$table_toplink->setWhere("tl_slug = 'planning_task_tracker'");
	$table_toplink->updateRow($tlDetail);
}

$savedata = $fwRequest->getParam('savedata', '');
if($savedata) { 

		if($_FILES['pr_letter'])
		{
			
			$bsn_id = $fwRequest->getParam('bsn_id', '');
			$doc1 = $_FILES['pr_letter']['name'];
			$file_type = $_FILES['pr_letter']['type'];	
							
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
			$src =  $_FILES['pr_letter']['tmp_name']; 
			$destination = BASE_DIR.'files/cma/'.$doc1;
		
			if(!move_uploaded_file($src, $destination))
				{
					//echo "Possible file upload attack";
				}
			else
				{
					$letterData['bc_ptt_letter'] = $doc1;
					chmod($destination, 0664);
				}
				
				$table->setWhere('bs_business_id = '.$bsn_id);
				if($table->rowExists())
				{
					
					$detail = $table->updateRow($letterData);	
				}		
		}
	
}


// Save Orginal CSBD
$orginal_csbd = $fwRequest->getParam('bsn_orginal_csbd', '');
if(!empty($orginal_csbd)) {
	$o_csbd = $fwRequest->getParam('bsn_orginal_csbd', '');
	
	foreach($o_csbd as $kp=>$vp)
	{
		$pbdDetail['bsn_orginal_csbd'] = $vp;
	
		$tablebusiness->setWhere('bsn_id = '.$kp);
		$detail = $tablebusiness->updateRow($pbdDetail);		
	}
}
//End Orginal CSBD

// Save Latest CSBD
$latest_csbd = $fwRequest->getParam('bsn_latest_csbd', '');
if(!empty($latest_csbd)) {
	$l_csbd = $fwRequest->getParam('bsn_latest_csbd', '');
	
	foreach($l_csbd as $kp=>$vp)
	{
		$lcsbdDetail['bsn_latest_csbd'] = $vp;
	
		$tablebusiness->setWhere('bsn_id = '.$kp);
		$detail = $tablebusiness->updateRow($lcsbdDetail);		
	}
}
//End Latest CSBD

$sqlH = "Select distinct bst_task_id, bst_ptt_summary from busness_status_task
	where bst_business_status_id = 2 order by bst_order";
$colhead = $fwDb->query($sqlH);
$tottask = count($colhead);
$fwViewData['colhead'] = $colhead;

$where = "WHERE 1=1 ";
$searchaddr = $fwRequest->getParam('searchaddr', '');		
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
  
  $redlight = $fwRequest->getParam('redlight', ''); 
  if(!empty($redlight)) {
	  $where = "WHERE business_sellers.bs_traffic_light = 3 ";
  } 
  
    $amberlight = $fwRequest->getParam('amberlight', ''); 
    if(!empty($amberlight)) {
	  $where = "WHERE business_sellers.bs_traffic_light = 2 ";
    }
    
     $filter_ss = $fwRequest->getParam('filter_ss', ''); 
     if(!empty($filter_ss)) {
	  $ss = $fwRequest->getParam('bs_ptt_sub_status', '');   
	  $where = " WHERE business_sellers.bs_ptt_sub_status = ".$ss;
	  $fwViewData['ss'] = $ss;
    }
  
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address, person_responsible_detail.prd_name, business.bsn_cp_incl_choices,
		business.bsn_per_complete, business.bsn_ptt_d_type, business.bsn_orginal_csbd, business.bsn_latest_csbd,
		business_sellers.bc_ptt_letter, business_sellers.bc_planning_task_report, business_sellers.bs_traffic_light,
		business_sellers.bs_tl_user, business_sellers.bs_tl_date, bus_customers.bcust_ptt_letter_text,
		business_sellers.bs_ptt_sub_status, bus_customers.bcust_ptt_letter_text_date, business_sellers.bs_ptt_sub_status_date,
		business_sellers.bs_ptt_sub_status_user, bus_customers.bcust_ptt_letter_text_user, business_sellers.bs_ptt_sub_status_order
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 8 "
		. $where. " And  business.bsn_status like '%|2|%' 
		 Group By business.bsn_id 
		Order By business.bsn_status_sys_date DESC";

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
		
		
		//$ccdate = $v['bsn_status_sys_date'];
		//$Statusdate = changedate_y_m_d($ccdate);
		//$curdate_y_m_d = date('Y-m-d');
		//$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		
		
		$o_date = $v['bsn_orginal_csbd'];
		$c_date = $v['bsn_latest_csbd'];
		$date1 = changedate_y_m_d($o_date);
		$date2 = changedate_y_m_d($c_date);
		$day='';
		if(!empty($date1) AND !empty($date2)) {
			
			$day = daysDifference($date2, $date1);
			
		}			   
				
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bs_business_id'] = $v['bs_business_id'];
		
		$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdata2[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdata2[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
		$setdata2[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdata2[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdata2[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
		$setdata2[$k]['prd_name'] = $v['prd_name'];
		$setdata2[$k]['bsn_ptt_d_type'] = $v['bsn_ptt_d_type'];
		$setdata2[$k]['bsn_orginal_csbd'] = $v['bsn_orginal_csbd'];
		$setdata2[$k]['bsn_latest_csbd'] = $v['bsn_latest_csbd'];
		$setdata2[$k]['bcust_ptt_letter_text'] = $v['bcust_ptt_letter_text'];
		$setdata2[$k]['bs_ptt_sub_status'] = $v['bs_ptt_sub_status'];
		
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['link2'] = $link2;
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['bsn_per_complete'] = $v['bsn_per_complete'];
		
		$setdata2[$k]['bc_ptt_letter'] = $v['bc_ptt_letter'];
		$setdata2[$k]['bc_planning_task_report'] = $v['bc_planning_task_report'];
		
		$setdata2[$k]['dd'] = $day;
		$setdata2[$k]['bs_traffic_light'] = $v['bs_traffic_light'];	
		$setdata2[$k]['bs_tl_user'] = $v['bs_tl_user'];
		$setdata2[$k]['bs_tl_date'] = changedate_d_m_y($v['bs_tl_date']);
		$setdata2[$k]['bcust_ptt_letter_text'] = $v['bcust_ptt_letter_text'];
		$setdata2[$k]['bcust_ptt_letter_text_user'] = $v['bcust_ptt_letter_text_user'];
		
		$setdata2[$k]['bcust_ptt_letter_text_date'] = $v['bcust_ptt_letter_text_date'];
		$setdata2[$k]['bs_ptt_sub_status_date'] = $v['bs_ptt_sub_status_date'];
				   
		$setdata2[$k]['bs_ptt_sub_status_user'] = $v['bs_ptt_sub_status_user'];
		$setdata2[$k]['bs_ptt_sub_status_order'] = $v['bs_ptt_sub_status_order'];
		
		
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
			where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And bt_complete = 1 And business_tasks.bt_task_status_id = 2";
		
		 $data3 = $fwDb->queryOne($sql3);
		 
		 $percomp = round($data3['cnt_1'] / $tottask * 100);
		 $setdata2[$k]['completed'] = $percomp;
		 
		 $sql4 = "Select count(*) as cnt_2 from business_tasks
			  inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
			  where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And bt_task_not_required = 1 
			  And business_tasks.bt_task_status_id = 2";
		
		 $data4 = $fwDb->queryOne($sql4);
		 $nr = round($data4['cnt_2'] / $tottask * 100,2);
		 $setdata2[$k]['notreq'] = $nr;
		
}

	 	 foreach ($setdata2 as $key => $row) {
		 
     		 $desig[$key]  = $row['dayscount'];
		}
		
		array_multisort($desig, SORT_ASC, $setdata2);

 	$fwViewData['list'] =  $setdata2;
	
	$report = new Fw_Db_Table('report_planning_task_tracker');
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
$fwViewData['title'] = "Planning Task Tracker";


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
							 ->setCategory("Planning Task Tracker");


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
			 ->setCellValue('C1', 'D Type')
			 ->setCellValue('D1', 'Planning Manager');
			
	
	$i=4;
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
	$cno = 4;
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['bsn_address'])
				->setCellValue('B'.$row, $v['bcust_fname'] . ' ' .$v['bcust_lname'])
				->setCellValue('C'.$row, $v['bsn_ptt_d_type'])
				->setCellValue('D'.$row, $v['prd_name']);
			
				
	foreach($setdata2[$k]['task'] as $kc=>$vc)
	{
		
		//db($vc);	
		$objPHPExcel->getActiveSheet()->setCellValue($col2[$cno].$row , $vc);
		$cno++;
	}

				
					
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Planning Task Tracker');


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
	$sql1 = "SELECT business.bsn_name, business.bsn_ptt_d_type, person_responsible_detail.prd_name, business.bsn_latest_csbd
		FROM business
		RIGHT JOIN person_responsible_detail ON business.bsn_id = person_responsible_detail.prd_bsn_id
		AND person_responsible_detail.prd_prm_id = 8
		WHERE bsn_id = ". $bus_id;
	 
	$busdata = $fwDb->queryOne($sql1);
	
	$sql2 = "Select bc_cpr_hia_date from business_sellers where business_sellers.bs_business_id = ".$bus_id;
	$hiadata = $fwDb->queryOne($sql2);


	$sql5 = "SELECT  business_sellers.bs_business_id,  bus_customers.bcust_fname, bus_customers.bcust_lname,
		business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		where business.bsn_id = ".$bus_id;
		
	$b_data = $fwDb->queryOne($sql5);
	$name = $b_data['bcust_fname']. ' '.$b_data['bcust_lname']. ' '. $b_data['bsn_address'];
	
		$hiadate = $hiadata['bc_cpr_hia_date'];
		$hia = changedate_y_m_d($hiadate);
		$curdate_y_m_d1 = date('Y-m-d');
		$daysdiff = daysDifference($curdate_y_m_d1, $hia);
	
	

	
		$newdate = date('Y-m-d', strtotime("-7 days"));
		
	
		$sql3 = "Select count(*) as task_done from business_tasks
			 
			  where business_tasks.bt_bsn_id = ". $v['bsn_id']. "
			  And business_tasks.bt_task_status_id = 2  AND business_tasks.bt_completed_date >= '". $newdate."'";
		
		 $data3 = $fwDb->queryOne($sql3);
	
	
	
	
	$sqlT = "select * from busness_status_task where bst_business_status_id = 2 order by bst_order";
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
	
	$dt = date("l, d F Y");
	$html = "<html><body>";
	
	//$html .= "<h1>".$busdata['bsn_name']."</h1><br>";
	$html .= '<h1 style = "font-size:90px;text-align:center;"> 7 Day Planning Task Progress Report </h1>';
	
	$html .= '<strong><table  cellpadding="5" >';
	$html .= '<tr><td>'.$dt.'</td> <td>'. $name. ' </td> </tr>';
	$html .= '<tr><td>Planning Manager : '.$busdata['prd_name']. '</td><td>Development Type : '. $busdata['bsn_ptt_d_type']. ' </td></tr>';
	$html .= '<tr><td>Hia Sign Date : '.$hiadata['bc_cpr_hia_date'].' </td> <td>Day Count :'.$daysdiff.' </td></tr>';
        $html .= '<tr><td>Could Start Building Date : ' .$busdata['bsn_latest_csbd']. '</td><td>Tasks Completed last 7 Days : '.$data3['task_done'].' </td></tr>';
	
	$html .= '<div style="width:100%;"> &nbsp;';

	$html .= '</div>';
	
	$html .= '</table></strong><br><br>';
	
	$html .= '<br><table border="1" cellpadding="5">
		  <tr><th style="width:6%;"><strong>UID</strong></th><th style="width:58%;"><strong>Task Name</strong></th>
	          <th style="width:8%;"><strong>Complete</strong></th><th style="width:14%;"><strong>Complete Date</strong></th>
		  <th style="width:8%;"><strong>Days Count</strong></th> <th style="width:14%;"><strong>Completed By</strong></th></tr>';
	
	$hiadate = $hiadata['bc_cpr_hia_date'];
	$hia = changedate_y_m_d($hiadate);
	
	foreach($setdata3 as $k2 =>$v2)
	{
			
		$day_count='';
		if(!empty($v2['bt_completed_date']))
		{
		$comp_date =  changedate_y_m_d($v2['bt_completed_date']);
		$day_count = daysDifference($comp_date, $hia);
		}
		
		$html .= '<tr>';
		$html .= '<td>' . $v2['bst_task_id']. '</td>';
		$html .= '<td>' . $v2['bst_task_name']. '</td>';
		if($v2['bt_complete'] == 'Yes') {
			$html .= '<td style="background-color: #6F9;">' . $v2['bt_complete']. '</td>';
		} else
		{
			$html .= '<td>' . $v2['bt_complete']. '</td>';
		}
		$html .= '<td>' . $v2['bt_completed_date']. '</td>';
		$html .= '<td>'.$day_count.'</td>';
		$html .= '<td>' . $v2['user_name']. '</td>';
		$html .= '</tr>';
	}
	
	$html .='</table></body></html>';
	
	$heading="Planning Task Tracker";
	$fname="Manoj";
	
	create_planning_report($heading,$html,$bus_id);	
}
	
	
// Print All Task

$printall = $fwRequest->getParam('printall', 0);

if($printall)
{	
	
$sqlBus = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, bus_customers.bcust_misc_home, business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address, business.bsn_cp_incl_choices
FROM business_sellers
INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id
WHERE business.bsn_status LIKE '%|2|%'
GROUP BY business.bsn_id
ORDER BY business.bsn_status_sys_date DESC";
	
if($sqlBus){ $businessDetail = $fwDb->query($sqlBus); }
	
$html = "<html><body>";
foreach($businessDetail as $bk => $bv)
{
	
	$sqlT = "select * from busness_status_task where bst_business_status_id = 2 order by  bst_order";
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
	
	$html .='</table>';
	$html .='<div style="page-break-before:always">&nbsp;</div>';
}
	$html .='</body></html><br><br>';
	$heading="Planning Task Tracker";
	$fname="Manoj";
	create_planning_report($heading,$html,$fname);	
}



// Merge

$bus_id = $fwRequest->getParam('merge', 0);
if($bus_id > 0)
{
	require_once(MODULES_DIR . 'PDFMerger.php');
	$pdf = new PDFMerger;;
	
	$sql_A = "select bc_ptt_letter from business_sellers where bs_business_id = ".$bus_id;
	$data_A = $fwDb->queryOne($sql_A);
	
	//$docfile1 = BASE_DIR.'files/cma/Planning_Approvals_Update_Letter___33_Tipiloura_Street__Ngunnawal_ACT_2913.pdf';
	$docfile1 = BASE_DIR.'files/cma/'.$data_A['bc_ptt_letter'];
	
	
	$newfile1 = "new_doc1.pdf";
	shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile='.$newfile1.' '.$docfile1);	
	rename($newfile1, BASE_DIR.'files/merged/'.$newfile1);
	//sleep(1);
	
	$sql_B = "select bc_planning_task_report from business_sellers where bs_business_id = ".$bus_id;
	$data_B = $fwDb->queryOne($sql_B);
	
	//$docfile2 = BASE_DIR.'files/cma/Planning_Approvals_Update_Letter___33_Tipiloura_Street__Ngunnawal_ACT_2913.pdf';
	
	$docfile2 = BASE_DIR.'files/cma/'.$data_B['bc_planning_task_report'];
	$newfile2 = "new_doc2.pdf";
	
	shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile='.$newfile2.' '.$docfile2);	
	rename($newfile2, BASE_DIR.'files/merged/'.$newfile2);
	
	$newfile3 = BASE_DIR.'files/merged/'.$newfile1;
	//$pdf->addPDF($docfile);
	$pdf->addPDF($newfile3);
	
	$newfile4 = BASE_DIR.'files/merged/'.$newfile2;
	$pdf->addPDF($newfile4);
	
	 $fn = "combined_report.pdf";
	$pdf->merge('file',BASE_DIR.'files/merged/'.$fn);
	
	$filepath_url =BASE_URL.'files/merged/'.$fn;
	echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=900, height=750'); window.focus();</script>"; 
}


 $sql_l = "Select * from letter_text_planning order by lt_code";
 $fwViewData['letterData'] = $fwDb->query($sql_l);		
 
$table_toplink->setWhere("tl_slug = 'planning_task_tracker'");
$fwViewData['proc_detail'] = $table_toplink->getRow();

$sql_sub = "SELECT  * from ptt_sub_type";
$fwViewData['sub_status'] = $fwDb->query($sql_sub);
			