<?php
$pagenum = $fwRequest->getparam('pagenum','');

$tablebusiness = new Fw_Db_Table('business');
$searchaddr = $fwRequest->getParam('searchaddr', '');
$searchchk = $fwRequest->getParam('searchchk', '');

$tabledpn = new Fw_Db_Table('document_renovation_name');

// Save Signed Designed Agreement
$sda_date = $fwRequest->getParam('sda_date', '');
if(!empty($sda_date)) {
	$sda = $fwRequest->getParam('sda', '');
	$key = array_keys($sda);
	$ky = $key[0];
	$ecDetail['dpn_rdr_sda_date'] = $sda[$ky];
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$detail = $tabledpn->updateRow($ecDetail);		
}
// End Signed Designed Agreement


// Save Hide
$hide = $fwRequest->getParam('hide', '');
if(!empty($hide)) {
	$key = array_keys($hide);
	$ky = $key[0];
	$hideDetail['dpn_rdr_hide'] = $hide[$ky];
	$tabledpn->setWhere('dpn_unique_id = '.$ky);
	$hdetail = $tabledpn->updateRow($hideDetail);		
}
// End Hide


$fwViewData['ran'] =  rand(100000,999999);


$where = " WHERE document_renovation_name.dpn_rdr_hide = 0 ";
$unhide = $fwRequest->getParam('unhide', '');
if($unhide)
{
$where = " WHERE 1 = 1 ";		
}


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

 
     $sql = "Select business.bsn_id, business.bsn_address, business.bsn_status_sys_date , document_renovation_name.* , 
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
		if($v['bsn_status_sys_date']) {
			$ccdate = $v['bsn_status_sys_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
		 $sql10 = "Select doc_file_name, doc_date_uploaded from document_check_list_renovation
			    where doc_bsn_id  = ". $v['bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'] ." and doc_name_id  = 10";
	         $data10 = $fwDb->queryOne($sql10);
		 
		  $sql2 = "Select doc_file_name, doc_date_uploaded from document_check_list_renovation
			    where doc_bsn_id  = ". $v['bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'] ." and doc_name_id  = 2";
	         $data2 = $fwDb->queryOne($sql2);
		 
 
		 
		
		 $sql18 = "Select doc_file_name, doc_date_uploaded from document_check_list_renovation
			    where doc_bsn_id  = ". $v['bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'] ." and doc_name_id  = 18";
		
		 $data18 = $fwDb->queryOne($sql18);
		
		 $sql19 = "Select doc_file_name, doc_date_uploaded from document_check_list_renovation
			    where doc_bsn_id  = ". $v['bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'] ." and doc_name_id  = 19";
		
		 $data19 = $fwDb->queryOne($sql19);
		 
		 $sql9 = "Select doc_file_name, doc_date_uploaded from document_check_list_renovation
			  where doc_bsn_id  = ". $v['bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'] ." and doc_name_id  = 9";
	
		 $data9 = $fwDb->queryOne($sql9);
		
		 $sql12 = "Select doc_file_name, doc_date_uploaded from document_check_list_renovation
			  where doc_bsn_id  = ". $v['bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'] ." and doc_name_id  = 12";
	
		 $data12 = $fwDb->queryOne($sql12);
	
		 $sql13 = "Select doc_file_name, doc_date_uploaded from document_check_list_renovation
			  where doc_bsn_id  = ". $v['bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'] ." and doc_name_id  = 13";
	
		 $data13 = $fwDb->queryOne($sql13);
	
		 
		 $sql24 = "Select doc_file_name, doc_date_uploaded from document_check_list_renovation
			    where doc_bsn_id  = ". $v['bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'] ." and doc_name_id  = 24";
	         $data24 = $fwDb->queryOne($sql24);
		
		 $sql21 = "Select doc_file_name, doc_date_uploaded from document_check_list_renovation
			    where doc_bsn_id  = ". $v['bsn_id']. " and doc_checklist_number = " .$v['dpn_proposal_number'] ." and doc_name_id  = 21";
	         $data21 = $fwDb->queryOne($sql21);
		
			 
				$setdata2[$k]['bsn_id'] = $v['bsn_id'];
				$setdata2[$k]['bsn_address'] = $v['bsn_address'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['dpn_unique_id'] = $v['dpn_unique_id'];
				$setdata2[$k]['dayscount'] = $dayscount;
	
				$setdata2[$k]['bcust_fname'] = $custdata['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $custdata['bcust_lname'];
				$setdata2[$k]['bcust_misc_email1'] = $custdata['bcust_misc_email1'];
				$setdata2[$k]['bcust_misc_email2'] = $custdata['bcust_misc_email2'];
				$setdata2[$k]['bcust_misc_moble'] = $custdata['bcust_misc_moble'];
				$setdata2[$k]['bcust_misc_business'] = $custdata['bcust_misc_business'];
				$setdata2[$k]['bcust_misc_home'] = $custdata['bcust_misc_home'];
				
				$setdata2[$k]['doc10'] = $data10['doc_file_name'];
				$setdata2[$k]['date10'] = changedate_d_m_y($data10['doc_date_uploaded']);
				
				$setdata2[$k]['doc2'] = $data2['doc_file_name'];
				$setdata2[$k]['date2'] = changedate_d_m_y($data2['doc_date_uploaded']);
				
				$setdata2[$k]['doc18'] = $data18['doc_file_name'];
				$setdata2[$k]['date18'] = changedate_d_m_y($data18['doc_date_uploaded']);
				
				$setdata2[$k]['doc19'] = $data19['doc_file_name'];
				$setdata2[$k]['date19'] = changedate_d_m_y($data19['doc_date_uploaded']);
				
				$setdata2[$k]['doc9'] = $data9['doc_file_name'];
				$setdata2[$k]['date9'] = changedate_d_m_y($data9['doc_date_uploaded']);
				
				$setdata2[$k]['doc12'] = $data12['doc_file_name'];
				$setdata2[$k]['date12'] = changedate_d_m_y($data12['doc_date_uploaded']);
				
				$setdata2[$k]['doc13'] = $data13['doc_file_name'];
				$setdata2[$k]['date13'] = changedate_d_m_y($data13['doc_date_uploaded']);
				$setdata2[$k]['dpn_rdr_sda_date'] = $v['dpn_rdr_sda_date'];
				
				$setdata2[$k]['doc24'] = $data24['doc_file_name'];
				$setdata2[$k]['date24'] = changedate_d_m_y($data24['doc_date_uploaded']);
				
				$setdata2[$k]['doc21'] = $data21['doc_file_name'];
				$setdata2[$k]['date21'] = changedate_d_m_y($data21['doc_date_uploaded']);
				
				$setdata2[$k]['dpn_rdr_hide'] = $v['dpn_rdr_hide'];
				
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
$fwViewData['title'] = "Renovation Document Report";

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