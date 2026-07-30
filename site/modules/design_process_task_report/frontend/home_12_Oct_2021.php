<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('design_report_hide');
$tableBusiness = new Fw_Db_Table('business');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');

$sqlH = "Select bst_task_id, bst_task_name from proposal_task_list order by bst_task_id";
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

$where = "WHERE 1=1 ";
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

//$sql = "SELECT  business_sellers.bs_business_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id,
//        business.bsn_name,   business.bsn_address
//	from business_sellers 		
//	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
//	Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
//	" . $where. " Group By business.bsn_id " .$ord;
	 
	 
$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
	        bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_moble, 
		business.bsn_initial_meeting_date , 
		bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name,
		business.bsn_address,  document_proposal_name.dpn_unique_id, 
		document_proposal_name.dpn_pbns_hide, business_sellers.bs_pbns_last_spoken_user, 
		document_proposal_name.dpn_create_date, business_sellers.bs_pbns_ppd , business_sellers.bs_pbns_ppd_user
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Inner Join document_proposal_name On  business_sellers.bs_business_id = document_proposal_name.dpn_bsn_id
		 ". $where .  " Group By business.bsn_id ";	 

if($sql){$userData = $fwDb->query($sql);}

db($userData);



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
 
 $k = 0;
foreach($setdata as $k2 => $v)
{
	
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		$dayscount='';
		
		//$sqlhide = "Select business.bsn_dr_hide from business
//			    where business.bsn_dr_hide = 1 AND  business.bsn_id = ". $v['bsn_id'];
//		$hidedata = $fwDb->queryOne($sqlhide);	
		
				
		if($v['bsn_initial_meeting_date']) {
			$ccdate = $v['bsn_initial_meeting_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
		$sqlcn = "Select  dpn_bsn_id, dpn_unique_id from document_proposal_name 
			where  dpn_bsn_id = ". $v['bsn_id'];
		$chknoData = $fwDb->query($sqlcn);

		$totchkno = count($chknoData);
		
		
		// Customer Designer QA sign off 
		
		$sqlcp = "SELECT document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded ,
		document_proposal_name.dpn_unique_id
		FROM document_proposal_name
		inner join document_check_list_mini ON ( document_proposal_name.dpn_bsn_id = document_check_list_mini.doc_bsn_id
		AND document_proposal_name.dpn_proposal_number = document_check_list_mini.doc_checklist_number )
		WHERE doc_name_id = 59
		AND document_proposal_name.dpn_bsn_id = " .  $v['bsn_id'];
		
		$qaData = $fwDb->query($sqlcp);
		
		// Customer Designer QA sign off  Ends
		
		
		// Person Responsible
		 
		$sqlpr = "Select person_responsible_detail.* from person_responsible_detail
			  where person_responsible_detail.prd_bsn_id = ". $v['bsn_id'] . 
			" And person_responsible_detail.prd_position = 'Designer' ";
		$dataDesig = $fwDb->queryOne($sqlpr);
		
		
		$sqlpoa = "Select person_responsible_detail.* from person_responsible_detail
			    where person_responsible_detail.prd_bsn_id = ". $v['bsn_id'] . 
			  " And person_responsible_detail.prd_position like '%Overseas Architect%' ";
		$dataOsa = $fwDb->queryOne($sqlpoa);
		
		// End Person Responsible.		









		//if(!count($hidedata) > 0  ) 
//		{
			if($totchkno == 0)
			{
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id']; 
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
			        $setdata2[$k]['link'] = $link;
				$setdata2[$k]['chknoData'] = '';
				$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
			        $setdata2[$k]['bsn_advert_text'] = $v['bsn_advert_text'];
				$setdata2[$k]['designer'] = $dataDesig['prd_name'];
				$setdata2[$k]['osarchi'] = $dataOsa['prd_name'];
			        $setdata2[$k]['lmpData'] = $mpData;
				$setdata2[$k]['qaData'] = $qaData;
				$setdata2[$k]['dayscount'] = $dayscount;
				$k++;
			} 
			else
			{
				
				foreach($chknoData as $tk => $tv)
				{
					$setdata2[$k]['bsn_id'] = $v['bsn_id'];
					$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id']; 
					$setdata2[$k]['bsn_address'] = $v['bsn_address'];
					$setdata2[$k]['link'] = $link;
					$setdata2[$k]['chknoData'] = $tv['dpn_unique_id'];
					$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
					$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
					$setdata2[$k]['designer'] = $dataDesig['prd_name'];
					$setdata2[$k]['osarchi'] = $dataOsa['prd_name'];
					$setdata2[$k]['lmpData'] = $mpData;
					$setdata2[$k]['qaData'] = $qaData;
					$setdata2[$k]['dayscount'] = $dayscount;
					$k++;	
						
				}
			}
		//}
}


	$fwViewData['list'] =  $setdata2;
 	
 }
}

$table_toplink->setWhere("tl_slug = 'design_qa_report'");
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
							 ->setDescription("Design q/a report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Design Q/A Report");


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

// Add some data
$objPHPExcel->setActiveSheetIndex(0)
       			 ->setCellValue('A1', 'Address')
           		 ->setCellValue('B1', 'Customer Name')
			 ->setCellValue('C1', 'Revelent Checklist')
			 ->setCellValue('D1', 'Designer')
			 ->setCellValue('E1', 'Overseas Architect')
			 ->setCellValue('F1', 'Where Are We At')
			 ->setCellValue('G1', 'Customer Budget')
			 ->setCellValue('H1', 'Estimate Cost ')
;

$from = "A1"; // or any value
$to = "AZ1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['bsn_address'])
				->setCellValue('B'.$row, $v['bcust_fname'] . ' ' .$v['bcust_lname'])
				->setCellValue('C'.$row, $v['chknoData'])
				->setCellValue('D'.$row, $v['designer'])
				->setCellValue('E'.$row, $v['osarchi'])
				->setCellValue('F'.$row, $v['bs_qarep_where_we_are'])
				->setCellValue('G'.$row, $v['bsn_advert_text'])
				->setCellValue('H'.$row, $v['bs_qarep_estimate_cost'])
                               ;
	$row= $row+1;			
	
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Design Process Task Report');


// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="design_process_task_report.xls"');
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