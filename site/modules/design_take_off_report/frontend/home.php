<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebs = new Fw_Db_Table('business_sellers');
$tablebusiness = new Fw_Db_Table('business');

$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);


// Save survey date
$survey = $fwRequest->getParam('survey', '');
if(!empty($survey)) {
	$savesd = $fwRequest->getParam('bs_dtor_survey_date', '');
	
	foreach($savesd as $k9=>$v9)
	{
		$sDetail['bs_dtor_survey_date'] = $v9;
		$tablebs->setWhere('bs_business_id = '.$k9);
		$detail = $tablebs->updateRow($sDetail);
	}
}


// Save bsn_ssv_date
$ssv_date = $fwRequest->getParam('bsn_ssv_date', '');
if(!empty($ssv_date)) {
	$ssv = $fwRequest->getParam('bsn_ssv_date', '');
	foreach($ssv as $k=>$v)
	{
		$ssvDetail['bsn_ssv_date'] = $v;
		
		$tablebusiness->setWhere('bsn_id = '.$k);
		$detail = $tablebusiness->updateRow($ssvDetail);		
	}
}
//End bsn_ssv_date


// Save IDM Dooked Date
$idm_date = $fwRequest->getParam('bsn_idm_booked_date', '');
if(!empty($idm_date)) {
	$idm = $fwRequest->getParam('bsn_idm_booked_date', '');
	foreach($idm as $k=>$v)
	{
		$idmDetail['bsn_idm_booked_date'] = $v;
		
		$tablebusiness->setWhere('bsn_id = '.$k);
		$detail = $tablebusiness->updateRow($idmDetail);		
	}
}
//End IDM Dooked Date

$hideupdate = $fwRequest->getParam('hideupdate', '');

if($hideupdate)
{
	$hide = $fwRequest->getParam('hide', '');
	$ke=0;

	
	foreach($hide as $k=>$v)
    {
	  if($v=='on') { $val = 1; } else { $val = 0; }
	  
	  $a = explode('_',$k);
	  	
	  if($ke == $a[0])
	  {	
	  }
	  else {
		  $detail2['bsn_id'] = $a[0];
		  $detail2['bsn_takeoff_hide'] = $val;
		  $tablebusiness->setWhere('bsn_id = '.$a[0]);
		  $det= $tablebusiness->updateRow($detail2);
	  }
	  $ke = $a[0];
	 
    }
	
}

$unhide = $fwRequest->getParam('unhide', '');


$showall = 0;
if($unhide) 
{
$showall = 1;
}

	
if($keyword):
$where .= "AND business.bsn_sub_status LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		

//$ord = " Order By document_check_list.doc_date_uploaded DESC ";

$ord = '';

  if($searchkey):

  $where .= " AND business.bsn_address LIKE '%".$searchkey."%' OR  bus_customers.bcust_fname LIKE '%".$searchkey."%'  OR  bus_customers.bcust_lname LIKE '%".$searchkey."%' ";
			
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey']=$_SESSION['searchkey'];
		
	elseif($_SESSION['searchkey'] && $pagenum > 0):
		
$where .= " AND business.bsn_address LIKE '%".$_SESSION['searchkey']."%' OR  bus_customers.bcust_fname LIKE '%".$$_SESSION['searchkey']."%'  OR  bus_customers.bcust_lname LIKE '%".$$_SESSION['searchkey']."%' ";
			
	$fwViewData['searchkey']=$_SESSION['searchkey'];
  endif;

  if($clear)
  {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey']='';
	$searchkey='';
	$fwViewData['searchkey']='';
	$where = "WHERE 1=1 ";
 }

	 
	 $sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname,    
	 bus_customers.bcust_lname, bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name,  business.bsn_sub_status,
         business.bsn_status_sys_date, business.bsn_address, business.bsn_address_same, business.bsn_ssv_date,
	 business.bsn_idm_booked_date,  business.bsn_takeoff_hide, business_sellers.bs_dtor_survey, business_sellers.bs_dtor_survey_date
	 from business_sellers 		
	 Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	 Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	 Inner Join document_check_list_mini_count ON business.bsn_id = document_check_list_mini_count.dcnt_bsn_id  " .  
	 $where. " Group By business.bsn_id " .$ord;

if($sql){$userData = $fwDb->query($sql);}



//$fwViewData['total'] = sizeof($userData);
$total2 = sizeof($userData);
if(empty($pagenum)) { $pagenum = 1; }

$fwViewData['total'] =  $total2 - ($pagenum-1)*300;


if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 800;
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
		
		// Uid 594 starts
				
			$sqluid594 = "Select business_tasks.* from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 594";
		     	$data594 = $fwDb->queryOne($sqluid594);
		
		// Uid 594 ends
		
		// Uid 430 starts
				
			$sqluid430= "Select business_tasks.* from business_tasks
				     where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 430";
		     	$data430 = $fwDb->queryOne($sqluid430);
		
		// Uid 430 ends	
		
		// Uid 303 starts
				
			$sqluid303= "Select business_tasks.* from business_tasks
				     where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 303";
		     	$data303 = $fwDb->queryOne($sqluid303);
		
		// Uid 303 ends	
		
		
		$sqlhide = "Select business.bsn_takeoff_hide from business
					where business.bsn_takeoff_hide = 1 AND  business.bsn_id = ". $v['bsn_id'];
		$hidedata = $fwDb->queryOne($sqlhide);
		
		$sqlcn = "Select  dpn_bsn_id, dpn_unique_id from document_proposal_name where  dpn_bsn_id = ". $v['bsn_id'];
		$chknoData = $fwDb->query($sqlcn);
	
		// Proposal Checklist
		
		$sqlpc = "Select document_check_list_mini_count.dcnt_counter from document_check_list_mini_count
		          where document_check_list_mini_count.dcnt_bsn_id = ". $v['bsn_id'] ;
		$datapc = $fwDb->queryOne($sqlpc);
		
		// End Proposal Checklist
		
		$sql482 = "Select document_check_list.* from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 482";
		$data482 = $fwDb->queryOne($sql482);
		
		
		$sql45 = "Select STR_TO_DATE(doc_date_uploaded, '%Y-%m-%d') as doc_date_uploaded from document_check_list
			   where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 45";
		$data45 = $fwDb->queryOne($sql45);
		
	
		
		$sqlmsteam = "Select * from ms_team where ms_team.ms_bus_id = ".$v['bsn_id'];
		$msteam = $fwDb->query($sqlmsteam);
		
		// Uid 595 starts
				
			$sqluid595= "Select business_tasks.* from business_tasks
				     where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 595";
		     	$data595 = $fwDb->queryOne($sqluid595);
		
		// Uid 303 ends	
		
		
		// Survey Uploaded
		
		$sqlsu = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = ". $v['bsn_id']
		         . " And doc_name_id = 72 ";
		$suData = $fwDb->queryOne($sqlsu);
		
		// End Survey Uploaded

		if(!count($hidedata) > 0  ) 
		{
			$setdata2[$k]['bsn_id'] = $v['bsn_id'];
			$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id']; 
			$setdata2[$k]['bsn_address'] = $v['bsn_address'];
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['chknoData'] = $chknoData;
			$setdata2[$k]['prochklist'] = $datapc['dcnt_counter'];
			$setdata2[$k]['uid594complete'] = $data594['bt_complete'];
			$setdata2[$k]['uid594'] =  changedate_d_m_y($data594['bt_completed_date']);	
			$setdata2[$k]['bsn_ssv_date'] = $v['bsn_ssv_date'];
			$setdata2[$k]['uid430'] =  changedate_d_m_y($data430['bt_completed_date']);	
			$setdata2[$k]['bsn_idm_booked_date'] = $v['bsn_idm_booked_date'];
			$setdata2[$k]['uid303'] =  changedate_d_m_y($data303['bt_completed_date']);
			$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
			$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
			$setdata2[$k]['bs_dtor_survey'] = $v['bs_dtor_survey'];
			$setdata2[$k]['bs_dtor_survey_date'] = $v['bs_dtor_survey_date'];
			$setdata2[$k]['checklist45'] =  $data45['doc_date_uploaded'];
			$setdata2[$k]['checklist482'] = $data482['doc_file_name'];
			$setdata2[$k]['msteam'] = $msteam;
			$setdata2[$k]['uid595'] =  changedate_d_m_y($data595['bt_completed_date']);
			$setdata2[$k]['bsn_takeoff_hide'] = $v['bsn_takeoff_hide'];
			$setdata2[$k]['survey_uploaded'] = $suData['doc_file_name'];
		}
		
		
		if($showall == 1) 
		{
			$setdata2[$k]['yes'] = $hidedata['de_hide'];
			$setdata2[$k]['bsn_id'] = $v['bsn_id'];
			$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id']; 
			$setdata2[$k]['bsn_address'] = $v['bsn_address'];
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['prochklist'] = $datapc['dcnt_counter'];
			$setdata2[$k]['chknoData'] = $chknoData;
			$setdata2[$k]['checklist45'] =  $data45['doc_date_uploaded'];
			$setdata2[$k]['uid594complete'] = $data594['bt_complete'];
			$setdata2[$k]['uid594'] =  $data594['bt_completed_date'];
			$setdata2[$k]['bsn_ssv_date'] = $v['bsn_ssv_date'];
			$setdata2[$k]['bsn_idm_booked_date'] = $v['bsn_idm_booked_date'];
			$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
			$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
			$setdata2[$k]['bs_dtor_survey'] = $v['bs_dtor_survey'];
			$setdata2[$k]['bs_dtor_survey_date'] = $v['bs_dtor_survey_date'];
			$setdata2[$k]['checklist482'] = $data482['doc_file_name'];
			$setdata2[$k]['msteam'] = $msteam;
			$setdata2[$k]['uid595'] =  changedate_d_m_y($data595['bt_completed_date']);
			$setdata2[$k]['bsn_takeoff_hide'] = $v['bsn_takeoff_hide'];
			$setdata2[$k]['survey_uploaded'] = $suData['doc_file_name'];
		}
		
	}


	//$time = strtotime('10/16/2003');
        //$newformat = date('Y-m-d',$time);

 	 foreach ($setdata2 as $key => $row) {
		 
     		 $desig[$key]  = $row['checklist45'];
		}
		
		array_multisort($desig, SORT_DESC, $setdata2);


 	$fwViewData['list'] =  $setdata2;
	
	$report = new Fw_Db_Table('report_design_take_off');
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
				 ->setDescription("Design report exported to Office 2007 XLSX.")
				 ->setKeywords("office 2007 openxml php")
				 ->setCategory("Design Take Of Report File");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(30);
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
		->setCellValue('C1', 'Number Of Proposal Checklist')
		->setCellValue('D1', 'Proposal Checklist Numbers')
		->setCellValue('E1', 'Signed Design Agreement')
		->setCellValue('F1', 'Site Scope Visit Booked')
		->setCellValue('G1', 'SSV Date')
		->setCellValue('H1', 'Initial Designs Meeting Booked')
		->setCellValue('I1', 'IDM Booked Date')
		->setCellValue('J1', 'SSV Complete')
		->setCellValue('K1', 'IDM Completed')
		
			;

$from = "A1"; // or any value
$to = "AH1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	$cn='';
	foreach($v['chknoData'] as $ck => $cv)
	{
		$cn .= $cv['dpn_unique_id']. ', ';
	}
	

	$objPHPExcel->getActiveSheet()
			->setCellValue('A'.$row, $v['bsn_address'])
			->setCellValue('B'.$row, $v['bcust_fname'] . ' ' .$v['bcust_lname'])
			->setCellValue('C'.$row, $v['prochklist'])
			->setCellValue('D'.$row, $cn)
			->setCellValue('E'.$row, $v['checklist45'])
			->setCellValue('F'.$row, $v['uid594'])
			->setCellValue('G'.$row, $v['bsn_ssv_date'])
			
			->setCellValue('H'.$row, $v['uid430'])
			->setCellValue('I'.$row, $v['bsn_idm_booked_date'])
			
			->setCellValue('J'.$row, $v['uid303'])
			->setCellValue('K'.$row, $v['uid595'])
	

			;	
	$row= $row+1;			
	$sr=$sr+1;
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Design Report');

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);

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
