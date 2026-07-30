<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
ini_set("memory_limit", "512M");
ini_set('max_execution_time', 0);

$pagenum = $fwRequest->getparam('pagenum', '');
$keyword = $fwRequest->getParam('keyword', '');
$tablebusiness = new Fw_Db_Table('business');
$tablebs = new Fw_Db_Table('business_sellers');
$table_dpn = new Fw_Db_Table('document_proposal_name');
$tableb_bc = new Fw_Db_Table('bus_customers');

$tablela = new Fw_Db_Table('design_report_last_audit');

$sqltype = "select * from design_report_type ";
$fwViewData['typeData'] = $fwDb->query($sqltype);


$where  = " where dpn_dr_hide = 0";


$hide = $fwRequest->getParam('hide', '');

if (!empty($hide)) {
	$keyh = array_keys($hide);
	$kyh = $keyh[0];
	$hideDetail['dpn_dr_hide'] = $hide[$kyh];
	$table_dpn->setWhere('dpn_unique_id = ' . $kyh);
	$detail = $table_dpn->updateRow($hideDetail);
}


$searchdesigner = $fwRequest->getParam('searchdesigner', '');
if (!empty($searchdesigner)) {
	$design = $fwRequest->getParam('design', '');

	if (!empty($design)) {
		$_SESSION['design'] = $design;
	}
}


if (empty($pagenum)) {
	unset($_SESSION['last_tdsql']);
}


$ord = " Order By document_check_list.doc_date_uploaded DESC ";

$ascdsc = $fwRequest->getParam('sortorder', '');

if ($ascdsc == 1) {
	$ad = "ASC";
} elseif ($ascdsc == 2) {
	$ad = "DESC";
}

$percom = $fwRequest->getParam('percom', '');

if ($percom):

	$ord = " Order By document_proposal_name.dpn_dr_per_complete " . $ad;

	$_SESSION['ord'] = $ord;
	$fwViewData['ascdsc'] = $ascdsc;
	$_SESSION['ascdsc'] = $ascdsc;
	$_SESSION['ad'] = $ad;

elseif ($_SESSION['ord'] && $pagenum > 0):

	$ord = " Order By document_proposal_name.dpn_dr_per_complete " . $_SESSION['ad'];
	$fwViewData['ascdsc'] = $_SESSION['ascdsc'];

endif;


$dasd = $fwRequest->getParam('dasd', '');

if ($dasd):

	$ord = " Order By document_check_list.doc_date_uploaded " . $ad;

	$_SESSION['ord2'] = $ord;
	$fwViewData['ascdsc'] = $ascdsc;
	$_SESSION['ascdsc'] = $ascdsc;
	$_SESSION['ad'] = $ad;

elseif ($_SESSION['ord2'] && $pagenum > 0):

	$ord = " Order By document_check_list.doc_date_uploaded " . $_SESSION['ad'];
	$fwViewData['ascdsc'] = $_SESSION['ascdsc'];

endif;


$searchkey = $fwRequest->getParam('searchkey', '');

if ($searchkey):

	$where .= " AND (document_proposal_name.dpn_unique_id LIKE '" . $searchkey . "%') ";

	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey'] = $_SESSION['searchkey'];

elseif ($_SESSION['searchkey'] && $pagenum > 0):

	$where .= " AND ( document_proposal_name.dpn_unique_id LIKE '" . $_SESSION['searchkey'] . "%')' ";

	$fwViewData['searchkey'] = $_SESSION['searchkey'];

endif;

$clear = $fwRequest->getParam('clear', '');
if ($clear) {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey'] = '';
	$searchkey = '';
	$fwViewData['searchkey'] = '';
	unset($_SESSION['design']);
	unset($_SESSION['reno_only']);
	isset($_SESSION['type']);
	$where  = " where dpn_dr_hide = 0";
}



$sql = "Select SQL_CALC_FOUND_ROWS null as row_name,  dpn_bsn_id, dpn_unique_id
	    from document_proposal_name " . $where;

if ($sql) {
	$userData = $fwDb->query($sql);

	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	if ($pagenum <= 1) {
		$pagenum = 1;
	}
	$page_rows = 100;
	//$rows = count($userData);
	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $sql . " " . $max;
	$setdata2 = $fwDb->query($sql2);
	$total = $fwDb->query('SELECT FOUND_ROWS() as rows');
	$total = $rows = $total[0]['rows'];
}


//$total2 = sizeof($userData);
$total2 = $total;
//$fwViewData['active'] =  $total2;
$fwViewData['active'] =  sizeof($setdata2);

if (empty($pagenum)) {
	$pagenum = 1;
}

$fwViewData['total'] =  $total2 - ($pagenum - 1) * 300;

if (!empty($setdata2)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}

	$last = ceil($rows / $page_rows);

	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$numstartvounter =  $page_rows * ($pagenum - 1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;

	$fwViewData['last'] = $last;
	$fwViewData['lastone'] = $last - 1;
	$fwViewData['lasttow'] = $last - 2;
	$fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext++;
	}
	$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev--;
	}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);



	if ($sql2) {
	//	$k = 0;
		foreach ($setdata2 as $k => $v) {


		$sql_bus = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
           	      business.bsn_id, business.bsn_name,  business.bsn_address
			     
			     from business_sellers 		
			     Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			     Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			     where business.bsn_id = " . $v['dpn_bsn_id'];

			$busData = $fwDb->queryOne($sql_bus);

			$link = "http://www.deckquotes.com.au/business.detail/bsn_id/" . $v['dpn_bsn_id'];


			$sql287 = "Select doc_date_uploaded, doc_file_name from document_check_list
	                  where doc_name_id = 287 and doc_bsn_id = " . $v['dpn_bsn_id'];

			$data287 = $fwDb->queryOne($sql287);
			
			
			$sql45 = "Select doc_date_uploaded, doc_file_name from document_check_list
	                  where doc_name_id = 45 and doc_bsn_id = " . $v['dpn_bsn_id'];

			$data45 = $fwDb->queryOne($sql45);

			$sql535 = "Select business_tasks.bt_completed_date from business_tasks
			          where business_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And business_tasks.bt_task_id = 535";

			$data535 = $fwDb->queryOne($sql535);

			$sql725 = "Select doc_date_uploaded, doc_file_name from document_check_list
	                  where doc_name_id = 725 and doc_bsn_id = " . $v['dpn_bsn_id'];

			$data725 = $fwDb->queryOne($sql725);
			
			
			$sql666 = "Select business_tasks.bt_completed_date from business_tasks
			          where business_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And business_tasks.bt_task_id = 666";
					  
			$data666 = $fwDb->queryOne($sql666);
			
			$sql72 = "Select  doc_file_name from document_check_list
	                  where doc_name_id = 72 and doc_bsn_id = " . $v['dpn_bsn_id'];

			$data72 = $fwDb->queryOne($sql72);
			
			
			$sql799 = "Select business_tasks.bt_completed_date from business_tasks
			          where business_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And business_tasks.bt_task_id = 799";
					  
			$data799 = $fwDb->queryOne($sql799);
			
			
			$sql303 = "Select business_tasks.bt_completed_date from business_tasks
			          where business_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And business_tasks.bt_task_id = 303";
					  
			$data303 = $fwDb->queryOne($sql303);
			
			$sql430 = "Select  doc_file_name,doc_date_uploaded from document_check_list
	                  where doc_name_id = 430 and doc_bsn_id = " . $v['dpn_bsn_id'];
					  
			$data430 = $fwDb->queryOne($sql430);		  
			
			$sql272 = "Select  doc_file_name,doc_date_uploaded from document_check_list
	                  where doc_name_id = 272 and doc_bsn_id = " . $v['dpn_bsn_id'];
					  
			$data272 = $fwDb->queryOne($sql272);
			
			$sqlP132 = "Select proposal_tasks.bt_completed_date from proposal_tasks
			           where proposal_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And proposal_tasks.bt_task_id = 132
					   and proposal_tasks.bt_task_list_number = 1" ;
					  
			$dataP132 = $fwDb->queryOne($sqlP132);
			
			//$sql381 = "Select business_tasks.bt_completed_date from business_tasks
			//          where business_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And business_tasks.bt_task_id = 381";
					  
			//$data381 = $fwDb->queryOne($sql381);
			
			
			$sql381 = "Select  doc_date_uploaded from document_check_list
	                  where doc_name_id = 381 and doc_bsn_id = " . $v['dpn_bsn_id'];

			$data381 = $fwDb->queryOne($sql381);
			
			$sql148 = "Select proposal_tasks.bt_completed_date from proposal_tasks
			          where proposal_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And proposal_tasks.bt_task_id = 148 
					  and proposal_tasks.bt_task_list_number = 1 ";
					  
			$data148 = $fwDb->queryOne($sql148);
			
			
			$sqlP123 = "Select proposal_tasks.bt_completed_date from proposal_tasks
			          where proposal_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And proposal_tasks.bt_task_id = 123 
					  and proposal_tasks.bt_task_list_number = 1";
					  
			$dataP123 = $fwDb->queryOne($sqlP123);
			
			$sqlP29 = "Select proposal_tasks.bt_completed_date from proposal_tasks
			          where proposal_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And proposal_tasks.bt_task_id = 29 
					  and proposal_tasks.bt_task_list_number = 1";
					  
			$dataP29 = $fwDb->queryOne($sqlP29);
			
			$sqlP109 = "Select proposal_tasks.bt_completed_date from proposal_tasks
			          where proposal_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And proposal_tasks.bt_task_id = 109 
					  and proposal_tasks.bt_task_list_number = 1";
					  
			$dataP109 = $fwDb->queryOne($sqlP109);
			
			
			$sqlpr = "Select person_responsible_detail.* from person_responsible_detail
			 		 where person_responsible_detail.prd_bsn_id = " . $v['dpn_bsn_id'] .
			   	    " And person_responsible_detail.prd_position = 'Designer' ";
			$dataDesig = $fwDb->queryOne($sqlpr);
			
			$sql482 = "Select  doc_file_name, doc_date_uploaded from document_check_list
	                  where doc_name_id = 482 and doc_bsn_id = " . $v['dpn_bsn_id'];
			$data482 = $fwDb->queryOne($sql482);
			

			$setdata2[$k]['chknoData'] = $v['dpn_unique_id'];
			$setdata2[$k]['bsn_id'] = $v['dpn_bsn_id'];
			$setdata2[$k]['bs_customers_id'] = $busData['bs_customers_id'];
			$setdata2[$k]['bsn_address'] = $busData['bsn_address'];
			$setdata2[$k]['bcust_fname'] = $busData['bcust_fname'];
			$setdata2[$k]['bcust_lname'] = $busData['bcust_lname'];
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['checklist287'] =  changedate_d_m_y($data287['doc_date_uploaded']);
			$setdata2[$k]['checklist45'] =  changedate_d_m_y($data45['doc_date_uploaded']);
			$setdata2[$k]['tasklist535'] =  changedate_d_m_y($data535['bt_completed_date']);
			$setdata2[$k]['doc_file_name_287'] =  $data287['doc_file_name'];
			$setdata2[$k]['doc_file_name_725'] =  $data725['doc_file_name'];
			$setdata2[$k]['tasklist666'] =  changedate_d_m_y($data666['bt_completed_date']);
			$setdata2[$k]['doc_file_name_72'] =  $data72['doc_file_name'];
			$setdata2[$k]['tasklist799'] =  changedate_d_m_y($data799['bt_completed_date']);
			$setdata2[$k]['tasklist303'] =  changedate_d_m_y($data303['bt_completed_date']);
			
			$setdata2[$k]['doc_file_name_430'] =  $data430['doc_file_name'];
			$setdata2[$k]['doc_date_uploaded_430'] =  changedate_d_m_y($data430['doc_date_uploaded']);
			
			$setdata2[$k]['doc_file_name_272'] =  $data272['doc_file_name'];
			$setdata2[$k]['doc_date_uploaded_272'] =  changedate_d_m_y($data272['doc_date_uploaded']);
			$setdata2[$k]['tasklistP132'] =  changedate_d_m_y($dataP132['bt_completed_date']);
			
			$setdata2[$k]['tasklist381'] =  changedate_d_m_y($data381['doc_date_uploaded']);
			$setdata2[$k]['tasklist148'] =  changedate_d_m_y($data148['bt_completed_date']);
			
			$setdata2[$k]['tasklistP123'] =  changedate_d_m_y($dataP123['bt_completed_date']);
			$setdata2[$k]['tasklistP29'] =  changedate_d_m_y($dataP29['bt_completed_date']);
			$setdata2[$k]['tasklistP109'] =  changedate_d_m_y($dataP109['bt_completed_date']);
			$setdata2[$k]['designer'] = $dataDesig['prd_name'];
			
			
			$setdata2[$k]['doc_file_name_482'] =  $data482['doc_file_name'];
			$setdata2[$k]['doc_date_uploaded_482'] =  changedate_d_m_y($data482['doc_date_uploaded']);
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


$dasd = $fwRequest->getParam('dasd', '');
if ($dasd):

	foreach ($setdata2 as $key => $row) {

		$desig[$key]  = changedate_y_m_d($row['checklist45']);
	}
	if ($ascdsc == 1) {
		array_multisort($desig, SORT_ASC, $setdata2);
	} else {
		array_multisort($desig, SORT_DESC, $setdata2);
	}


	$fwViewData['list'] =  $setdata2;
endif;

$sortbydesigner = $fwRequest->getParam('sortbydesigner', '');
if ($sortbydesigner):

	foreach ($setdata2 as $key => $row) {

		$desig[$key]  = $row['designer'];
	}
	if ($ascdsc == 1) {
		array_multisort($desig, SORT_ASC, $setdata2);
	} else {
		array_multisort($desig, SORT_DESC, $setdata2);
	}


	$fwViewData['list'] =  $setdata2;
endif;

if (!empty($design) || isset($_SESSION['design'])) {
	foreach ($setdata2 as $m1 => $s1) {
		if ($s1['designer'] <> $_SESSION['design']) {
			unset($setdata2[$m1]);
		}
	}
}


$fwViewData['list'] =  $setdata2;


$sql_designer = "SELECT DISTINCT prd_name FROM person_responsible_detail
       WHERE `prd_position` = 'designer' ";
$fwViewData['des_data'] = $fwDb->query($sql_designer);
