<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('document_proposal_name');
$tableBusiness = new Fw_Db_Table('business');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');

// Save Estimate Cost
$estimate = $fwRequest->getParam('estimate', '');
if(!empty($estimate)) {
	$esti_cost = $fwRequest->getParam('estimatecost', '');
	$key = array_keys($esti_cost);
	$ky = $key[0];
	
	$ecDetail['dpn_dptr_estimate_cost'] = $esti_cost[$ky];
	$ecDetail['dpn_dptr_es_user'] = $_SESSION['user']['user_name'];
	$ecDetail['dpn_dptr_es_date'] = date('d-m-Y');
	
	$table->setWhere('dpn_unique_id = '.$ky);
	$detail = $table->updateRow($ecDetail);		
}
// End Estimate Cost

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 foreach($hide as $k9=>$v9)
	 {
		  $id = $k9; 
	 }
	
	  $detail['dpn_dptr_hide'] = $v9;
	  

	  $table->setWhere("dpn_unique_id = ".$id);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
}



$sqlH = "Select bst_task_id, bst_task_name from proposal_task_list order by bst_order";
$colhead = $fwDb->query($sqlH);

foreach($colhead as $kh => $vh )
{
	$tn = explode("-",$vh['bst_task_name'],2);
	$heading[] = $vh['bst_task_id']."-".trim($tn[1]);		
}

$fwViewData['col'] = $heading;

$tottask = count($colhead);
$fwViewData['colhead'] = $colhead;

$table_toplink = new Fw_Db_Table('top_links');

$update_link = $fwRequest->getParam('update_link', '');
if(!empty($update_link)){
	$proc = $fwRequest->getParam('proc', '');
        $tlDetail['tl_link'] = $proc;
	$table_toplink->setWhere("tl_slug = 'design_process_task_report'");
	$table_toplink->updateRow($tlDetail);
}

$designer = $fwRequest->getParam('designer', '');
$architect = $fwRequest->getParam('architect', '');



$where = " WHERE   document_proposal_name.dpn_dptr_hide = 0 ";
$unhide = $fwRequest->getParam('unhide', '');
if(!empty($unhide)) {
	$where = " WHERE 1 = 1 ";	
}

$fwViewData['ran'] =  rand(100000,999999);
		  
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		
$ord = " Order By document_check_list.doc_date_uploaded DESC ";

$searchkey = $fwRequest->getParam('searchkey', '');

  if($searchkey):

        $where .= " AND business.bsn_address  LIKE '%".$searchkey."%' OR 
                    bus_customers.bcust_fname LIKE '%".$searchkey."%' OR  
	            bus_customers.bcust_lname LIKE '%".$searchkey."%' ";
	
		$_SESSION['searchkey'] = $searchkey;
		$fwViewData['searchkey']=$_SESSION['searchkey'];

   elseif($_SESSION['searchkey'] && $pagenum > 0):
		
      $where .= " AND business.bsn_address LIKE  '%".$_SESSION['searchkey']."%' OR
                  bus_customers.bcust_fname LIKE '%".$_SESSION['searchkey']."%' OR  
	          bus_customers.bcust_lname LIKE '%".$_SESSION['searchkey']."%' ";
			
	        $fwViewData['searchkey']=$_SESSION['searchkey'];

   elseif(isset($_SESSION['searchkey'])) :
    		
	$where .= " AND business.bsn_address LIKE  '%".$_SESSION['searchkey']."%' OR
                  bus_customers.bcust_fname LIKE '%".$_SESSION['searchkey']."%' OR  
	          bus_customers.bcust_lname LIKE '%".$_SESSION['searchkey']."%' ";	
  endif;

  $clear = $fwRequest->getParam('clear', '');

  if($clear)
  {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	$where = "WHERE 1=1 ";
 }
	 	 
$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
	bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_moble, 
	business.bsn_initial_meeting_date , bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name,
	business.bsn_address,  document_proposal_name.dpn_unique_id, document_proposal_name.dpn_pbns_hide,
	business_sellers.bs_pbns_last_spoken_user, document_proposal_name.dpn_create_date, business_sellers.bs_pbns_ppd ,
	business_sellers.bs_pbns_ppd_user,  document_proposal_name.dpn_dptr_hide, document_proposal_name.dpn_dptr_estimate_cost,
	document_proposal_name.dpn_dptr_es_date, document_proposal_name.dpn_dptr_es_user, document_proposal_name.dpn_proposal_number
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
	Right Join document_proposal_name On  business_sellers.bs_business_id = document_proposal_name.dpn_bsn_id
	 ". $where . " Order by document_proposal_name.dpn_unique_id ";	 

if($sql){$userData = $fwDb->query($sql);}

$total2 = sizeof($userData);
if(empty($pagenum)) { $pagenum = 1; }

$fwViewData['total'] =  $total2 - ($pagenum-1)*5000;


if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 5000;
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
		
		$dayscount='';
				
		if($v['bsn_initial_meeting_date']) {
			$ccdate = $v['bsn_initial_meeting_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
		 //Person Responsible
		 
		$sqlpr = "Select person_responsible_detail.* from person_responsible_detail
			  where person_responsible_detail.prd_bsn_id = ". $v['bsn_id'] . 
			" And person_responsible_detail.prd_position = 'Designer'  ";
		$dataDesig = $fwDb->queryOne($sqlpr);
		
		$sqlpoa = "Select person_responsible_detail.* from person_responsible_detail
			    where person_responsible_detail.prd_bsn_id = ". $v['bsn_id'] . 
			  " And person_responsible_detail.prd_position like '%Overseas Architect%' ";
		$dataOsa = $fwDb->queryOne($sqlpoa);
		
		// End Person Responsible.		


		if(!empty($designer))
		{
			
			if($dataDesig['prd_name'] == $designer)
			{
				$setdata2[$k]['dpn_dptr_hide'] = $v['dpn_dptr_hide'];
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id']; 
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['chknoData'] = $v['dpn_unique_id'];
				$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
				$setdata2[$k]['designer'] = $dataDesig['prd_name'];
				$setdata2[$k]['osarchi'] = $dataOsa['prd_name'];
				$setdata2[$k]['dayscount'] = $dayscount;
				$setdata2[$k]['dpn_dptr_estimate_cost'] = $v['dpn_dptr_estimate_cost'];
				$setdata2[$k]['dpn_dptr_es_date'] = $v['dpn_dptr_es_date'];
				$setdata2[$k]['dpn_dptr_es_user'] = $v['dpn_dptr_es_user'];
				$setdata2[$k]['dpn_proposal_number'] = $v['dpn_proposal_number'];
				
							
				foreach($colhead as $kk => $vv)
				{
				   $taskid = $vv['bst_task_id'];
					
				    $sql2 = "Select proposal_tasks.* from proposal_tasks
					     where proposal_tasks.bt_bsn_id = ". $v['bsn_id']. " And proposal_tasks.bt_task_id = " .$vv['bst_task_id'];
				   
				    $data2 = $fwDb->queryOne($sql2);
				    $taskdata[$taskid] = changedate_d_m_y($data2['bt_completed_date']);
				}
		
				$setdata2[$k]['task'] = $taskdata;
			} 
		} 
		elseif(!empty($architect))  
		{
			
			if($dataOsa['prd_name'] == $architect)
			{
				$setdata2[$k]['dpn_dptr_hide'] = $v['dpn_dptr_hide'];
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id']; 
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['chknoData'] = $v['dpn_unique_id'];
				$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
				$setdata2[$k]['designer'] = $dataDesig['prd_name'];
				$setdata2[$k]['osarchi'] = $dataOsa['prd_name'];
				$setdata2[$k]['dayscount'] = $dayscount;
				$setdata2[$k]['dpn_dptr_estimate_cost'] = $v['dpn_dptr_estimate_cost'];
				$setdata2[$k]['dpn_dptr_es_date'] = $v['dpn_dptr_es_date'];
				$setdata2[$k]['dpn_dptr_es_user'] = $v['dpn_dptr_es_user'];
				$setdata2[$k]['dpn_proposal_number'] = $v['dpn_proposal_number'];
							
				foreach($colhead as $kk => $vv)
				{
				   $taskid = $vv['bst_task_id'];
					
				    $sql2 = "Select proposal_tasks.* from proposal_tasks
					     where proposal_tasks.bt_bsn_id = ". $v['bsn_id']. " And proposal_tasks.bt_task_id = " .$vv['bst_task_id'];
				   
				    $data2 = $fwDb->queryOne($sql2);
				    $taskdata[$taskid] = changedate_d_m_y($data2['bt_completed_date']);
				}
		
				$setdata2[$k]['task'] = $taskdata;
			} 
			
		}
		
		
		
		else {
			$setdata2[$k]['dpn_dptr_hide'] = $v['dpn_dptr_hide'];
			$setdata2[$k]['bsn_id'] = $v['bsn_id'];
			$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id']; 
			$setdata2[$k]['bsn_address'] = $v['bsn_address'];
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['chknoData'] = $v['dpn_unique_id'];
			$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
			$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
			$setdata2[$k]['designer'] = $dataDesig['prd_name'];
			$setdata2[$k]['osarchi'] = $dataOsa['prd_name'];
			$setdata2[$k]['dayscount'] = $dayscount;
			$setdata2[$k]['dpn_dptr_estimate_cost'] = $v['dpn_dptr_estimate_cost'];
			$setdata2[$k]['dpn_dptr_es_date'] = $v['dpn_dptr_es_date'];
			$setdata2[$k]['dpn_dptr_es_user'] = $v['dpn_dptr_es_user'];
			$setdata2[$k]['dpn_proposal_number'] = $v['dpn_proposal_number'];
						
			foreach($colhead as $kk => $vv)
			{
			   $taskid = $vv['bst_task_id'];
				
			    $sql2 = "Select proposal_tasks.* from proposal_tasks
				     where proposal_tasks.bt_bsn_id = ". $v['bsn_id']. " And proposal_tasks.bt_task_id = " .$vv['bst_task_id'];
			   
			    $data2 = $fwDb->queryOne($sql2);
			    $taskdata[$taskid] = changedate_d_m_y($data2['bt_completed_date']);
			}
	
			$setdata2[$k]['task'] = $taskdata;
			
		}
			
}

	$fwViewData['list'] =  $setdata2;
 	
 }
}

$table_toplink->setWhere("tl_slug = 'design_process_task_report'");
$fwViewData['proc_detail'] = $table_toplink->getRow();



//        $sortbydesigner = $fwRequest->getParam('sortbydesigner','');
//	if($sortbydesigner):
//
//		 foreach ($setdata2 as $key => $row) {
//	   
//			 $desig[$key]  = $row['designer'];
//		}
//			if($ascdsc==1) {
//				array_multisort($desig, SORT_ASC, $setdata2);
//			} else {
//				array_multisort($desig, SORT_DESC, $setdata2);
//			}
//	
//	
//		$fwViewData['list'] =  $setdata2;
//	endif;
//	

// Export to Excel

$sql_d = "SELECT DISTINCT prd_name FROM person_responsible_detail WHERE prd_position = 'Designer' order by prd_name";
$sql_a = "SELECT DISTINCT prd_name FROM person_responsible_detail WHERE prd_position = 'Overseas Architect' order by prd_name";

$fwViewData['data_d'] = $fwDb->query($sql_d);
$fwViewData['data_a'] = $fwDb->query($sql_a);

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
							 ->setDescription("Design q/a report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Design Process Task Report");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);

$objPHPExcel->getActiveSheet()->getStyle('G1:BR1')->getAlignment()->setWrapText(true); 

$j=6;
	foreach($colhead as $ke=>$ve)
	{		
		$objPHPExcel->getActiveSheet()->getColumnDimension($col2[$j])->setWidth(15);
		$j++;	
	}
	


// Add some data
$objPHPExcel->setActiveSheetIndex(0)
       			 ->setCellValue('A1', 'Address')
           		 ->setCellValue('B1', 'Customer Name')
			 ->setCellValue('C1', 'Revelent Checklist')
			 ->setCellValue('D1', 'Designer')
			 ->setCellValue('E1', 'Overseas Architect')
			 ->setCellValue('F1', 'Day Count');
			 
	$i=6;
	foreach($heading as $ke2=>$ve2)
	{		
		$objPHPExcel->setActiveSheetIndex(0)->setCellValue($col[$i],$ve2);
		$i++;	
	}		 

    ;

$from = "A1"; // or any value
$to = "BR1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	$cno = 6;
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['bsn_address'])
				->setCellValue('B'.$row, $v['bcust_fname'] . ' ' .$v['bcust_lname'])
				->setCellValue('C'.$row, $v['chknoData'])
				->setCellValue('D'.$row, $v['designer'])
				->setCellValue('E'.$row, $v['osarchi'])
				->setCellValue('F'.$row, $v['dayscount']);
	
	
	foreach($setdata2[$k]['task'] as $kc=>$vc)
	{
		$objPHPExcel->getActiveSheet()->setCellValue($col2[$cno].$row , $vc);
		$cno++;
	}
                               
	$row= $row+1;			
	
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Design Process Task Report');
$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="design_process_task_report.xls"');
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