<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');

$fwViewData['ran'] =  rand(100000,999999);
$where = ' Where business_sellers.bs_depo_report_hide  = 0 and business_sellers.bs_xry_add_to_deposite = 1';
$ord = " order by business.bsn_status  ASC";

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

$showall = $fwRequest->getParam('showall', '');
if(!empty($showall)) {
$where = ' Where business_sellers.bs_xry_add_to_deposite = 1';	
}

$clear = $fwRequest->getParam('clear', '');
if(!empty($clear)) {
	unset($_SESSION['status_search']);
}

$lettersave = $fwRequest->getParam('lettersave', '');
if(!empty($lettersave)) {
	$letter = $fwRequest->getParam('letter', '');	
	 
	 $keys_5 = array_keys($letter);
	 $ky_5 = $keys_5[0];
	 $val_5 = $letter[$ky_5];
	
	  $detail['bs_dr_letter'] = $val_5;
	  $detail['bs_dr_letter_user'] = $_SESSION['user']['user_name'];
	  $detail['bs_dr_letter_date'] = date('d-m-Y');
	  
	  $table->setWhere("bs_business_id = ".$ky_5);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
}

$status_search = $fwRequest->getParam('status_search', '');
if(!empty($status_search)) {
	$where .= " and business.bsn_status like '%|".$status_search."|%'";
	$_SESSION['status_search'] = $status_search;
}
else if(!empty($_SESSION['status_search'])) {
	$where .= " and business.bsn_status like '%|".$_SESSION['status_search']."|%'";
}

$last_audited = $fwRequest->getParam('last_audited', '');

if(!empty($last_audited))
{
  $table_la = new Fw_Db_Table('xray_last_audited');
  $ladetail['xl_date'] = date('d-m-Y');
  $ladetail['xl_user'] =  $_SESSION['user']['user_name'];	
  
  $table_la->setWhere("xl_id = 1");
	  if($table_la->rowExists())
	  {
		 $this_id = $table_la->updateRow($ladetail);
	  }	  	
}


$sqlla = "select * from xray_last_audited where xl_id = 1";
$ladata = $fwDb->queryOne($sqlla);

$fwViewData['last_audited'] = $ladata['xl_date'] ."  ".$ladata['xl_user'];


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['bs_depo_report_hide'] = $val_2;
	  
	  $table->setWhere("bs_business_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$add_to_deposite = $fwRequest->getParam('add_to_deposite', '');
if($add_to_deposite)
{
	 $keys_4 = array_keys($add_to_deposite);
	 $ky_4 = $keys_4[0];
	 $val_4 = $add_to_deposite[$ky_4];
	
	  $detail['bs_xry_add_to_deposite'] = $val_4;
	  
	  $table->setWhere("bs_business_id = ".$ky_4);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}


$sql123 = "SELECT  business_sellers.bs_business_id,  business_sellers.bs_xry_last_audit_date, business.bsn_id,
			business_sellers.bs_xry_add_to_deposite
			from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			Where business_sellers.bs_depo_report_hide  = 0 and business_sellers.bs_xry_add_to_deposite = 1
			And ( business.bsn_status like '%|2|%' OR  business.bsn_status like '%|5|%' OR business.bsn_status like '%|6|%'
			OR business.bsn_status like '%|3|%' OR business.bsn_status like '%|4|%' )  Group By business.bsn_id";

$dataTo = $fwDb->query($sql123);



foreach($dataTo as $k4 => $v4)
 {
	
		$sqlhia = "select ppd_hia_value from  progress_payment_detail where ppd_bsn_id = ".$v4['bsn_id']. " and ppd_stage = 'Deposit' ";
		$dhvData = $fwDb->queryOne($sqlhia);
		
  		$sqlplhia = "select ppd_hia_value from  progress_payment_detail where ppd_bsn_id = ".$v4['bsn_id']. " and ppd_stage = 'Planning Approvals Submitted' ";
		$plhiaData = $fwDb->queryOne($sqlplhia);
		
		$sqltot = "select  ppd_value from  progress_payment_detail 
		           where ppd_bsn_id = ".$v4['bsn_id'] ." and ( ppd_stage = 'Deposit' OR ppd_stage = 'Planning Approvals Submitted' )";
		$totdata = $fwDb->query($sqltot);
		
		$com_dep = 0;
		
		$value1 = str_replace('$','',$dhvData['ppd_hia_value']);
		$value1 = str_replace(',','',$value1);
		
		$value2 = str_replace('$','',$plhiaData['ppd_hia_value']);
		$value2 = str_replace(',','',$value2);

		$com_dep = (float)$value1 + (float)$value2;
		
		$total3 = 0;

		foreach($totdata as $kt=>$vt)
		{
			$value3=0;
			if(!empty($vt['ppd_value'])) {
				$value3 = $vt['ppd_value'];
				$value3 = str_replace('$','',$value3);
				$value3 = str_replace(',','',$value3);
				$total3 = (float)$total3 + (float)$value3;	
			}
		}
		
		$balance = $com_dep - $total3;
		$totbalance1 =  $totbalance1 + $balance;
	
}
$fwViewData['totbalance1'] =  $totbalance1;

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id, business_sellers.bs_xray_old , business_sellers.bs_xry_last_audit , business_sellers.bs_xry_last_audit_user, business_sellers.bs_xry_last_audit_date,
		business_sellers.bs_xry_add_to_deposite, business_sellers.bs_depo_report_hide, business_sellers.bs_dr_letter , business_sellers.bs_dr_letter_user,
		business_sellers.bs_dr_letter_date, business.bsn_dep_repo_sent, business.bsn_dep_repo_sent_user
		from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " And business.bsn_status like '%|2|%'  Group By business.bsn_id
		
UNION

SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id, business_sellers.bs_xray_old 
, business_sellers.bs_xry_last_audit , business_sellers.bs_xry_last_audit_user, business_sellers.bs_xry_last_audit_date,
		business_sellers.bs_xry_add_to_deposite,  business_sellers.bs_depo_report_hide , business_sellers.bs_dr_letter , business_sellers.bs_dr_letter_user,
		business_sellers.bs_dr_letter_date, business.bsn_dep_repo_sent, business.bsn_dep_repo_sent_user
from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " and business.bsn_status like '%|5|%'  Group By business.bsn_id

UNION

SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id, business_sellers.bs_xray_old 
, business_sellers.bs_xry_last_audit , business_sellers.bs_xry_last_audit_user, business_sellers.bs_xry_last_audit_date,
		business_sellers.bs_xry_add_to_deposite,  business_sellers.bs_depo_report_hide, business_sellers.bs_dr_letter , business_sellers.bs_dr_letter_user,
		business_sellers.bs_dr_letter_date, business.bsn_dep_repo_sent, business.bsn_dep_repo_sent_user
from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " And business.bsn_status like '%|6|%'  Group By business.bsn_id

UNION

SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id, business_sellers.bs_xray_old 
, business_sellers.bs_xry_last_audit , business_sellers.bs_xry_last_audit_user, business_sellers.bs_xry_last_audit_date,
		business_sellers.bs_xry_add_to_deposite,  business_sellers.bs_depo_report_hide,business_sellers.bs_dr_letter , business_sellers.bs_dr_letter_user,
		business_sellers.bs_dr_letter_date, business.bsn_dep_repo_sent, business.bsn_dep_repo_sent_user
from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " And business.bsn_status like '%|3|%' Group By business.bsn_id

UNION

SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, bus_customers.bcust_id, business_sellers.bs_xray_old 
, business_sellers.bs_xry_last_audit , business_sellers.bs_xry_last_audit_user, business_sellers.bs_xry_last_audit_date,
		business_sellers.bs_xry_add_to_deposite, business_sellers.bs_depo_report_hide, business_sellers.bs_dr_letter , business_sellers.bs_dr_letter_user,
		business_sellers.bs_dr_letter_date, business.bsn_dep_repo_sent, business.bsn_dep_repo_sent_user
from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " And business.bsn_status like '%|4|%' Group By business.bsn_id";





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
    
    $page_rows = 200;
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
 
 $totbalance = 0;
foreach($setdata2 as $k => $v)
{
		
		$status_string = "'".$v['bsn_status']."'";
		$status='';
		
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre Construction<br>" ; }
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
		
		$sqlhia = "select ppd_hia_value from  progress_payment_detail where ppd_bsn_id = ".$v['bsn_id']. " and ppd_stage = 'Deposit' ";
		$dhvData = $fwDb->queryOne($sqlhia);
		
  $sqlplhia = "select ppd_hia_value from  progress_payment_detail where ppd_bsn_id = ".$v['bsn_id']. " and ppd_stage = 'Planning Approvals Submitted' ";
		$plhiaData = $fwDb->queryOne($sqlplhia);
		
		
		//$sqltot = "select  ppd_value from  progress_payment_detail where ppd_bsn_id = ".$v['bsn_id'];
		$sqltot = "select  ppd_value from  progress_payment_detail 
		           where ppd_bsn_id = ".$v['bsn_id'] . " and ( ppd_stage = 'Deposit' OR ppd_stage = 'Planning Approvals Submitted' )";
		$totdata = $fwDb->query($sqltot);
		
		$com_dep = 0;
		
		$value1 = str_replace('$','',$dhvData['ppd_hia_value']);
		$value1 = str_replace(',','',$value1);
		
		$value2 = str_replace('$','',$plhiaData['ppd_hia_value']);
		$value2 = str_replace(',','',$value2);

		$com_dep = (float)$value1 + (float)$value2;
		
		
		$total3 = 0;

		foreach($totdata as $kt=>$vt)
		{
			
			$value3=0;
			if(!empty($vt['ppd_value'])) {
				$value3 = $vt['ppd_value'];
				$value3 = str_replace('$','',$value3);
				$value3 = str_replace(',','',$value3);
				$total3 = (float)$total3 + (float)$value3;	
			}
		}
		
		$balance = $com_dep - $total3;
		$totbalance =  $totbalance + $balance;
				
		$link = $BASE_URL."business.detail/bsn_id/".$v['bsn_id'];	
		
	
	    $setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $status;
		$setdata2[$k]['hia_value'] =   number_format($total1, 2, '.', ',');
		$setdata2[$k]['total_value'] = number_format($total2, 2, '.', ',');
	
		$setdata2[$k]['depo_hia_value'] = $dhvData['ppd_hia_value'];
		$setdata2[$k]['planning_hia_value'] = $plhiaData['ppd_hia_value'];	
		$setdata2[$k]['com_dep'] = $com_dep;	
		$setdata2[$k]['paid_total'] = $total3;
		$setdata2[$k]['balance'] = $balance;		
}
 
 $fwViewData['totbalance'] =  $totbalance;
 
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
							 ->setDescription("Design q/a report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Deposite Report");


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
			->setCellValue('C1', "Deposit HIA Value")
			->setCellValue('D1', "Planning HIA Value")
			->setCellValue('E1', "Combined Deposit and Planning")
			->setCellValue('F1', "Paid Total")
			->setCellValue('G1', "Balance")
	
;

$from = "A1"; // or any value
$to = "AZ1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	
	if($v['bs_xry_last_audit'] = 1) { $la = 'Yes '.$v['bs_xry_last_audit_user'].' '.$v['bs_xry_last_audit_date']; } else {$la = 'No'; }
	
	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['bsn_address'])
				->setCellValue('B'.$row, str_replace("<br>",", ",$v['status']))
				->setCellValue('C'.$row, $v['depo_hia_value'])
				->setCellValue('D'.$row, $v['planning_hia_value'])
				->setCellValue('E'.$row, '$'.number_format($v['com_dep'],2))
				->setCellValue('F'.$row, '$'.number_format($v['paid_total'],2))
				->setCellValue('G'.$row, '$'.number_format($v['balance'],2))
						;
					
	$row= $row+1;			
	
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Deposite Report');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="deposite_report.xls"');
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

$sqlse = "Select * from deposite_report_sent";
$fwViewData['sentdata'] = $fwDb->query($sqlse);



$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Deposit Report";
