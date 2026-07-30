<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');
$tabletask = new Fw_Db_Table('business_tasks');
$tableBusiness = new Fw_Db_Table('business');

$fwViewData['ran'] =  rand(100000,999999);
$where = ' Where business.bsn_sir_hide = 0';
$ord = " order by business.bsn_status  ASC";

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');


$clear = $fwRequest->getParam('clear', '');
if(!empty($clear)) {
	unset($_SESSION['status_search']);
}

$showhidden = $fwRequest->getParam('showhidden', '');
if(!empty($showhidden)) {
	$where = ' Where 1 = 1';
}

$svb = $fwRequest->getParam('svb', '');

if($svb)
{  
 	 $keys_5 = array_keys($svb);
	 $ky_5 = $keys_5[0];
	 $val_5 = $svb[$ky_5];
			
	if($svb[$ky_5] == 1) {
		$detail_5['bt_complete'] = 1;
		$detail_5['bt_completed_date'] = date('Y-m-d H:i:s');
		
		$tabletask->setWhere('bt_bsn_id = '.$ky_5 .  ' and bt_task_id = 594  ');
		$detail = $tabletask->updateRow($detail_5);
	} else {
		$detail_5['bt_complete'] = 0;
		$detail_5['bt_completed_date'] = '0000-00-00 00:00:00';
		$tabletask->setWhere('bt_bsn_id = '.$ky_5 . ' and bt_task_id = 594  ');
		$detail = $tabletask->updateRow($detail_5);
		
	}
}

$svc = $fwRequest->getParam('svc', '');

if($svc)
{  
 	 $keys_6 = array_keys($svc);
	 $ky_6 = $keys_6[0];
	 $val_6 = $svc[$ky_6];
			
	if($svc[$ky_6] == 1) {
		$detail_6['bt_complete'] = 1;
		$detail_6['bt_completed_date'] = date('Y-m-d H:i:s');
		
		$tabletask->setWhere('bt_bsn_id = '.$ky_6 .  ' and bt_task_id = 303  ');
		$detail = $tabletask->updateRow($detail_6);
	} else {
		$detail_6['bt_complete'] = 0;
		$detail_6['bt_completed_date'] = '0000-00-00 00:00:00';
		$tabletask->setWhere('bt_bsn_id = '.$ky_6 . ' and bt_task_id = 303  ');
		$detail = $tabletask->updateRow($detail_6);
		
	}
}


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['bsn_sir_hide'] = $val_2;
	  
	  $tableBusiness->setWhere("bsn_id = ".$ky_2);
	  if($tableBusiness->rowExists())
	  {
		 $this_id = $tableBusiness->updateRow($detail);
	  }	  	
}




$clear_search = $fwRequest->getParam('clear_search', '');
if(!empty($clear_search)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
	unset($_SESSION['designer']);
	unset($_SESSION['client']);
}

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):
		$where .= " AND  business.bsn_name LIKE '%".$keyword."%'";
        $_SESSION['keyword'] = $keyword;
elseif($_SESSION['keyword']):
		$where .= " AND business.bsn_name LIKE '%".$_SESSION['keyword']."%' ";	      
endif;

$client = $fwRequest->getParam('client', '');
if($client):
		$where .= " AND  bus_customers.bcust_fname LIKE '%".$client."%'";
        $_SESSION['client'] = $client;
elseif($_SESSION['client']):
		$where .= " AND bus_customers.bcust_fname LIKE '%".$_SESSION['client']."%' ";	      
endif;



$bookingdate = $fwRequest->getParam('bookingdate', '');
if(!empty($bookingdate)) {
		$ord =  " ORDER BY if(  business.bsn_sir_book_date = ' '
         OR business.bsn_sir_book_date IS NULL , 1, 0 ) , STR_TO_DATE ( business.bsn_sir_book_date, '%d-%m-%Y' ) ASC";	
}


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id,
		business.bsn_suburb, bus_customers.bcust_misc_moble, business.bsn_sir_priority, business.bsn_sir_idm_date, business.bsn_sir_book_date,
		business.bsn_sir_book_time, business.bsn_sir_hide
	    from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	    And  business.bsn_sub_status = 'Open'
	    Group By business.bsn_id " .$ord ;


if($sql){$userData = $fwDb->query($sql);}


$total2 = sizeof($userData);
$fwViewData['active'] =  $total2;

$fwViewData['total'] = sizeof($userData);

$designer = $fwRequest->getParam('designer', '');

if(!empty($designer)) { $pgrow = 2500; } else { $pgrow = 350; }

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    //$page_rows = 350;
	$page_rows = $pgrow;
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
		$link = $BASE_URL."business.detail/bsn_id/".$v['bsn_id'];	
	    $setdata2[$k]['link'] = $link;
		
		$sqld = "select prd_name from person_responsible_detail where prd_bsn_id = ".$v['bsn_id']. " And prd_prm_id = 5";
		$datad = $fwDb->queryOne($sqld);
		
		$setdata2[$k]['designer'] = $datad['prd_name'];
		
		$sqluid205 = "Select business_tasks.bt_completed_date from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 205";
		$data205 = $fwDb->queryOne($sqluid205);
		
		$setdata2[$k]['uid205'] =  changedate_d_m_y($data205['bt_completed_date']);
		
		$sqluid594 = "Select business_tasks.bt_completed_date, business_tasks.bt_complete from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 594";
		$data594 = $fwDb->queryOne($sqluid594);
		
		$setdata2[$k]['uid594'] =  changedate_d_m_y($data594['bt_completed_date']);
		$setdata2[$k]['uid594_com'] = $data594['bt_complete'];
						
		$sqluid303 = "Select business_tasks.bt_completed_date, business_tasks.bt_complete from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 303";
		$data303 = $fwDb->queryOne($sqluid303);
		
		$setdata2[$k]['uid303'] =  changedate_d_m_y($data303['bt_completed_date']);
		$setdata2[$k]['uid303_com'] = $data303['bt_complete'];				
						
}
 
 	$designer = $fwRequest->getParam('designer', '');
	if(!empty($designer) ) {
		$_SESSION['designer'] = $designer;
		foreach($setdata2 as $m1 => $s1)
		{
			$pos = strpos($s1['designer'] , $designer ,0 ) ;
			if(!is_numeric($pos)) {
				unset($setdata2[$m1]);	 
			}
		}
	}
	
	
	$sortbydesigner = $fwRequest->getParam('sortbydesigner','');
	if($sortbydesigner):

		 foreach ($setdata2 as $key => $row) {
	   
			 $desig[$key]  = $row['designer'];
		   }
			
				array_multisort($desig, SORT_ASC, $setdata2);
	endif;
	
	$ddar = $fwRequest->getParam('ddar','');
	
	if($ddar ):
		//$_SESSION['ddar'] = $ddar;

		 foreach ($setdata2 as $key => $row) {
	   
	     $time = strtotime($row['uid205']);
		 $newformat = date('Y-m-d',$time);
		
			 $desig2[$key]  = $newformat;
		   }
			
				array_multisort($desig2, SORT_ASC, $setdata2);
	endif;
	
//	$filter_const = $fwRequest->getParam('filter_const', '');
//	if(!empty($filter_const)) {
//		foreach($setdata2 as $m1 => $s1)
//		{
//			$pos = strpos($s1['status'] , 'Construction' ,0 ) ;
//			if(!is_numeric($pos)) {
//				unset($setdata2[$m1]);	 
//			}
//		}
//	}
	
 
  	$fwViewData['list'] =  $setdata2;
			
 }
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
							 ->setCategory("Site Inspection Report");


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
       		->setCellValue('A1', 'Project Address')
           	->setCellValue('B1', "Designer")
			->setCellValue('C1', "Priority")
			->setCellValue('D1', "Date of IDM")
			->setCellValue('E1', "Date Design Agreement Signed")
			->setCellValue('F1', "Suburb Only")
			->setCellValue('G1', "Contact Info")
			->setCellValue('H1', "Booking Date")
			->setCellValue('I1', "Booking Time")
			->setCellValue('J1', "Site Visit Booked")
			->setCellValue('K1', "Site Visit Completed")
			
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
				->setCellValue('B'.$row, $v['designer'])
				->setCellValue('C'.$row, $v['bsn_sir_priority'])
				->setCellValue('D'.$row, $v['bsn_sir_idm_date'])
				->setCellValue('E'.$row, $v['uid205'])
				->setCellValue('F'.$row, $v['bsn_suburb'])
				->setCellValue('G'.$row, $v['bcust_misc_moble'])
				->setCellValue('H'.$row, $v['bsn_sir_book_date'])
				->setCellValue('I'.$row, $v['bsn_sir_book_time'])
				->setCellValue('J'.$row, $v['uid594'])
				->setCellValue('K'.$row, $v['uid303'])
						;
					
	$row= $row+1;			
	
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Site Inspections Report');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="site_inspections_report.xls"');
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

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Site Inspections Report";
