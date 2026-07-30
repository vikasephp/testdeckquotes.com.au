<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');
$tableBusiness = new Fw_Db_Table('business');

$fwViewData['ran'] =  rand(100000,999999);

$where = " WHERE business_sellers.bs_cpr_hide = 0 ";

$unhidden = $fwRequest->getParam('unhidden', '');
if(!empty($unhidden)) {
	unset($_SESSION['unhide']);	
}

$unhide = $fwRequest->getParam('unhide', '');
if(!empty($unhide) || isset($_SESSION['unhide']) ) {
	$where = " WHERE 1 = 1 ";
	$_SESSION['unhide'] = 1; 	
}

$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 foreach($hide as $k9=>$v9)
	 {
		  $id = $k9; 
	 }
	
	  $detail['bs_cpr_hide'] = $v9;
	  
	  $table->setWhere("bs_business_id = ".$id);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
}


$ord =  "ORDER BY if(  business.bsn_starting_onsite_date = ' '
OR business.bsn_starting_onsite_date IS NULL , 1, 0 ) , STR_TO_DATE( business.bsn_starting_onsite_date, '%d-%m-%Y' ) ";

$sortlikely = $fwRequest->getParam('sortlikely', '');
if($sortlikely)
{
	$ord =  "ORDER BY if(  business.bsn_incl_cc_date = ' '
	OR business.bsn_incl_cc_date IS NULL , 1, 0 ) , STR_TO_DATE( business.bsn_incl_cc_date, '%d-%m-%Y' ) ";	
}

$sortby_csd = $fwRequest->getParam('sortby_csd', '');
if($sortby_csd)
{
	$ord =  "ORDER BY if(  business.bsn_latest_csbd = ' '
	OR business.bsn_latest_csbd IS NULL , 1, 0 ) , STR_TO_DATE( business.bsn_latest_csbd, '%d-%m-%Y' ) ";	
}



$hbyes = $fwRequest->getParam('hbyes', '');
if($hbyes)
{
$where = 'WHERE bs_cpr_hb_grant = "Yes" ';	
}

// Save Likely Hia Sign Date
$likelyhia = $fwRequest->getParam('likelyhia', '');
if(!empty($likelyhia)) {
	$like_hia = $fwRequest->getParam('bs_cpr_lik_hia_date', '');
	$key = array_keys($like_hia);
	$ky = $key[0];
	
	$ecDetail['bs_cpr_lik_hia_date'] = $like_hia[$ky];
	$ecDetail['bs_cpr_lik_hia_user'] = $_SESSION['user']['user_name'];
	
	$table->setWhere('bs_business_id = '.$ky);
	$detail = $table->updateRow($ecDetail);		
}
// End Likely Hia Sign Date


// Plans Auditeed Starts

$plans = $fwRequest->getParam('plans', '');
if($plans)
{
	
	 $keys_4 = array_keys($plans);
	 $ky_4 = $keys_4[0];
	 $val_4 = $plans[$ky_4];
	
	  $paDetail['bs_cpr_plans_audited'] = $val_4;
	  $paDetail['bs_cpr_plans_audited_user'] = date('d-m-Y');
	  $paDetail['bs_cpr_plans_audited_date'] = $_SESSION['user']['user_name'];
	  	
	
	  $table->setWhere("bs_business_id = ".$ky_4);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($paDetail);
	  }	  	
}
// Plans audited ends


// Save Starting Onsite Date 
$onsite_date = $fwRequest->getParam('bsn_starting_onsite_date', '');
if(!empty($onsite_date)) {
	$save_od = $fwRequest->getParam('bsn_starting_onsite_date', '');
	
	foreach($save_od as $k=>$v)
	{
		$osdDetail['bsn_starting_onsite_date'] = $v;
		$osdDetail['bsn_onsite_user'] = $_SESSION['user']['user_name'];
		$tableBusiness->setWhere('bsn_id = '.$k);
		$detail = $tableBusiness->updateRow($osdDetail);		
	}
}
//End Starting Onsite Date 

// Save Original Onsite Starting Date 
$original_onsite_date = $fwRequest->getParam('bs_original_starting_date', '');
if(!empty($original_onsite_date)) {
	$save_original_od = $fwRequest->getParam('bs_original_starting_date', '');
	
	foreach($save_original_od as $kd=>$vd)
	{
		$oosdDetail['bs_original_starting_date'] = $vd;
		$table->setWhere('bs_business_id = '.$kd);
		$detail = $table->updateRow($oosdDetail);		
	}
}
//End Original Onsite Starting Date

// Save Onsite work commenced for HBG
$owc_date = $fwRequest->getParam('bs_cpr_owc_hbg', '');
if(!empty($owc_date)) {
	$save_owc = $fwRequest->getParam('bs_cpr_owc_hbg', '');
	
	foreach($save_owc as $ko=>$vo)
	{
		
		$owcDetail['bs_cpr_owc_hbg'] = $vo;
	
		$table->setWhere('bs_business_id = '.$ko);
	
		$detail = $table->updateRow($owcDetail);		
	}
}
//End Onsite work commenced for HBG 

// Save Last QAed by Construction Leader 
$qaed_date = $fwRequest->getParam('bs_last_qaed', '');
if(!empty($qaed_date)) {
	$save_qaed = $fwRequest->getParam('bs_last_qaed', '');
	
	foreach($save_qaed as $kq=>$vq)
	{
		
		$qaedDetail['bs_last_qaed'] = $vq;
		$qaedDetail['bs_last_qaed_user'] = $_SESSION['user']['user_name'];
	
		$table->setWhere('bs_business_id = '.$kq);
	
		$detail = $table->updateRow($qaedDetail);		
	}
}
//EndLast QAed by Construction Leader 

// Save amount deposited paid date

$bs_cpr_paid_date = $fwRequest->getParam('bs_cpr_paid_date', '');
if($bs_cpr_paid_date)
{
	 $keys_2 = array_keys($bs_cpr_paid_date);
	 $ky_2 = $keys_2[0];
	 $val_2 = $bs_cpr_paid_date[$ky_2];
	
	  $detail['bs_cpr_paid_date'] = $val_2;
	  $table->setWhere("bs_business_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }
}
// End amount deposited paid date

$move = $fwRequest->getParam('move', '');


if($move)
{

	 foreach($move as $k=>$v)
	 {
		  $id = $k; 
	 }
	
	  $detail['bs_con_pro_report'] = $v;
	  $table->setWhere("bs_business_id = ".$id);
	  if($table->rowExists())
	 {
		 $this_id = $table->updateRow($detail);
	  }
}


$savedata = $fwRequest->getParam('savedata', '');
if($savedata) { 


if($_FILES['cpr_cc_letter']['name'])
		{
			
				foreach($_FILES['cpr_cc_letter']['name'] as $ks=>$vs)
				{

					if($vs)
					{
					
						$salescmaData['cma_bsn_id'] = $ks;
						
						$doc1 = $vs;
						$file_type = $_FILES['cpr_cc_letter']['type'][$ks];	
						
										
						$datetime = trim(date('d_m_Y_H_i_'),'0');
						$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
						$src =  $_FILES['cpr_cc_letter']['tmp_name'][$ks]; 
						
						upload($doc1, $src);
						$letterData['bs_cpr_cc_letter'] = $doc1;
						
							
							$table->setWhere('bs_business_id = '.$ks);
							if($table->rowExists())
							{
								
								$detail = $table->updateRow($letterData);	
							}		
					}
					
				}
					
		}
}
	
		

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_starting_onsite_date, business.bsn_incl_cc_date,
	business.bsn_status, business.bsn_address, business.bsn_latest_csbd, business_sellers.bs_cpr_hb_grant,
	business_sellers.bs_cpr_amt_depo_paid , business_sellers.bs_cpr_cc_letter, business_sellers.bs_cpr_owc_hbg,
	business_sellers.bc_cpr_hia_date, business_sellers.bs_last_qaed, business_sellers.bs_traffic_light, 
	business_sellers.bs_traffic_light_incl, business_sellers.bs_tl_user, business_sellers.bs_tl_date, 
	business_sellers.bs_tl_user_incl, business_sellers.bs_tl_date_incl, business_sellers.bs_last_qaed_user,
	business_sellers.bs_last_qaed_currentdt , business_sellers.bs_cpr_paid_user, business_sellers.bs_cpr_paid_date,
	business_sellers.bs_cpr_hide , business_sellers.bs_cpr_lik_hia_date, business_sellers.bs_cpr_lik_hia_user,
	bus_customers.bcust_cpr_hia_value, bus_customers.bcust_id, bus_customers.bcust_cip_proj_type, business_sellers.bs_cpr_sn,
	business_sellers.bs_cpr_plans_audited, business_sellers.bs_cpr_plans_audited_user, business_sellers.bs_cpr_plans_audited_date,
	business.bsn_cip_proj_type, business.bsn_onsite_user , business_sellers.bs_cpr_sub_status, business_sellers.bs_meeting_status, business_sellers.bs_original_starting_date 
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
	And  ( business.bsn_status like '%|2|%' Or business.bsn_status like '%|5|%' Or business.bsn_status like '%|6|%' 
	Or business.bsn_addto_cpr = 1 Or business.bsn_showin_cpr = 1 ) 
	Group By business.bsn_id " .$ord ;


if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 500;
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
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre-construction" ; }
		
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
		
		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bsn_id'];	
		
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];
		$setdata2[$k]['bcust_id'] = $v['bcust_id'];
		$setdata2[$k]['bsn_address'] = $v['bsn_address'];
		$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['doc_date_uploaded'] = changedate_d_m_y($data['doc_date_uploaded']);
		$setdata2[$k]['status'] = $status;
		$setdata2[$k]['bsn_starting_onsite_date'] = $v['bsn_starting_onsite_date'];
		$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdata2[$k]['bsn_incl_cc_date'] = $v['bsn_incl_cc_date'];
		$setdata2[$k]['bsn_latest_csbd'] = $v['bsn_latest_csbd'];
		$setdata2[$k]['bs_cpr_hb_grant'] = $v['bs_cpr_hb_grant'];
		$setdata2[$k]['bs_cpr_amt_depo_paid'] = $v['bs_cpr_amt_depo_paid'];
		$setdata2[$k]['bs_cpr_cc_letter'] = $v['bs_cpr_cc_letter'];
		$setdata2[$k]['bs_cpr_owc_hbg'] = $v['bs_cpr_owc_hbg'];
		$setdata2[$k]['bs_last_qaed'] = $v['bs_last_qaed'];
		$setdata2[$k]['bs_traffic_light'] = $v['bs_traffic_light'];
		$setdata2[$k]['bs_traffic_light_incl'] = $v['bs_traffic_light_incl'];
		$setdata2[$k]['bs_tl_user'] = $v['bs_tl_user'];
		$setdata2[$k]['bs_tl_date'] = changedate_d_m_y($v['bs_tl_date']);
		$setdata2[$k]['bs_tl_user_incl'] = $v['bs_tl_user_incl'];
		$setdata2[$k]['bs_tl_date_incl'] = $v['bs_tl_date_incl'];
		$setdata2[$k]['bs_last_qaed_user'] = $v['bs_last_qaed_user'];
		$setdata2[$k]['bs_last_qaed_currentdt'] = changedate_d_m_y($v['bs_last_qaed_currentdt']);
		$setdata2[$k]['bs_cpr_paid_user'] = $v['bs_cpr_paid_user'];
		$setdata2[$k]['bs_cpr_paid_date'] = changedate_d_m_y($v['bs_cpr_paid_date']);
		$setdata2[$k]['bs_cpr_hide'] = $v['bs_cpr_hide'];
		
		$setdata2[$k]['bs_cpr_lik_hia_date'] = $v['bs_cpr_lik_hia_date'];
		$setdata2[$k]['bs_cpr_lik_hia_user'] = $v['bs_cpr_lik_hia_user'];
		$setdata2[$k]['bcust_cpr_hia_value'] = $v['bcust_cpr_hia_value'];
		$setdata2[$k]['bcust_cip_proj_type'] = $v['bcust_cip_proj_type'];
		$setdata2[$k]['bs_cpr_sn'] = $v['bs_cpr_sn'];
		
		$setdata2[$k]['bs_cpr_plans_audited'] = $v['bs_cpr_plans_audited'];
		$setdata2[$k]['bs_cpr_plans_audited_user'] = $v['bs_cpr_plans_audited_user'];
		$setdata2[$k]['bs_cpr_plans_audited_date'] = $v['bs_cpr_plans_audited_date'];
		
		$setdata2[$k]['bsn_cip_proj_type'] = $v['bsn_cip_proj_type'];
		$setdata2[$k]['bsn_onsite_user'] = $v['bsn_onsite_user'];
		
		
		
				
}
 
 
 	$fwViewData['list'] =  $setdata2;
	
	
	$report = new Fw_Db_Table('report_construction_pipeline');
	$report->setWhere("1=1");
	$report->deleteRows();
	
	foreach($setdata2 as $rk => $rv)
	{
		if(!empty($rv['bsn_id'])) {
			$detailrp['re_bsn_id'] = $rv['bsn_id'];
			$this_id = $report->insertRow($detailrp);
			}
	}
	
	$hia=0;
	$nohia=0;
	foreach($setdata2 as $m3 => $s3)
		{
			if(strlen($s3['doc_date_uploaded']) > 0) 
			{
				$hia++;	 
			}
		}
		
	foreach($setdata2 as $m2 => $s2)
		{
			if(strlen($s2['doc_date_uploaded']) == 0) 
			{
				$nohia++;	 
			}
		}
		
	$fwViewData['hia'] = $hia;
	$fwViewData['nohia'] = $nohia;		
 	
 }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Construction Pipeline Report";


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
	{
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";

$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Construction Pipeline Report to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Construction Pipeline Report file");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(15);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(35);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(25);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(25);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(20);
	
$objPHPExcel->getActiveSheet()->getStyle('A1:J1')->getAlignment()->setWrapText(true);
// Add some data
$objPHPExcel->setActiveSheetIndex(0)
           	->setCellValue('A1', 'Project Address')
          	->setCellValue('B1', 'Hia Sign Date')
		->setCellValue('C1', 'Home Builder Grant')
		->setCellValue('D1', 'Status')
		->setCellValue('E1', 'Could Start Build Date from the Planning Task Tracker')
		->setCellValue('F1', 'Likely to Commence Construction Date From the Inclusions Task Tracker')
		->setCellValue('G1', 'Amount Deposit Paid')
		->setCellValue('H1', 'Starting Onsite Date')
		->setCellValue('I1', 'Last QAed by Construction Leader')
		->setCellValue('J1', 'Onsite work commenced for HBG')	
		;

$from = "A1"; // or any value
$to = "AH1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	
	$sta = str_replace('<br>', ' , ' ,$v['status']);
	
	$objPHPExcel->getActiveSheet()
			->setCellValue('A'.$row, $v['bsn_address'])
			->setCellValue('B'.$row, $v['doc_date_uploaded'])
			->setCellValue('C'.$row, $v['bs_cpr_hb_grant'])
			->setCellValue('D'.$row, $sta)
			->setCellValue('E'.$row, $v['bsn_latest_csbd'])
			->setCellValue('F'.$row, $v['bsn_incl_cc_date'])
			->setCellValue('G'.$row, $v['bs_cpr_amt_depo_paid'])
			->setCellValue('H'.$row, $v['bsn_starting_onsite_date'])
			->setCellValue('I'.$row, $v['bs_last_qaed'])
			->setCellValue('J'.$row, $v['bs_cpr_owc_hbg'])


			;	
	$row= $row+1;			
	$sr=$sr+1;
}

$objPHPExcel->getActiveSheet()->setTitle('Construction Pipeline Report');

$objPHPExcel->setActiveSheetIndex(0);

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="cpr_report.xls"');
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
	
	
$sql_type = "Select * from type_options_cpr";
$fwViewData['typedata'] = $fwDb->query($sql_type);

 $sql_3 = "Select * from cpr_sn_th";
  $fwViewData['snData'] = $fwDb->query($sql_3);	
