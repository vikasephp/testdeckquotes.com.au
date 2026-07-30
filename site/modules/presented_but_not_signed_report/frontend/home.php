<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');
$tablebusiness = new Fw_Db_Table('business');
$tabledpn = new Fw_Db_Table('document_proposal_name');
$searchaddr = $fwRequest->getParam('searchaddr', '');
$tablePT = new Fw_Db_Table('proposal_tasks');


$task72 = $fwRequest->getParam('task72', '');
if($task72)
{
	$prop_num = $fwRequest->getParam('prop_num', '');
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	 $keys_2 = array_keys($task72);
	 $ky_2 = $keys_2[0];
	 $val_2 = $task72[$ky_2];
	 
		 
	 if($val_2 == 1) {
		 $detail['bt_complete'] = $val_2;
		 $detail['bt_completed_by'] = $_SESSION['user']['user_id'];
		 $detail['bt_completed_date'] = date('Y-m-d h:m:s');
	 } else {
	
		 $detail['bt_complete'] = $val_2;
		 $detail['bt_completed_by'] = 0;
		 $detail['bt_completed_date'] = '';
	 }
	 
	 
	  $tablePT->setWhere("bt_bsn_id = ".$bsn_id . " and bt_task_id = 72 and bt_task_list_number = ".$prop_num);
	  if($tablePT->rowExists())
	  {
		 $this_id = $tablePT->updateRow($detail);
	  }	  		
}


$task33 = $fwRequest->getParam('task33', '');
if($task33)
{
	$prop_num = $fwRequest->getParam('prop_num', '');
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	 $keys_3 = array_keys($task33);
	 $ky_3 = $keys_3[0];
	 $val_3 = $task33[$ky_3];
	 
		 
	 if($val_3 == 1) {
		 $detail['bt_complete'] = $val_3;
		 $detail['bt_completed_by'] = $_SESSION['user']['user_id'];
		 $detail['bt_completed_date'] = date('Y-m-d h:m:s');
	 } else {
	
		 $detail['bt_complete'] = $val_3;
		 $detail['bt_completed_by'] = 0;
		 $detail['bt_completed_date'] = '';
	 }
	 
	 
	  $tablePT->setWhere("bt_bsn_id = ".$bsn_id . " and bt_task_id = 33 and bt_task_list_number = ".$prop_num);
	  if($tablePT->rowExists())
	  {
		 $this_id = $tablePT->updateRow($detail);
	  }	  		
}




$hiabooked = $fwRequest->getParam('hiabooked', '');
if(!empty($hiabooked)) {
	$ord =  " ORDER BY if(  business_sellers.bs_pbns_hia_signed = ' '
            OR business_sellers.bs_pbns_hia_signed IS NULL , 1, 0 ) , STR_TO_DATE( business_sellers.bs_pbns_hia_signed, '%d-%m-%Y' ) DESC";	
}

$sortdate = 0;
$meetingdate = $fwRequest->getParam('meetingdate', '');
if(!empty($meetingdate)) {
	$sortdate = 1;
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['dpn_pbns_hide'] = $val_2;
	  $tabledpn->setWhere("dpn_unique_id = ".$ky_2);
	  if($tabledpn->rowExists())
	  {
		 $this_id = $tabledpn->updateRow($detail);
	  }	  	
	

}

$where = " WHERE  document_proposal_name.dpn_pbns_hide = 1";
$fwViewData['ran'] =  rand(100000,999999);

$unhide = $fwRequest->getParam('unhide', '');
if(!empty($unhide)) {
	$where = " WHERE 1 = 1 ";	
}



// Save Hia Signed
$hia_signed = $fwRequest->getParam('hia_signed', '');
if(!empty($hia_signed)) {
	$hsdata = $fwRequest->getParam('hia_signed', '');
	$key = array_keys($hsdata);
	$ky = $key[0];
	$hsoDetail['bs_pbns_hia_signed'] = $hsdata[$ky];
	$table->setWhere('bs_business_id = '.$ky);
	$detail = $table->updateRow($hsoDetail);	
}
//End Hia Signed

$hide = $fwRequest->getParam('hide', '');
$unhide = $fwRequest->getParam('unhide', '');
$i = 0;


if(!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
}
	
if($keyword):
$where .= " AND document_proposal_name.dpn_unique_id = ".$keyword;
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND document_proposal_name.dpn_unique_id = ".$_SESSION['keyword'];
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
 $flat='';  
   
if($searchkey):

$flag = 'true';

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
	    bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_moble, 
	    bus_customers.bcust_misc_business, business_sellers.bs_pbns_hia_signed,
		business_sellers.bs_pbns_status,  business_sellers.bs_pbns_letter_text, business_sellers.bs_pbns_where_we_are,
		bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name,business.bsn_address,
		business.bsn_pbns_hide, document_proposal_name.dpn_unique_id, document_proposal_name.dpn_pbns_hide,
		document_proposal_name.dpn_create_date,document_proposal_name.dpn_proposal_number
	    from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Inner Join document_proposal_name On  business_sellers.bs_business_id = document_proposal_name.dpn_bsn_id
		". $where ." ".$ord;		



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

 $setdata2 = $fwDb->query($sql2);
 
 
 
foreach($setdata2 as $k => $v)
{
		
		$link = BASE_URL."business.detail/bsn_id/".$v['bsn_id'];
		
		$sqlpr1 = "select count(*) as tot from proposal_alert where be_business_id = ".$v['bsn_id'];  
		$prtot = $fwDb->queryOne($sqlpr1);
	
		$sqlpr2 = "select count(*) as act from proposal_alert where be_business_id = ".$v['bsn_id']. " And be_alert_active = 'Yes' ";  
		$pract = $fwDb->queryOne($sqlpr2);
		
		$sql8 = "SELECT proposal_tasks.bt_completed_date FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			   AND bt_task_id = 8 AND bt_task_list_number = " .$v['dpn_proposal_number'];
			
		$data8 = $fwDb->queryOne($sql8);
		
		
		$sql144 = "SELECT document_check_list_mini.doc_file_name, document_check_list_mini.doc_date_uploaded
				FROM document_check_list_mini
				INNER JOIN document_proposal_name ON document_check_list_mini.doc_bsn_id = document_proposal_name.dpn_bsn_id
				WHERE document_check_list_mini.doc_name_id = 144
				AND document_proposal_name.dpn_bsn_id =  " .$v['bsn_id'] . "
				AND document_proposal_name.dpn_unique_id =" .$v['dpn_unique_id'];
				 
		$data144 = $fwDb->queryOne($sql144);
		
	//	db($data144);
		
		$sql72 = "SELECT proposal_tasks.bt_completed_date, proposal_tasks.bt_complete FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			   AND bt_task_id = 72 AND bt_task_list_number = " .$v['dpn_proposal_number'];
			
		$data72 = $fwDb->queryOne($sql72);
		
	
		
		
		$sql33 = "SELECT proposal_tasks.bt_completed_date, proposal_tasks.bt_complete FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 33 AND bt_task_list_number = " .$v['dpn_proposal_number'];
			
		$data33 = $fwDb->queryOne($sql33);
		
		$sql70 = "SELECT proposal_tasks.bt_completed_date FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 70 AND bt_task_list_number = " .$v['dpn_proposal_number'];
			
		$data70 = $fwDb->queryOne($sql70);
		
		$sql25 = "SELECT proposal_tasks.bt_completed_date FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 25 AND bt_task_list_number = " .$v['dpn_proposal_number'];
			
		$data25 = $fwDb->queryOne($sql25);
		
		$sql53 = "SELECT proposal_tasks.bt_completed_date FROM proposal_tasks WHERE bt_bsn_id = " .$v['bsn_id'] . "
			      AND bt_task_id = 53 AND bt_task_list_number = " .$v['dpn_proposal_number'];
			
		$data53 = $fwDb->queryOne($sql53);
		
		
		
			    $setdata2[$k]['link'] = $link;
				$setdata2[$k]['prtot'] = $prtot['tot'];
				$setdata2[$k]['pract'] = $pract['act'];
				
				$setdata2[$k]['bt_complete_8'] = changedate_d_m_y($data8['bt_completed_date']);
				
				$setdata2[$k]['checklist144'] = $data144['doc_file_name'];
				$setdata2[$k]['checklist144_date'] = changedate_d_m_y($data144['doc_date_uploaded']);
				$setdata2[$k]['bt_complete_72'] = changedate_d_m_y($data72['bt_completed_date']);
				$setdata2[$k]['bt_complete_33'] = changedate_d_m_y($data33['bt_completed_date']);
				$setdata2[$k]['bt_complete_70'] = changedate_d_m_y($data70['bt_completed_date']);
				$setdata2[$k]['bt_complete_25'] = changedate_d_m_y($data25['bt_completed_date']);
				
				$setdata2[$k]['bt_comp_72'] = $data72['bt_complete'];
				$setdata2[$k]['bt_comp_33'] = $data33['bt_complete'];
				
				if(empty($data72)) {
					$setdata2[$k]['slider_no'] = 1;
				}
				
				if(empty($data33)) {
					$setdata2[$k]['slider_no_33'] = 1;
				}
				
}
			
			if($sortdate == 1) {
			  foreach ($setdata2 as $key => $row) {
				  
				    $time = strtotime($row['bt_complete_8']);

					
			 		$desig[$key]  = strtotime($row['bt_complete_8']);
		  		 }
			
		 	 array_multisort($desig, SORT_DESC, $setdata2);
			}
		 //array_multisort($desig, SORT_ASC, $setdata2);
			
	
 		$fwViewData['list'] =  $setdata2;

  }
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Presented But Not Signed Report";

$sqls = "select * from pbns_status ";
$fwViewData['statusData'] = $fwDb->query($sqls);


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
							 ->setDescription("Design report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Planning Task Tracker");


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
			 ->setCellValue('D1', 'Letter Text')
			 ->setCellValue('E1', 'Status')
			 ->setCellValue('F1', 'Where We are At')
			 ->setCellValue('G1', 'Proposal Alert Complete')
			 ->setCellValue('H1', 'Face to Face Meeting')
			 ->setCellValue('I1', 'Reviased Pdf Sent')
			 ->setCellValue('J1', 'Hia Item Sent')
			 ->setCellValue('K1', 'HIA Booked Date')
			 ->setCellValue('L1', 'HIA Signed')
			 ->setCellValue('M1', 'Project Handover ')
			 ->setCellValue('N1', 'Support Places Design On Website')
			 
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
				->setCellValue('C'.$row, $v['dpn_unique_id'])
				->setCellValue('D'.$row, $v['bs_pbns_letter_text'])
				->setCellValue('E'.$row, $v['bs_pbns_status'])
				->setCellValue('F'.$row, $v['bs_pbns_where_we_are'])
				->setCellValue('G'.$row, $v['pract'].'/'.$v['prtot'])
				->setCellValue('H'.$row, $v['bt_complete_8'])
				->setCellValue('I'.$row, $v['bt_complete_72'])
				
				->setCellValue('J'.$row, $v['bt_complete_33'])
				->setCellValue('K'.$row, $v['bs_pbns_hia_signed'])
				->setCellValue('L'.$row, $v['bt_complete_70'])
				->setCellValue('M'.$row, $v['bt_complete_25'])
				->setCellValue('N'.$row, $v['bt_complete_53'])
				;
					
	$row= $row+1;			
	
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Presented But Not Signed');

$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="presented_but_not_signed.xls"');
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
