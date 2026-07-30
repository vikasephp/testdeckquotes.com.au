<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('design_report_hide');
$tableBusiness = new Fw_Db_Table('business');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');
$tabledeqa = new Fw_Db_Table('document_proposal_name');

$sod = 0;
$sortbydesigner = $fwRequest->getParam('sortbydesigner', '');
if(!empty($sortbydesigner)) {
	$sod = 1;	
}


// Sava Will the customer buy
$will = $fwRequest->getParam('will', '');
if(!empty($will)) {
	$id = $fwRequest->getParam('will', '');
	$key = array_keys($id);
	$ky = $key[0];
	$dt = date('d-m-Y');
	$user = $_SESSION['user']['user_name'];
	$hideDetail['bs_dqr_customer_buy'] = $id[$ky];
	$hideDetail['bs_dqr_will_date'] = $dt;
	$hideDetail['bs_dqr_will_user'] = $user;
	$tablebs->setWhere('bs_business_id = '.$ky);
	$detail = $tablebs->updateRow($hideDetail);		
}
//End Will the customer buy

// Sava Can we legally build it (Planning)
$legally = $fwRequest->getParam('legally', '');
if(!empty($legally)) {
	$id = $fwRequest->getParam('legally', '');
	$key = array_keys($id);
	$ky = $key[0];
	$dt = date('d-m-Y');
	$user = $_SESSION['user']['user_name'];
	$hideDetail['bs_dqr_we_legally'] = $id[$ky];
	$hideDetail['bs_dqr_legally_date'] = $dt;
	$hideDetail['bs_dqr_legally_user'] = $user;
	$tablebs->setWhere('bs_business_id = '.$ky);
	$detail = $tablebs->updateRow($hideDetail);		
}
//End Can we legally build it (Planning)

// Sava Can we practically build (Construction) 
$practically = $fwRequest->getParam('practically', '');
if(!empty($practically)) {
	$id = $fwRequest->getParam('practically', '');
	$key = array_keys($id);
	$ky = $key[0];
	$dt = date('d-m-Y');
	$user = $_SESSION['user']['user_name'];
	$hideDetail['bs_dqr_practically_date'] = $dt;
	$hideDetail['bs_dqr_practically_user'] = $user;	
	$hideDetail['bs_dqr_we_practically'] = $id[$ky];
	$tablebs->setWhere('bs_business_id = '.$ky);
	$detail = $tablebs->updateRow($hideDetail);		
}
//End 	Can we practically build (Construction) 


// Sava Will the customer buy
$will = $fwRequest->getParam('will', '');
if(!empty($will)) {
	$id = $fwRequest->getParam('will', '');
	$key = array_keys($id);
	$ky = $key[0];
	$hideDetail['bs_dqr_customer_buy'] = $id[$ky];
	$tablebs->setWhere('bs_business_id = '.$ky);
	$detail = $tablebs->updateRow($hideDetail);		
}
//End Will the customer buy

$savedata = $fwRequest->getParam('savedata', '');
if($savedata) { 

if($_FILES['first_review'])
		{
			$chkno = $fwRequest->getParam('chkno', '');
			
			$doc1 = $_FILES['first_review']['name'];
			$file_type = $_FILES['first_review']['type'];	
						
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
			$src =  $_FILES['first_review']['tmp_name']; 
			
			upload($doc1, $src);
			$fileData['dpn_qarep_const_1_review'] = $doc1;
			

				
				$tabledeqa->setWhere('dpn_unique_id = '.$chkno);
				if($tabledeqa->rowExists())
				{
					$id = $tabledeqa->updateRow($fileData);	
				}		
		}
	
}



$where  = " where dpn_dr_hide = 0";
$fwViewData['ran'] =  rand(100000,999999);
		
	
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		

$ord = " Order By document_check_list.doc_date_uploaded DESC ";

//$searchkey = $fwRequest->getParam('searchkey', '');
//
//  if($searchkey):
//
//        $where .= " AND business.bsn_address  LIKE '%".$searchkey."%' OR 
//                    bus_customers.bcust_fname LIKE '%".$searchkey."%' OR  
//	            bus_customers.bcust_lname LIKE '%".$searchkey."%' ";
//	
//		$_SESSION['searchkey'] = $searchkey;
//		$fwViewData['searchkey']=$_SESSION['searchkey'];
//
//   elseif($_SESSION['searchkey'] && $pagenum > 0):
//		
//      $where .= " AND business.bsn_address LIKE  '%".$_SESSION['searchkey']."%' OR
//                  bus_customers.bcust_fname LIKE '%".$_SESSION['searchkey']."%' OR  
//	          bus_customers.bcust_lname LIKE '%".$_SESSION['searchkey']."%' ";
//			
//	        $fwViewData['searchkey']=$_SESSION['searchkey'];
//
//   elseif(isset($_SESSION['searchkey'])) :
//    		
//	$where .= " AND business.bsn_address LIKE  '%".$_SESSION['searchkey']."%' OR
//                  bus_customers.bcust_fname LIKE '%".$_SESSION['searchkey']."%' OR  
//	          bus_customers.bcust_lname LIKE '%".$_SESSION['searchkey']."%' ";	
//  endif;

  $clear = $fwRequest->getParam('clear', '');

  if($clear)
  {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	$where = "WHERE 1=1 ";
 }


 $sql = "Select  dpn_bsn_id, dpn_unique_id,
	  dpn_dr_survey_imp_user,  dpn_dr_cust_budget, dpn_dr_budg_user, dpn_dr_budg_date, dpn_dr_letter_text, dpn_dr_scan,
	  dpn_dr_likely_value, dpn_dr_hide, dpn_dr_latest_letter,  dpn_dr_ebc_comm, dpn_dr_erc_comm, dpn_dr_likey_comm, 
	  dpn_dr_re_comm, dpn_dr_alerts, dpn_qarep_const_1_review, dpn_dr_wherewe
	  from document_proposal_name " .$where;

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

 $setdata2 = $fwDb->query($sql2);
 
 $k = 0;
foreach($setdata2 as $k2 => $v)
{
	
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		$dayscount='';
		
		
		$sql_bus = "SELECT  business_sellers.bs_business_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id,
			business.bsn_name,  business.bsn_address, business.bsn_advert_text, business_sellers.bs_dqr_will_date,
			business_sellers.bs_dqr_will_user, bs_dqr_legally_date, bs_dqr_legally_user, bs_dqr_practically_date , bs_dqr_practically_user,
			business.bsn_estimate_cost,  business_sellers.bs_qarep_estimate_cost, 
			business_sellers.bs_dqr_customer_buy, business_sellers.bs_dqr_we_legally, business_sellers.bs_dqr_we_practically
			from business_sellers 		
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id  where business.bsn_id = " .$v['dpn_bsn_id'];
		
		$busData = $fwDb->queryOne($sql_bus);
		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['dpn_bsn_id'];
		
		$sql45 = "Select doc_date_uploaded from document_check_list
	                  where doc_name_id = 45 and doc_bsn_id = ".$v['dpn_bsn_id'];
	
		$data45 = $fwDb->queryOne($sql45);
		
		$Statusdate = changedate_y_m_d($data45['doc_date_uploaded']);
		
		if(!empty($Statusdate))
		{
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		
		
		$sqlcn = "Select  dpn_bsn_id, dpn_unique_id, dpn_qarep_const_1_review from document_proposal_name 
			where  dpn_bsn_id = ". $v['dpn_bsn_id'] . " And dpn_dr_hide = 0";
		$chknoData = $fwDb->query($sqlcn);

		$totchkno = count($chknoData);
		
		
		// Customer Designer QA sign off 
		
		$sqlcp = "SELECT document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded ,
		document_proposal_name.dpn_unique_id
		FROM document_proposal_name
		inner join document_check_list_mini ON ( document_proposal_name.dpn_bsn_id = document_check_list_mini.doc_bsn_id
		AND document_proposal_name.dpn_proposal_number = document_check_list_mini.doc_checklist_number )
		WHERE doc_name_id = 59
		AND document_proposal_name.dpn_bsn_id = " .  $v['dpn_bsn_id'];
		
		$qaData = $fwDb->query($sqlcp);
		
		// Customer Designer QA sign off  Ends
		
		// Phone follow ups
		
		 $sqlalert = "Select count(*) as tot from  business_alert
		             where be_business_id = ".$v['dpn_bsn_id'] . " AND business_alert.be_alert_active = 'Yes' ";
      		 $alertData = $fwDb->queryOne($sqlalert);
		 
		
		// Person Responsible
		 
		$sqlpr = "Select person_responsible_detail.* from person_responsible_detail
			  where person_responsible_detail.prd_bsn_id = ". $v['dpn_bsn_id'] . 
			" And person_responsible_detail.prd_position = 'Designer' ";
		$dataDesig = $fwDb->queryOne($sqlpr);
		
		
		$sqlpoa = "Select person_responsible_detail.* from person_responsible_detail
			    where person_responsible_detail.prd_bsn_id = ". $v['dpn_bsn_id'] . 
			  " And person_responsible_detail.prd_position like '%Overseas Architect%' ";
		$dataOsa = $fwDb->queryOne($sqlpoa);
		
		// End Person Responsible.		


		// Latest Merged Plans
		
		$sqlmp = "SELECT document_check_list_mini.doc_file_name, document_proposal_name.dpn_unique_id
			FROM document_proposal_name
			inner join document_check_list_mini ON ( document_proposal_name.dpn_bsn_id = document_check_list_mini.doc_bsn_id
			AND document_proposal_name.dpn_proposal_number = document_check_list_mini.doc_checklist_number )
			WHERE doc_name_id =20
			AND document_proposal_name.dpn_bsn_id = " .  $v['dpn_bsn_id'];
		
		$mpData = $fwDb->query($sqlmp);
		
		// End Latest Merged Plans
		
		
		// Ssp completed
		
		$sqlssp = "Select doc_file_name, doc_date_uploaded from document_check_list_mini where  doc_bsn_id  = ". $v['dpn_bsn_id']
		         . " And doc_name_id = 31 ";
		$sspData = $fwDb->query($sqlssp);
		
		// End ssp completed
		
		
				$setdata2[$k]['chknoData'] = $v['dpn_unique_id'];
				$setdata2[$k]['bsn_id'] = $busData['bsn_id'];
				$setdata2[$k]['bs_customers_id'] = $busData['bs_customers_id']; 
				$setdata2[$k]['bsn_address'] = $busData['bsn_address'];
				$setdata2[$k]['link'] = $link;
				$setdata2[$k]['bs_dqr_customer_buy'] = $busData['bs_dqr_customer_buy'];
				$setdata2[$k]['bs_dqr_we_legally'] = $busData['bs_dqr_we_legally'];
				$setdata2[$k]['bs_dqr_we_practically'] = $busData['bs_dqr_we_practically'];
				$setdata2[$k]['dayscount'] = $dayscount;
				$setdata2[$k]['bcust_fname'] = $busData['bcust_fname'];
				$setdata2[$k]['bcust_lname'] = $busData['bcust_lname'];
				$setdata2[$k]['bsn_advert_text'] = $busData['bsn_advert_text'];
				$setdata2[$k]['bs_dqr_will_date'] = $busData['bs_dqr_will_date'];
				$setdata2[$k]['bs_dqr_will_user'] = $busData['bs_dqr_will_user'];
				$setdata2[$k]['designer'] = $dataDesig['prd_name'];
				$setdata2[$k]['osarchi'] = $dataOsa['prd_name'];
				$setdata2[$k]['lmpData'] = $mpData;
				$setdata2[$k]['qaData'] = $qaData;
				
				$setdata2[$k]['bs_qarep_estimate_cost'] = $busData['bs_qarep_estimate_cost'];
				//$setdata2[$k]['bs_qarep_where_we_are'] = $busData['bs_qarep_where_we_are'];
				
				$setdata2[$k]['bs_dqr_legally_date'] = $busData['bs_dqr_legally_date'];
				$setdata2[$k]['bs_dqr_legally_user'] = $busData['bs_dqr_legally_user'];
				
				$setdata2[$k]['bs_dqr_practically_date'] = $busData['bs_dqr_practically_date'];
				$setdata2[$k]['bs_dqr_practically_user'] = $busData['bs_dqr_practically_user'];
				$k++;	
					
				}
			

	$fwViewData['list'] =  $setdata2;
 	
 }
}


		foreach ($setdata2 as $key => $row) {
	   
			 $desig[$key]  = $row['dayscount'];
		   }
			
			array_multisort($desig, SORT_ASC, $setdata2);
			
			//array_multisort($desig, SORT_DESC, $setdata2);
	
		$fwViewData['list'] =  $setdata2;
		
		
		
		if($sod == 1) {
			foreach ($setdata2 as $key => $row) {
	   			 $desig[$key]  = $row['designer'];
		      }
			
			array_multisort($desig, SORT_ASC, $setdata2);
			$fwViewData['list'] =  $setdata2;
		}

// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
{
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

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
				->setCellValue('F'.$row, $v['dpn_dr_wherewe'])
				->setCellValue('G'.$row, $v['bsn_advert_text'])
				->setCellValue('H'.$row, $v['bs_qarep_estimate_cost'])

				;
					
	$row= $row+1;			
	
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Design QA Report');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="design_qa_report.xls"');
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