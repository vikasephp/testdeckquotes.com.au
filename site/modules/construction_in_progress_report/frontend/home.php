<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');
$tablebuscustomers = new Fw_Db_Table('bus_customers');
$tablebusiness = new Fw_Db_Table('business');

$table_toplink = new Fw_Db_Table('top_links');

$update_link = $fwRequest->getParam('update_link', '');
if(!empty($update_link)){
	$proc = $fwRequest->getParam('proc', '');
        $tlDetail['tl_link'] = $proc;
	$table_toplink->setWhere("tl_slug = 'construction_in_progress_report'");
	$table_toplink->updateRow($tlDetail);
}

$last_audit = $fwRequest->getParam('last_audit', '');
if(!empty($last_audit)){
	$tableLa = new Fw_Db_Table('cipr_audit_manager');
        $laDetail['la_user'] = $_SESSION['user']['user_name'];
	$laDetail['la_date'] = date('d-m-Y');
	$tableLa->setWhere("la_id = 1");
	$tableLa->updateRow($laDetail);
}

$upload_letter = $fwRequest->getParam('upload_letter', '');
if($upload_letter) 
{ 
		if($_FILES['letter']['name'])
		{

			$docfile_11 = $_FILES['letter']['name'];
			$docfile_11 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_11);
			$temp_name_11 = $_FILES['letter']['tmp_name'];
			$clData['bcust_cip_latest_letter'] = $docfile_11;
			
			upload($docfile_11, $temp_name_11);
			
			$bcust_id = $fwRequest->getParam('bcust_id', '');
				
				$tablebuscustomers->setWhere('bcust_id = '.$bcust_id);
				if($tablebuscustomers->rowExists())
				{
				
					$detail = $tablebuscustomers->updateRow($clData);	
				}		
		}	
}

$save_cal = $fwRequest->getParam('save_cal', '');
if($save_cal) 
{ 
		if($_FILES['calendar']['name'])
		{

			$docfile_12 = $_FILES['calendar']['name'];
			$docfile_12 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_12);
			$temp_name_12 = $_FILES['calendar']['tmp_name'];
			$clData['bsn_cip_calendar'] = $docfile_12;
			
			$clData['bsn_cip_calendar_user'] = $_SESSION['user']['user_name'];
			$clData['bsn_cip_calendar_date'] = date('d-m-Y');
			
			upload($docfile_12, $temp_name_12);
			
			$bsn_id = $fwRequest->getParam('bsn_id', '');
				
				$tablebusiness->setWhere('bsn_id = '.$bsn_id);
				if($tablebusiness->rowExists())
				{
				
					$detail = $tablebusiness->updateRow($clData);	
				}		
		}	
}




$savedata = $fwRequest->getParam('savedata', '');
if($savedata) 
{ 	
		
		if($_FILES['in_letter']['name'])
		{

			$bsn_id = $fwRequest->getParam('bsn_id', '');
			
			
			$docfile_1 = $_FILES['in_letter']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['in_letter']['tmp_name'];
			$letterData['bsn_cip_letter']  = $docfile_1;
			upload($docfile_1, $temp_name_1);

				
				$tablebusiness->setWhere('bsn_id = '.$bsn_id);
				if($tablebusiness->rowExists())
				{
					
					$detail = $tablebusiness->updateRow($letterData);	
				}		
		}
	
}

$where = " WHERE business.bsn_status like '%|3|%' and bus_customers.bcust_cip_hide = 0 ";
$fwViewData['ran'] =  rand(100000,999999);


$showhidden = $fwRequest->getParam('showhidden', '');
if(!empty($showhidden)) {
$where = " WHERE business.bsn_status like '%|3|%' ";	
}

// Sava Hide From Report
$hide = $fwRequest->getParam('hide', '');
if(!empty($hide)) {
	$id = $fwRequest->getParam('hide', '');
	$key = array_keys($id);
	$ky = $key[0];
	$hideDetail['bcust_cip_hide'] = $id[$ky];
	$tablebuscustomers->setWhere('bcust_id = '.$ky);
	$detail = $tablebuscustomers->updateRow($hideDetail);		
}
//End Hide From Report

// Sava To receive Construction Progress letter 
$cip_l = $fwRequest->getParam('cip_l', '');
if(!empty($cip_l)) {
	$id = $fwRequest->getParam('cip_l', '');
	$key = array_keys($id);
	$ky = $key[0];
	$cipDetail['bs_cip_receive_cpl'] = $id[$ky];
	$table->setWhere('bs_business_id = '.$ky);
	$detail = $table->updateRow($cipDetail);		
}
//End To receive Construction Progress letter 

// Smartsheet Setup 
$smart = $fwRequest->getParam('smart', '');
if(!empty($smart)) {
	$id = $fwRequest->getParam('smart', '');
	$key = array_keys($id);
	$ky = $key[0];
	$smartDetail['bs_cipr_smartsheet'] = $id[$ky];
	$smartDetail['bs_cipr_smart_user'] = $_SESSION['user']['user_name'];
	$smartDetail['bs_cipr_smart_date'] = date('d-m-Y');
	
	$table->setWhere('bs_business_id = '.$ky);
	$detail = $table->updateRow($smartDetail);		
}
//End To receive Construction Progress letter 


// Save Hia
$ccd = $fwRequest->getParam('bs_c_in_p_comm_onsite', '');
if(!empty($ccd)) {

	$id2 = $fwRequest->getParam('bs_c_in_p_comm_onsite', '');
	
	$key2 = array_keys($id2);
	$ky2 = $key2[0];
	$ccdDetail['bs_c_in_p_comm_onsite'] = $id2[$ky2];
	$ccdDetail['bs_c_in_p_hia_user'] = $_SESSION['user']['user_name'];
	$ccdDetail['bs_c_in_p_hia_date'] = date('d-m-Y');
	
	$table->setWhere('bs_business_id = '.$ky2);
	$detail = $table->updateRow($ccdDetail);
}
//End Hia


// Save Commenced Onsite
$cedon = $fwRequest->getParam('bsn_cip_commed_onsite', '');
if(!empty($cedon)) {

	$id3 = $fwRequest->getParam('bsn_cip_commed_onsite', '');
	$key3 = array_keys($id3);
	$ky3 = $key3[0];
	$cedonDetail['bsn_cip_com_on_date'] = $id3[$ky3];
	$cedonDetail['bsn_cip_com_on_user'] = $_SESSION['user']['user_name'];
	$cedonDetail['bsn_cip_com_on_userdt'] = date('d-m-Y');
	$tablebusiness->setWhere('bsn_id = '.$ky3);
	$detail = $tablebusiness->updateRow($cedonDetail);
}
//End Commenced Onsite



// Set Stage Date
$stage_date_submit = $fwRequest->getParam('stage_date', '');
if(!empty($stage_date_submit)) {

	$id3 = $fwRequest->getParam('state_date_set', '');
	$key3 = array_keys($id3);
	$ky3 = $key3[0];
	$stDetail['bs_cip_stage_user'] = $_SESSION['user']['user_name'];
	$stDetail['bs_cip_stage_date'] = date('d-m-Y');
	$table->setWhere('bs_business_id = '.$ky3);
	$detail = $table->updateRow($stDetail);
}
//Set Stage Date End



// Set Date Starts
$set_date_sub = $fwRequest->getParam('set_date', '');
if(!empty($set_date_sub)) {

	$id4 = $fwRequest->getParam('setdt', '');
	$key4 = array_keys($id4);
	$ky4 = $key4[0];
	$sdDetail['bs_cip_stage_user'] = $_SESSION['user']['user_name'];
	$sdDetail['bs_cip_stage_date'] = date('d-m-Y');
	
	$sdDetail['bs_con_in_prog_tl_date'] = date('d-m-Y');
	$sdDetail['bs_con_in_prog_tl_user'] = $_SESSION['user']['user_name'];
	
	$sdDetailB['bsn_cip_com_on_userdt'] = date('d-m-Y');
	$sdDetailB['bsn_cip_com_on_user'] = $_SESSION['user']['user_name'];
	
	$sdDetail['bs_c_in_p_hia_date'] = date('d-m-Y');
	$sdDetail['bs_c_in_p_hia_user'] = $_SESSION['user']['user_name'];
	
	$sdDetail['bs_c_in_p_est_date'] = date('d-m-Y');
	$sdDetail['bs_c_in_p_est_user'] = $_SESSION['user']['user_name'];
	
	$sdDetail['bs_cip_letter_date'] = date('d-m-Y');
	$sdDetail['bs_cip_letter_user'] = $_SESSION['user']['user_name'];
	
	$table->setWhere('bs_business_id = '.$ky4);
	$detail = $table->updateRow($sdDetail);
	
	
	$tablebusiness->setWhere('bsn_id = '.$ky4);
	$detail = $tablebusiness->updateRow($sdDetailB);
}
//Set Date Ends


// Save Total Days Manually
$daysdate = $fwRequest->getParam('bsn_cip_daysadded_date', '');
if(!empty($daysdate)) {

	$id4 = $fwRequest->getParam('bsn_cip_daysadded_date', '');
	$key4 = array_keys($id4);
	$ky4 = $key4[0];
	$ddDetail['bsn_cip_daysadded_date'] = $id4[$ky4];
	$tablebusiness->setWhere('bsn_id = '.$ky4);
	$detail = $tablebusiness->updateRow($ddDetail);
}
//End Total Days



// Save Commenced Onsite
$forcast = $fwRequest->getParam('bs_c_in_p_forcast', '');
if(!empty($forcast)) {
	$fordate = $fwRequest->getParam('bs_c_in_p_forcast', '');
	$dt = date('d-m-Y');
	$user = $_SESSION['user']['user_name'];
	foreach($fordate as $kc1=>$vc1)
	{
		$ccdforDetail['bs_c_in_p_forcast'] = $vc1;
		$ccdforDetail['bs_c_in_p_est_user'] = $user;
		$ccdforDetail['bs_c_in_p_est_date'] = $dt;
	
	
		$table->setWhere('bs_business_id = '.$kc1);
		$detail = $table->updateRow($ccdforDetail);		
	}
}
//End Commenced Onsite
$ord = " Order by STR_TO_DATE(business.bsn_cip_com_on_date, '%d-%m-%Y' ) DESC ";	

 $sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home, business.bsn_id, business.bsn_name,business.bsn_sub_status, bus_customers.bcust_id, bus_customers.bcust_cip_hide,
		business.bsn_status_sys_date, business.bsn_address, business_sellers.bs_con_in_prog_tl, business_sellers.bs_c_in_p_comm_onsite,
		business_sellers.bs_c_in_p_forcast, business_sellers.bs_con_in_prog_tl_user, business_sellers.bs_con_in_prog_tl_date,
		business.bsn_live_proj_calendar, business.bsn_site_camera, business.bsn_document_click,
		business_sellers.bs_cip_letter_text, business_sellers.bs_cip_receive_cpl, business_sellers.bs_cip_stage,
		business_sellers.bs_c_in_p_hia_user, business_sellers.bs_c_in_p_hia_date, business_sellers.bs_c_in_p_est_user,
		business_sellers.bs_c_in_p_est_date, bus_customers.bcust_cip_latest_letter, business_sellers.bs_cipr_sn,
		business_sellers.bs_cipr_smartsheet, business_sellers.bs_cipr_smart_user, business_sellers.bs_cipr_smart_date,
		bus_customers.bcust_cip_calendar, business_sellers.bs_cip_stage_date, business_sellers.bs_cip_letter_user,
		business_sellers.bs_cip_letter_date, business_sellers.bs_cip_stage_user, business_sellers.bs_cip_type,
		business.bsn_cip_com_on_date, business.bsn_cip_com_on_user, business.bsn_cip_com_on_userdt, business.bsn_cip_total_days_added,
		business.bsn_cip_daysadded_date, business.bsn_cip_calendar, business.bsn_cip_letter, business.bsn_cip_daysadded_user,
		business.bsn_cip_calendar_user, business.bsn_cip_calendar_date , business.bsn_cc_link
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where. " 
		group by business_sellers.bs_business_id " .$ord;

//db($sql);


if($sql){$userData = $fwDb->query($sql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 100;
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
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
		$link = BASE_URL."business.detail/bsn_id/".$v['bsn_id'];	
		
			$ccdate = $v['bsn_status_sys_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
			
		if(!empty($v['bsn_cip_com_on_date'])) {	
			$ccdate2 = $v['bsn_cip_com_on_date'];
			$Statusdate2 = changedate_y_m_d($ccdate2);
			$curdate_y_m_d2 = date('Y-m-d');
			$days2 = daysDifference($curdate_y_m_d2, $Statusdate2);
		} else {
			$days2='';	
		}
			
		//bsn_cip_com_on_date	
		
		// Uid 555 starts
				
			$sqluid555 = "Select business_tasks.* from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 555";
		     	$data555 = $fwDb->queryOne($sqluid555);
		
		// Uid 555 ends
		
		
		// Uid 474 starts
				
			$sqluid474 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 474";
		     	$data474 = $fwDb->queryOne($sqluid474);
		
		// Uid 474 ends
		
		// Uid 312 starts
				
			$sqluid312 = "Select business_tasks.* from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 312";
			$data312 = $fwDb->queryOne($sqluid312);
	
		// Uid 312 ends
		
		// Uid 301 starts
				
			$sqluid301 = "Select business_tasks.* from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 301";
			$data301 = $fwDb->queryOne($sqluid301);
	
		// Uid 301 ends
		
		// Uid 330 starts
				
			$sqluid330 = "Select business_tasks.* from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 330";
			$data330 = $fwDb->queryOne($sqluid330);
	
		// Uid 330 ends
		
		// Uid 369 starts
				
			$sqluid369 = "Select business_tasks.* from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 369";
			$data369 = $fwDb->queryOne($sqluid369);
	
		// Uid 369 ends
		
		// Uid 340 starts
				
			$sqluid340 = "Select business_tasks.* from business_tasks
				      where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 340";
			$data340 = $fwDb->queryOne($sqluid340);
	
		// Uid 340 ends
		
		// Uid 40 planning assessment report
				
			$sql44 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
			$data44 = $fwDb->queryOne($sql44);
				
		// Uid 40 ends
		
		// Phone follow ups
		
		 $sfu = "Select count(*) as tot from  sales_followup where sf_pid = ".$v['bsn_id'];
                 $sfData = $fwDb->queryOne($sfu);
				
		// Last follow up date
		
		 $lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = ".$v['bsn_id'];
                 $lfdData = $fwDb->queryOne($lfd);
		
		// Last follow up date ends
		
		
		// Uid 45 Signed Design Agreement
				
			$sql45 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 45";
			$data45 = $fwDb->queryOne($sql45);
				
		// Uid 45 ends
		
		// Uid 2 need analysis survey support
				
			$sql2 = "Select document_check_list.* from document_check_list
			         where document_check_list.doc_bsn_id = ". $v['bsn_id'] . " And document_check_list.doc_name_id = 2";
			$data2 = $fwDb->queryOne($sql2);
				
		// Uid 2 ends
		
		
		// Uid 302 starts
				
			$sqluid302 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = ". $v['bsn_id']. " And business_tasks.bt_task_id = 302";
		     	$data302 = $fwDb->queryOne($sqluid302);
			
		
		$sqldays = "Select max(tc_new_days) as tc_new_days from timeline_center where tc_project like '%".$v['bsn_name']."%'";
		$datadays = $fwDb->queryOne($sqldays);
		if(!$datadays>0)	
		{
				
		$sqldays = "Select tc_days_delay as tc_new_days from timeline_center where tc_project like '%".$v['bsn_name']."%'";
		$datadays = $fwDb->queryOne($sqldays);
		}
		
		// Uid 302ends
		
		$sql_455 = "SELECT doc_file_name FROM document_check_list where doc_bsn_id = ". $v['bsn_id']. " and doc_name_id = 455";
		$data_455 = $fwDb->queryOne($sql_455);		
		
		// Total Letters Starts
		
		$tl = "Select count(*) as tot_lett from  timeline_center where tc_project = '".$v['bsn_name']."' and length(tc_letter_upload) > 0";
        $totletData = $fwDb->queryOne($tl);
		

		$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['status'] = $v['bsn_sub_status'];
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['days2'] = $days2;
		$setdata2[$k]['budget'] = $v['bsn_advert_text'];
		$setdata2[$k]['bsn_cip_letter'] = $v['bsn_cip_letter'];
		$setdata2[$k]['uid555complete'] = $data555['bt_complete'];
		$setdata2[$k]['uid555'] = $data555['bt_completed_date'];
		$setdata2[$k]['uid474complete'] = $data474['bt_complete'];
		$setdata2[$k]['uid474'] = $data474['bt_completed_date'];
		$setdata2[$k]['uid312complete'] = $data312['bt_complete'];
		$setdata2[$k]['uid312'] = $data312['bt_completed_date'];
		$setdata2[$k]['uid301complete'] = $data301['bt_complete'];
		$setdata2[$k]['uid301'] = $data301['bt_completed_date'];
		$setdata2[$k]['uid330complete'] = $data330['bt_complete'];
		$setdata2[$k]['uid330'] = $data330['bt_completed_date'];
		$setdata2[$k]['uid369complete'] = $data369['bt_complete'];
		$setdata2[$k]['uid369'] = $data369['bt_completed_date'];
		$setdata2[$k]['uid340complete'] = $data340['bt_complete'];
		$setdata2[$k]['uid340'] = $data340['bt_completed_date'];
		$setdata2[$k]['checklist44'] = $data44['doc_file_name'];
		$setdata2[$k]['salesfolloup'] = $sfData['tot'];
		$setdata2[$k]['lastfoldt'] = $lfdData['last_followup_date'];
		$setdata2[$k]['checklist45'] = $data45['doc_file_name'];
		$setdata2[$k]['checklist2'] = $data2['doc_file_name'];
		$setdata2[$k]['daysadded'] = $datadays['tc_new_days'];
		$setdata2[$k]['weekly_update_455'] = $data_455['doc_file_name'];
		
		if($data302['bt_complete'] == 1) {
			$setdata2[$k]['boxsent'] = $data302['bt_completed_date'];	
		}
		$setdata2[$k]['total_delay'] = $totletData['tot_lett'];
		
		
		
}
 
 	$fwViewData['list'] =  $setdata2;
 	
 }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Construction Report";

 $sql_l = "Select * from letter_text";
 $fwViewData['letterData'] = $fwDb->query($sql_l);
 
  $sql_2 = "Select * from stage";
  $fwViewData['stageData'] = $fwDb->query($sql_2);
  
  $sql_3 = "Select * from cipr_sn_th";
  $fwViewData['snData'] = $fwDb->query($sql_3);
 
 $table_toplink->setWhere("tl_slug = 'construction_in_progress_report'");
$fwViewData['proc_detail'] = $table_toplink->getRow();

$thisTable = new Fw_Db_Table("cip_type");

$fwViewData['typedetail'] = $thisTable->getAllRows();


  $sql_4 = "Select * from cipr_audit_manager where la_id = 1";
  $fwViewData['amData'] = $fwDb->queryOne($sql_4);
  
  
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
    							 ->setCategory("XRay Report");
    
    
    //$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
    $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
    $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
    
    
    // Add some data
    $objPHPExcel->setActiveSheetIndex(0)
           		->setCellValue('A1', 'Project Address')
    			->setCellValue('B1', 'Customer Name')
               	->setCellValue('C1', "Link")
    			->setCellValue('D1', "Commenced Onsite Date")
    			->setCellValue('E1', "Total Days Added")
    			->setCellValue('F1', "EST HOD Date")
    			->setCellValue('G1', "Letter Text")
    	
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
    				->setCellValue('B'.$row, $v['bcust_fname'].' '.$v['bcust_lname'])
    				->setCellValue('C'.$row, $v['link'])
    				->setCellValue('D'.$row, $v['bsn_cip_com_on_date'])
    				->setCellValue('E'.$row, $v['bsn_cip_total_days_added'])
    				->setCellValue('F'.$row, $v['bs_c_in_p_forcast'])
    				->setCellValue('G'.$row, $v['bs_cip_letter_text'])
    						;
    					
    	$row= $row+1;				
    }
    
    // Rename worksheet
    $objPHPExcel->getActiveSheet()->setTitle('XRay Report');
    
    $objPHPExcel->setActiveSheetIndex(0);
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="xray_report.xls"');
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
