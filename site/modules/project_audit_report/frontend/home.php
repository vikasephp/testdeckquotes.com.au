<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');
$tableBusiness = new Fw_Db_Table('business');
$where = ' Where bsn_par_hide = 0';

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');


$clear = $fwRequest->getParam('clear', '');
if(!empty($clear)) {
	unset($_SESSION['status_search']);
}

$show_hidden = $fwRequest->getParam('show_hidden', '');
if(!empty($show_hidden)) {
     $where = ' where 1 =  1';
}



$status_search = $fwRequest->getParam('status_search', '');
if(!empty($status_search)) {
	$where .= " and business.bsn_status like '%|".$status_search."|%'";
	$_SESSION['status_search'] = $status_search;
}
else if(!empty($_SESSION['status_search'])) {
	$where .= " and business.bsn_status like '%|".$_SESSION['status_search']."|%'";
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_1 = array_keys($hide);
	 $ky_1 = $keys_1[0];
	 $val_1 = $hide[$ky_1];
	
	  $detail_h['bsn_par_hide'] = $val_1;
	  
	  $tableBusiness->setWhere("bsn_id = ".$ky_1);
	  if($tableBusiness->rowExists())
	  {
		 $this_id = $tableBusiness->updateRow($detail_h);
	  }	  	
}


$last_audit = $fwRequest->getParam('last_audit', '');
if($last_audit)
{
	 $keys_2 = array_keys($last_audit);
	 $ky_2 = $keys_2[0];
	 $val_2 = $last_audit[$ky_2];
	
	  $detail['bs_xry_last_audit'] = $val_2;
	  $detail['bs_xry_last_audit_user'] = $_SESSION['user']['user_name'];
	  $detail['bs_xry_last_audit_date'] = date('d-m-Y');
	  
	  $table->setWhere("bs_business_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$clear_search = $fwRequest->getParam('clear_search', '');
if(!empty($clear_search)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
}

$keyword = $fwRequest->getParam('keyword', '');
if($keyword):
		$where .= " AND  business.bsn_name LIKE '%".$keyword."%'";
        $_SESSION['keyword'] = $keyword;
elseif($_SESSION['keyword']):
		$where .= " AND business.bsn_name LIKE '%".$_SESSION['keyword']."%' ";	      
endif;


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id, 
		business.bsn_par_myob_pay, business.bsn_par_myob_user, business.bsn_par_myob_date , business.bsn_par_myob_link, 
		business.bsn_par_myob_link_date , business.bsn_par_audit , business.bsn_par_hide
		from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " And business.bsn_status like '%|2|%'  
		Group By business.bsn_id
		
UNION

		SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id ,
		business.bsn_par_myob_pay, business.bsn_par_myob_user, business.bsn_par_myob_date , business.bsn_par_myob_link,
		business.bsn_par_myob_link_date , business.bsn_par_audit , business.bsn_par_hide
		from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " And business.bsn_status like '%|5|%'  
		Group By business.bsn_id

UNION

SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id , 
		business.bsn_par_myob_pay, business.bsn_par_myob_user, business.bsn_par_myob_date , business.bsn_par_myob_link,
		business.bsn_par_myob_link_date , business.bsn_par_audit , business.bsn_par_hide
		from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " And business.bsn_status like '%|6|%'  
		Group By business.bsn_id

UNION

SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id , 
		business.bsn_par_myob_pay, business.bsn_par_myob_user, business.bsn_par_myob_date , business.bsn_par_myob_link, 
		business.bsn_par_myob_link_date, business.bsn_par_audit , business.bsn_par_hide
		from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " And business.bsn_status like '%|3|%'  
		Group By business.bsn_id

UNION

SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id ,
		business.bsn_par_myob_pay, business.bsn_par_myob_user, business.bsn_par_myob_date , business.bsn_par_myob_link, 
		business.bsn_par_myob_link_date , business.bsn_par_audit , business.bsn_par_hide
		from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " And business.bsn_status like '%|4|%'  
		Group By business.bsn_id";


if($sql){$userData = $fwDb->query($sql);}
$total2 = sizeof($userData);
$fwViewData['active'] =  $total2;

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 350;
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
		
		$status_string = "'".$v['bsn_status']."'";
		$status='';
		
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre Construction<br>" ; }
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
		
		$sqltot = "select ppd_hia_value, ppd_value, ppd_when_payrec, ppd_inv_due_date from  progress_payment_detail where ppd_bsn_id = ".$v['bsn_id'];
		$totdata = $fwDb->query($sqltot);
		
		$total1 = 0;
		$total2 = 0;
		$mpay = 0;
		
		foreach($totdata as $kt=>$vt)
		{
			$value1=0;
			if(!empty($vt['ppd_hia_value'])) {
				$value1 = $vt['ppd_hia_value'];
				$value1 = str_replace('$','',$value1);
				$value1 = str_replace(',','',$value1);
				$total1 = (float)$total1 + (float)$value1;	
			}
		}
		foreach($totdata as $kt=>$vt)
		{

			$value2=0;
			if(!empty($vt['ppd_value'])) {
				$value2 = $vt['ppd_value'];
				$value2 = str_replace('$','',$value2);
				$value2 = str_replace(',','',$value2);
				$total2 = (float)($total2) + (float)($value2);	
			}
		}
		
		$link = $BASE_URL."business.detail/bsn_id/".$v['bsn_id'];	
	
	    $setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $status;
		$setdata2[$k]['hia_value'] = number_format($total1, 2, '.', ',');
		$setdata2[$k]['total_value'] = number_format($total2, 2, '.', ',');
		$setdata2[$k]['PaidVHia'] = number_format($total1 - $total2, 2, '.', ',');
		$mpay = $v['bsn_par_myob_pay'];
		$mpay = str_replace('$','',$mpay);
		$mpay = str_replace(',','',$mpay);	
		
		$diff='';
		if($mpay>0) {
			$diff = $mpay - $total2;
		}
		
		if(!empty($mpay)) {
			$setdata2[$k]['difference'] = number_format($diff, 2, '.', ',');	
		} else {
			$setdata2[$k]['difference'] = '';
		}
		
		$diff_hia='';
		if($mpay>0) {
			$diff_hia = $mpay - $total1;
		}
		
		if(!empty($mpay)) {
			$setdata2[$k]['hia_difference'] = number_format($diff_hia, 2, '.', ',');	
		} else {
			$setdata2[$k]['hia_difference'] = '';
		}
		
		
}
 
 	$filter_comp = $fwRequest->getParam('filter_comp', '');
	if(!empty($filter_comp)) {
		foreach($setdata2 as $m1 => $s1)
		{
			$pos = strpos($s1['status'] , 'Complete' ,0 ) ;
			if(!is_numeric($pos)) {
				unset($setdata2[$m1]);	 
			}
		}
	}
	
	$filter_const = $fwRequest->getParam('filter_const', '');
	if(!empty($filter_const)) {
		foreach($setdata2 as $m1 => $s1)
		{
			$pos = strpos($s1['status'] , 'Construction' ,0 ) ;
			if(!is_numeric($pos)) {
				unset($setdata2[$m1]);	 
			}
		}
	}
	
 
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
							 ->setDescription("Project Audit report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Project Audit Report");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);


// Add some data
$objPHPExcel->setActiveSheetIndex(0)
       		->setCellValue('A1', 'Project Address')
           	->setCellValue('B1', "Status's")
			->setCellValue('C1', "MYOB Payments")
			->setCellValue('D1', "Project Paid Payments")
			->setCellValue('E1', "Difference")
			->setCellValue('F1', "HIA Value")
			->setCellValue('G1', "HIA Difference")
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
				->setCellValue('B'.$row, str_replace("<br>",", ",$v['status']))
				->setCellValue('C'.$row, $v['bsn_par_myob_pay'])
				->setCellValue('D'.$row, $v['total_value'])
				->setCellValue('E'.$row, $v['difference'])
				->setCellValue('F'.$row, $v['hia_value'])
				->setCellValue('G'.$row, $v['hia_difference'])
				;
					
	$row= $row+1;				
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Project Audit Report');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="project_audit_report.xls"');
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

$sqlaa = "Select * from audit_admin ";
$fwViewData['auditData'] = $fwDb->query($sqlaa);


$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Project Audit Report";
