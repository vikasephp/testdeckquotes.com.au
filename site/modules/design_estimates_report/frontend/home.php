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

// Save Last Spoken
$dpn_dr_last_spoken = $fwRequest->getParam('dpn_dr_last_spoken', '');
if (!empty($dpn_dr_last_spoken)) {
	$l_spoken = $fwRequest->getParam('dpn_dr_last_spoken', '');

	$keyl = array_keys($l_spoken);
	$kyl = $keyl[0];
	$lDetail['dpn_dr_last_spoken'] = $l_spoken[$kyl];
	$lDetail['dpn_dr_last_spoken_date'] = date('d-m-Y');
	$lDetail['dpn_dr_last_spoken_user'] = $_SESSION['user']['user_name'];

	$table_dpn->setWhere('dpn_unique_id = ' . $kyl);
	$detail_l = $table_dpn->updateRow($lDetail);
}
//End Last Spoken

$audit_whole = $fwRequest->getParam('audit_whole', '');

if (!empty($audit_whole)) {

	$keyla = array_keys($audit_whole);
	$kyla = $keyla[0];
	$lahDetail['la_last_audit'] = $audit_whole[$kyla];
	$lahDetail['la_last_audit_date'] = date('d-m-Y');
	$lahDetail['la_last_audit_user'] = $_SESSION['user']['user_name'];
	$tablela->setWhere('la_id = 1');
	$detail_lah = $tablela->updateRow($lahDetail);
}

$sqlwla = "select * from design_report_last_audit ";
$fwViewData['wlaData'] = $fwDb->queryOne($sqlwla);

$upload_letter = $fwRequest->getParam('upload_letter', '');
if ($upload_letter) {

	if ($_FILES['letter']['name']) {

		$docfile_1 = $_FILES['letter']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['letter']['tmp_name'];
		$presheetData['dpn_dr_latest_letter'] = $docfile_1;

		upload($docfile_1, $temp_name_1);

		$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', '');

		$table_dpn->setWhere('dpn_unique_id = ' . $dpn_unique_id);
		if ($table_dpn->rowExists()) {

			$detail = $table_dpn->updateRow($presheetData);
		}
	}
}

$upload_cu_survey = $fwRequest->getParam('upload_cu_survey', '');
if ($upload_cu_survey) {

	if ($_FILES['custsurvey']['name']) {

		$docfile_2 = $_FILES['custsurvey']['name'];
		$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
		$temp_name_2 = $_FILES['custsurvey']['tmp_name'];
		$csData['dpn_dr_cust_survey'] = $docfile_2;

		upload($docfile_2, $temp_name_2);

		$dpn_unique_id = $fwRequest->getParam('dpn_unique_id', '');

		$table_dpn->setWhere('dpn_unique_id = ' . $dpn_unique_id);
		if ($table_dpn->rowExists()) {

			$detail = $table_dpn->updateRow($csData);
		}
	}
}



$where  = " where dpn_dr_hide = 0";
$red_light = $fwRequest->getParam('red_light', '');
if (!empty($red_light)) {
	$where .= " and dpn_dr_traffic_light = 3 ";
}


$fwViewData['ran'] =  rand(100000, 999999);

$incpr = $fwRequest->getParam('incpr', '');
if ($incpr) {
	$keyi = array_keys($incpr);
	$kyi = $keyi[0];
	$incprDetail['bsn_showin_cpr'] = $incpr[$kyi];
	$tablebusiness->setWhere('bsn_id = ' . $kyi);
	$detail = $tablebusiness->updateRow($incprDetail);
}

$utility = $fwRequest->getParam('utility', '');
if ($utility) {
	$keyu = array_keys($utility);
	$kyu = $keyu[0];
	$incprDetail['dpn_err_add'] = $utility[$kyu];
	$table_dpn->setWhere('dpn_unique_id = ' . $kyu);
	$detail = $table_dpn->updateRow($incprDetail);
}


// Save customer budget
$budget = $fwRequest->getParam('savebudget', '');
if (!empty($budget)) {
	$dt = date('d-m-Y h:i:sa');
	$user = $_SESSION['user']['user_name'];
	$budgetData = $fwRequest->getParam('cust_budget', '');
	$key = array_keys($budgetData);
	$ky = $key[0];

	$budgDetail['dpn_dr_cust_budget'] = $budgetData[$ky];
	$budgDetail['dpn_dr_budg_user'] = $user;
	$budgDetail['dpn_dr_budg_date'] = $dt;

	$table_dpn->setWhere('dpn_unique_id = ' . $ky);
	$detail = $table_dpn->updateRow($budgDetail);
}
//End customer budget

$saveper = $fwRequest->getParam('saveper', '');
if (!empty($saveper)) {

	$percData = $fwRequest->getParam('percentage', '');
	$key = array_keys($percData);
	$ky = $key[0];
	$percDetail['dpn_dr_per_complete'] = $percData[$ky];

	$table_dpn->setWhere('dpn_unique_id = ' . $ky);
	$detail = $table_dpn->updateRow($percDetail);
}
// Start survey details
$survey_details = $fwRequest->getParam('survey_details', '');
if (!empty($survey_details)) {

	$surveyor = $fwRequest->getParam('surveyor', '');
	$who = $fwRequest->getParam('who', '');
	$cdate = $fwRequest->getParam('cdate', '');

	$key = array_keys($surveyor);
	$ky = $key[0];
	$surDetail['dpn_dr_surveyor'] = $surveyor[$ky];
	$surDetail['dpn_dr_who_provided'] = $who[$ky];
	$surDetail['dpn_dr_sur_comp_date'] = $cdate[$ky];

	$table_dpn->setWhere('dpn_unique_id = ' . $ky);
	$detail = $table_dpn->updateRow($surDetail);
}

// End survey details

// Save renovation estimated cost
$esrenocost = $fwRequest->getParam('esrenocost', '');
if (!empty($esrenocost)) {

	$ercData = $fwRequest->getParam('renovation_cost', '');
	$key = array_keys($ercData);
	$ky = $key[0];
	$ercDetail['dpn_dr_erc'] = $ercData[$ky];

	$table_dpn->setWhere('dpn_unique_id = ' . $ky);
	$detail = $table_dpn->updateRow($ercDetail);
}
//End renovation estimated cost

// Save Reno Only
$renoonly = $fwRequest->getParam('renoonly', '');
if (!empty($renoonly)) {

	$key = array_keys($renoonly);
	$ky = $key[0];
	$renoDetail['dpn_dr_renoonly'] = $renoonly[$ky];
	$table_dpn->setWhere('dpn_unique_id = ' . $ky);


	$detail = $table_dpn->updateRow($renoDetail);
}
//End Reno Only

// Save Scan
$scan = $fwRequest->getParam('scan', '');
if (!empty($scan)) {
	$key = array_keys($scan);
	$ky = $key[0];
	$scanDetail['dpn_dr_scan'] = $scan[$ky];
	$table_dpn->setWhere('dpn_unique_id = ' . $ky);
	$detail = $table_dpn->updateRow($scanDetail);
}
//End Scan


// Save Plans attached to letter
$plan = $fwRequest->getParam('plan', '');
if (!empty($plan)) {
	$key = array_keys($plan);
	$ky = $key[0];
	$planDetail['dpn_dr_plan_attached'] = $plan[$ky];
	$table_dpn->setWhere('dpn_unique_id = ' . $ky);
	$detail = $table_dpn->updateRow($planDetail);
}
//End Plans attached to letter

// Save Sales Letter
$salesletter = $fwRequest->getParam('salesletter', '');
if (!empty($salesletter)) {
	$key = array_keys($salesletter);
	$ky = $key[0];
	$slDetail['dpn_dr_sales_letter'] = $salesletter[$ky];
	$table_dpn->setWhere('dpn_unique_id = ' . $ky);
	$detail = $table_dpn->updateRow($slDetail);
}
//End Sales Letter



$hide = $fwRequest->getParam('hide', '');

if (!empty($hide)) {
	$keyh = array_keys($hide);
	$kyh = $keyh[0];
	$hideDetail['dpn_dr_hide'] = $hide[$kyh];
	$table_dpn->setWhere('dpn_unique_id = ' . $kyh);
	$detail = $table_dpn->updateRow($hideDetail);
}

$reno_only = $fwRequest->getParam('reno_only', '');
if (!empty($reno_only)) {
	$_SESSION['reno_only'] = $reno_only;
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
	unset($_SESSION['reno_only']);
	$where  = " where dpn_dr_hide = 0";
}

$order = "ORDER BY (dpn_last_audit_update_at = ''), STR_TO_DATE(dpn_last_audit_update_at, '%d-%m-%Y') DESC";

$sql = "Select SQL_CALC_FOUND_ROWS null as row_name,  dpn_bsn_id, dpn_unique_id, dpn_budget, dpn_dr_type, dpn_dr_what, dpn_dr_survey_imple, dpn_dr_est_cname, 
       dpn_dr_likely_cname, dpn_dr_reno_cname,
	  dpn_dr_survey_imp_user, dpn_dr_survey_date, dpn_dr_cust_budget, dpn_dr_budg_user, dpn_dr_budg_date,
	  dpn_dr_per_complete , dpn_dr_letter_text , dpn_dr_rr, dpn_dr_surveyor, dpn_dr_sur_comp_date,
	  dpn_dr_who_provided, dpn_dr_traffic_light , dpn_dr_tl_user , dpn_dr_tl_date , dpn_dr_tl_reason,
	  dpn_dr_renoonly, dpn_dr_scan, dpn_dr_plan_attached, dpn_dr_estimate_cost, dpn_dr_likely_value,
	  dpn_dr_hide, dpn_dr_latest_letter, dpn_dr_sqm, dpn_dr_last_audit, dpn_dr_last_audit_user, dpn_dr_first_meeting_date,
	  dpn_dr_erc, dpn_dr_r_plus_e, dpn_dr_deagree, dpn_dr_wherewe, dpn_dr_cust_des_hour, dpn_dr_overhour, dpn_dr_total_hours,
	  dpn_dr_ebc_comm, dpn_dr_erc_comm, dpn_dr_likey_comm, dpn_dr_re_comm, dpn_dr_tdso_dt, dpn_dr_survey, 
	  dpn_dr_surveydt, dpn_dr_sign_off_sent_date, dpn_dr_rating, dpn_dr_building_file, dpn_dr_alerts, dpn_proposal_number,
	  dpn_dr_sales_letter, dpn_dr_type_new, dpn_dr_cust_survey, dpn_err_add, dpn_dr_cdh_date, dpn_dr_cdh_user, dpn_dr_oah_date,
	  dpn_dr_oah_user, dpn_dr_general_hours, dpn_dr_last_spoken, dpn_dr_last_spoken_date, dpn_dr_last_spoken_user, dpn_dr_plan_revno,
	  dpn_dr_gen_hour_date, dpn_dr_gen_hour_user, dpn_customer_designer, dpn_dr_next_date, dpn_dr_next_time, dpn_dr_next_location, dpn_dr_next_meeting, 
	  dpn_dr_next_link, 	dpn_last_audit_by, dpn_last_audit_update_at,
	  dpn_dr_ec_cmt, dpn_dr_ec_date, dpn_dr_likely_cmt, dpn_dr_likely_date, dpn_dr_erc_cmt, dpn_dr_erc_date, dpn_dr_ut_cname, dpn_dr_ut_cmt, dpn_dr_ut_date, 
	  dpn_customer_objectives, dpn_customer_objectives_date, dpn_customer_objectives_user, dpn_est_build_link_current, dpn_est_build_link_historical, 
	  dpn_likely_scope_link_current, dpn_likely_scope_link_historical, dpn_reno_link_current, dpn_reno_link_historical, dpn_ut_link_current, dpn_ut_link_historical, 
	  dpn_last_audit_cs_by, dpn_build_cal_current, dpn_build_cal_historical, dpn_build_cal_cmt, dpn_last_audit_cs_updated_at, dpn_reno_cal_current, dpn_reno_cal_historical,
	  dpn_reno_cal_cmt , dpn_dr_per_complete
	  from document_proposal_name " . $where . " And dpn_archived = 0 ".$order;
	  	

if ($sql) {
	//$userData = $fwDb->query($sql);

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

$startTime = microtime(true);

$bsnIDs = [];
foreach ($setdata2 as $row) {
 	$bsnIDs[] = $row['dpn_bsn_id'];
}
// db($bsnIDs);
$implodeBsnIDs = implode(',', $bsnIDs);

$qry = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
			bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business,
	   		bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name,  business.bsn_address,
	   		business.bsn_address_same, business.bsn_showin_cpr
			from business_sellers 		
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id
			WHERE bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$busData = [];
foreach($res as $row) {
	$busData[$row['bsn_id']] = $row;
}

$qry = "SELECT doc_bsn_id, doc_date_uploaded from document_check_list where doc_name_id = 45 AND doc_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$data45 = [];
foreach($res as $row) {
	$data45[$row['doc_bsn_id']] = $row;
}

$qry = "SELECT doc_bsn_id, doc_checklist_number, doc_date_uploaded, doc_file_name FROM document_check_list_mini WHERE doc_name_id = 53 AND doc_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$cpData = [];
foreach($res as $row) {
	if(!isset($cpData[$row['doc_bsn_id']])) {
		$cpData[$row['doc_bsn_id']] = [];
	}
	$cpData[$row['doc_bsn_id']][$row['doc_checklist_number']] = $row;
}

$qry = "SELECT doc_date_uploaded, doc_bsn_id, doc_checklist_number FROM document_check_list_mini WHERE doc_name_id = 54 AND doc_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$data54 = [];
foreach($res as $row) {
	if(!isset($data54[$row['doc_bsn_id']])) {
		$data54[$row['doc_bsn_id']] = [];
	}
	$data54[$row['doc_bsn_id']][$row['doc_checklist_number']] = $row;
}

$qry = "SELECT prd_name, prd_bsn_id from person_responsible_detail where prd_position = 'Designer' AND prd_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$dataDesig = [];
foreach($res as $row) {
	$dataDesig[$row['prd_bsn_id']] = $row;
}

$qry = "SELECT prd_name, prd_bsn_id from person_responsible_detail where prd_position like '%Overseas Architect%' AND prd_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$dataOsa = [];
foreach($res as $row) {
	$dataOsa[$row['prd_bsn_id']] = $row;
}

$qry = "SELECT dcnt_bsn_id, dcnt_counter from document_check_list_mini_count WHERE dcnt_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$datapc = [];
foreach($res as $row) {
	$datapc[$row['dcnt_bsn_id']] = $row;
}

$qry = "SELECT doc_file_name, doc_date_uploaded, doc_checklist_number, doc_bsn_id FROM document_check_list_mini WHERE doc_name_id = 20 AND doc_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$mpData = [];
foreach($res as $row) {
	if(!isset($mpData[$row['doc_bsn_id']])) {
		$mpData[$row['doc_bsn_id']] = [];
	}
	$mpData[$row['doc_bsn_id']][$row['doc_checklist_number']] = $row;
}

$qry = "SELECT doc_bsn_id, doc_file_name from document_check_list where doc_name_id = 72 AND doc_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$suData = [];
foreach($res as $row) {
	$suData[$row['doc_bsn_id']] = $row;
}

$qry = "SELECT bt_bsn_id, bt_completed_date from business_tasks where bt_task_id = 303 AND bt_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$data303 = [];
foreach($res as $row) {
	$data303[$row['bt_bsn_id']] = $row;
}
/* $endTime = microtime(true);
$executionTime = $endTime - $startTime;
echo "data303";
db($executionTime); */

$qry = "SELECT doc_bsn_id, doc_file_name from document_check_list where doc_name_id = 458 AND doc_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$data_lcl = [];
foreach($res as $row) {
	$data_lcl[$row['doc_bsn_id']] = $row;
}

$qry = "SELECT doc_bsn_id, doc_file_name, doc_date_uploaded from document_check_list where document_check_list.doc_name_id = 180 AND doc_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$data_cwg = [];
foreach($res as $row) {
	$data_cwg[$row['doc_bsn_id']] = $row;
}

/* $endTime = microtime(true);
$executionTime = $endTime - $startTime;
echo "data_cwg";
db($executionTime); */

$qry = "SELECT dpn_bsn_id, dpn_unique_id from document_renovation_name WHERE dpn_bsn_id IN ($implodeBsnIDs)";
$res = $fwDb->query($qry);
$data_rcn = [];
foreach($res as $row) {
	$data_rcn[$row['dpn_bsn_id']] = $row;
}


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
		$k = 0;
		foreach ($setdata2 as $k2 => $v) {
			// $endTime = microtime(true);
			// $executionTime = $endTime - $startTime;
			// echo "START LOOP: " . $k2;
			// db($executionTime);

			// $sql_bus = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
			// 	bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business,
			// 	bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name,  business.bsn_address,
			// 	business.bsn_address_same, business.bsn_showin_cpr
			// 	from business_sellers 		
			// 	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			// 	Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			// 	where business.bsn_id = " . $v['dpn_bsn_id'];

			// $busData = $fwDb->queryOne($sql_bus);

			$link = BASE_URL."business.detail/bsn_id/" . $v['dpn_bsn_id'];


			// $sql45 = "Select doc_date_uploaded from document_check_list
	        //    where doc_name_id = 45 and doc_bsn_id = " . $v['dpn_bsn_id'];

			// $data45 = $fwDb->queryOne($sql45);

			$dayscount = '';

			$Statusdate = changedate_y_m_d($data45[$v['dpn_bsn_id']]['doc_date_uploaded']);

			if (!empty($Statusdate)) {
				$curdate_y_m_d = date('Y-m-d');
				$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
			}

			$dt = changedate_y_m_d($data54[$v['dpn_bsn_id']][$v['dpn_proposal_number']]['doc_date_uploaded']);

			$days = '';
			if (!empty($dt)) {
				$curdate_y_m_d = date('Y-m-d');
				$days = daysDifference($curdate_y_m_d, $dt);
			}
			
			$sql_458 = "SELECT doc_file_name FROM document_check_list where doc_bsn_id = ". $v['dpn_bsn_id']. " and doc_name_id = 458";
			$data_458 = $fwDb->queryOne($sql_458);

			$setdata2[$k]['chknoData'] = $v['dpn_unique_id'];
			$setdata2[$k]['bsn_id'] = $v['dpn_bsn_id'];
			$setdata2[$k]['bs_customers_id'] = $busData[$v['dpn_bsn_id']]['bs_customers_id'];
			$setdata2[$k]['bsn_address'] = $busData[$v['dpn_bsn_id']]['bsn_address'];
			$setdata2[$k]['bcust_fname'] = $busData[$v['dpn_bsn_id']]['bcust_fname'];
			$setdata2[$k]['bcust_lname'] = $busData[$v['dpn_bsn_id']]['bcust_lname'];
			$setdata2[$k]['bcust_misc_email1'] = $busData[$v['dpn_bsn_id']]['bcust_misc_email1'];
			$setdata2[$k]['bcust_misc_email2'] = $busData[$v['dpn_bsn_id']]['bcust_misc_email2'];
			$setdata2[$k]['bcust_misc_moble'] = $busData[$v['dpn_bsn_id']]['bcust_misc_moble'];
			$setdata2[$k]['bcust_misc_business'] = $busData[$v['dpn_bsn_id']]['bcust_misc_business'];
			$setdata2[$k]['bcust_misc_home'] = $busData[$v['dpn_bsn_id']]['bcust_misc_home'];
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['reno_checklist_no'] = $data_rcn[$v['dpn_bsn_id']]['dpn_unique_id'];
			$setdata2[$k]['checklist53'] =  changedate_d_m_y($cpData[$v['dpn_bsn_id']][$v['dpn_proposal_number']]['doc_date_uploaded']);
			$setdata2[$k]['checklist53_file'] = $cpData[$v['dpn_bsn_id']][$v['dpn_proposal_number']]['doc_file_name'];
			$setdata2[$k]['checklist54'] =  changedate_d_m_y($data54[$v['dpn_bsn_id']][$v['dpn_proposal_number']]['doc_date_uploaded']);
			$setdata2[$k]['designer'] = $dataDesig[$v['dpn_bsn_id']]['prd_name'];
			$setdata2[$k]['osarchi'] = $dataOsa[$v['dpn_bsn_id']]['prd_name'];
			$setdata2[$k]['prochklist'] = $datapc[$v['dpn_bsn_id']]['dcnt_counter'];
			//$setdata2[$k]['lmpData'] = $mpData;
			$setdata2[$k]['lmp_date'] = changedate_d_m_y($mpData[$v['dpn_bsn_id']][$v['dpn_proposal_number']]['doc_date_uploaded']);
			$setdata2[$k]['lmp_doc_file_name'] = $mpData[$v['dpn_bsn_id']][$v['dpn_proposal_number']]['doc_file_name'];
			// $setdata2[$k]['chknoData_new'] = $chknoData_new['dpn_unique_id'];
			$setdata2[$k]['bsn_address_same'] = $busData[$v['dpn_bsn_id']]['bsn_address_same'];
			$setdata2[$k]['survey_uploaded'] = $suData[$v['dpn_bsn_id']]['doc_file_name'];
			$setdata2[$k]['tasklist303'] =  changedate_d_m_y($data303[$v['dpn_bsn_id']]['bt_completed_date']);
			$setdata2[$k]['checklist458'] = $data_lcl[$v['dpn_bsn_id']]['doc_file_name'];
			$setdata2[$k]['checklist179_file'] = $data_cwg[$v['dpn_bsn_id']]['doc_file_name'];
			$setdata2[$k]['checklist179_date'] = changedate_d_m_y($data_cwg[$v['dpn_bsn_id']]['bt_completed_date']);
			$setdata2[$k]['bsn_showin_cpr'] = $busData[$v['dpn_bsn_id']]['bsn_showin_cpr'];
			$setdata2[$k]['dayscount'] = $dayscount;
			$setdata2[$k]['checklist45'] =  changedate_d_m_y($data45[$v['dpn_bsn_id']]['doc_date_uploaded']);
			$setdata2[$k]['days'] = $days;
			$setdata2[$k]['client_letter_458'] = $data_458['doc_file_name'];
			
			
			$ebcDate = $v['dpn_dr_ec_date'];
			$ebcColor = '';
			
			$lssDate = $v['dpn_dr_likely_date'];
			$lssColor = '';
			
			$ercDate = $v['dpn_dr_erc_date'];
			$ercColor = '';

			$utDate = $v['dpn_dr_ut_date'];
			$utColor = '';
			
			$today = new DateTime();
			$threeMonthsAgo = (clone $today)->modify('-3 months');
			$twoMonthsAgo   = (clone $today)->modify('-2 months');

			if (!empty($ebcDate)){
				$estimateEbcDate = DateTime::createFromFormat('d-m-Y', $ebcDate);
				if ($estimateEbcDate) {
					if ($estimateEbcDate < $threeMonthsAgo) {
						$ebcColor = 'red';
					}
					elseif ($estimateEbcDate < $twoMonthsAgo) {
						$ebcColor = 'yellow';
					}
				}
			}
			
			if (!empty($lssDate)){
				$estimatelssDate = DateTime::createFromFormat('d-m-Y', $lssDate);
				if ($estimatelssDate) {
					if ($estimatelssDate < $threeMonthsAgo) {
						$lssColor = 'red';
					}
					elseif ($estimatelssDate < $twoMonthsAgo) {
						$lssColor = 'yellow';
					}
				}
			}
			
			if (!empty($ercDate)){
				$estimateErcDate = DateTime::createFromFormat('d-m-Y', $ercDate);
				if ($estimateErcDate) {
					if ($estimateErcDate < $threeMonthsAgo) {
						$ercColor = 'red';
					}
					elseif ($estimateErcDate < $twoMonthsAgo) {
						$ercColor = 'yellow';
					}
				}
			}

			if (!empty($utDate)){
				$estimateUtDate = DateTime::createFromFormat('d-m-Y', $utDate);
				if ($estimateUtDate) {
					if ($estimateUtDate < $threeMonthsAgo) {
						$utColor = 'red';
					}
					elseif ($estimateUtDate < $twoMonthsAgo) {
						$utColor = 'yellow';
					}
				}
			}
			
			$setdata2[$k]['ebcColor'] = $ebcColor;
			$setdata2[$k]['lssColor'] = $lssColor;
			$setdata2[$k]['ercColor'] = $ercColor;
			$setdata2[$k]['utColor'] = $utColor;
			

			$v['dpn_dr_general_hours'] = (!empty($v['dpn_dr_general_hours'])) ? $v['dpn_dr_general_hours'] : 0;
			$v['dpn_dr_cust_des_hour'] = (!empty($v['dpn_dr_cust_des_hour'])) ? $v['dpn_dr_cust_des_hour'] : 0;
			$v['dpn_dr_overhour'] = (!empty($v['dpn_dr_overhour'])) ? $v['dpn_dr_overhour'] : 0;

			$setdata2[$k]['total_hours'] = $v['dpn_dr_general_hours'] + $v['dpn_dr_cust_des_hour'] + $v['dpn_dr_overhour'];

			$k++;
		}


		$fwViewData['list'] =  $setdata2;
	}
}


// foreach ($setdata2 as $key => $row) {

	// $desig[$key]  = $row['dayscount'];
// }

// array_multisort($desig, SORT_ASC, $setdata2);

//array_multisort($desig, SORT_DESC, $setdata2);



$fwViewData['list'] =  $setdata2;



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



$sortbypercomp = $fwRequest->getParam('sortbypercomp', '');
if ($sortbypercomp):

	foreach ($setdata2 as $key => $row) {

		$desig[$key]  = $row['dpn_dr_per_complete'];
	}
	if ($ascdsc == 1) {
		array_multisort($desig, SORT_ASC, $setdata2);
	} else {
		array_multisort($desig, SORT_DESC, $setdata2);
	}

	$fwViewData['list'] =  $setdata2;
endif;

$sortbyladesigner = $fwRequest->getParam('sortbyladesigner', '');
if ($sortbyladesigner):

	foreach ($setdata2 as $key => $row) {

		//$desig[$key]  = $row['dpn_last_audit_update_at'];
			
		 $date = DateTime::createFromFormat('d-m-Y', $row['dpn_last_audit_update_at']);
         $desig[$key] = $date ? $date->getTimestamp() : 0;
	}
	if ($ascdsc == 1) {
		array_multisort($desig, SORT_ASC, $setdata2);
	} else {
		array_multisort($desig, SORT_DESC, $setdata2);
	}

	$fwViewData['list'] =  $setdata2;
endif;



$sortbylacalculator = $fwRequest->getParam('sortbylacalculator', '');
if ($sortbylacalculator):

	foreach ($setdata2 as $key => $row) {

		//$desig[$key]  = $row['dpn_last_audit_cs_updated_at'];
		$date = DateTime::createFromFormat('d-m-Y', $row['dpn_last_audit_cs_updated_at']);
        $desig[$key] = $date ? $date->getTimestamp() : 0;
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

if (!empty($reno_only) || isset($_SESSION['reno_only'])) {
	foreach ($setdata2 as $m2 => $s2) {
		if ($s2['dpn_dr_renoonly'] == 0) {
			unset($setdata2[$m2]);
		}
	}
}


$fwViewData['list'] =  $setdata2;

//Contact Name
$sql_cname = "SELECT * FROM design_team";
$fwViewData['data_cname'] = $data_cname = $fwDb->query($sql_cname);


//	$report = new Fw_Db_Table('report_design');
//	$report->setWhere("1=1");
//	$report->deleteRows();
//	
//	foreach($setdata2 as $rk => $rv)
//	{
//		if(!empty($rv['bsn_id'])) {
//			$detailrp['re_bsn_id'] = $rv['bsn_id'];
//			$this_id = $report->insertRow($detailrp);
//			}
//	}



// Export to Excel

$export = $fwRequest->getParam('export', 0);
if ($export > 0) {

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

	$objPHPExcel = new PHPExcel();

	// Set document properties
	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Test Document")
		->setSubject("Office 2007 XLSX Test Document")
		->setDescription("Design report exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Design Report file");


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
	$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);
	
	$objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('R')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('S')->setAutoSize(true);


	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Relevant Checklist Numbers')
		->setCellValue('B1', 'Project Address')
		->setCellValue('C1', 'Customer Name')
		->setCellValue('D1', 'Designer')
		->setCellValue('E1', '% Completed')
		->setCellValue('F1', 'Estimate Build Cost')
		->setCellValue('G1', 'Estimate Build Cost Date')
		->setCellValue('H1', 'Build Est Rev No.')
		->setCellValue('I1', 'Likely site scope value')
		->setCellValue('J1', 'Likely site scope value Date')
		->setCellValue('K1', 'Site Est Rev No.')
		->setCellValue('L1', 'Estimated Renovation Cost')
		->setCellValue('M1', 'Reno Est Rev No.')
		->setCellValue('N1', 'Unit Title Costs')
		->setCellValue('O1', 'Unit Title Rev No.')
		->setCellValue('P1', 'Last Audit - Designer')
		->setCellValue('Q1', 'Last Audit Designer Date')
		->setCellValue('R1', 'Last Audit - Calculator')
		->setCellValue('S1', 'Last Audit Calculator Date')
	
		
		
	;

	$from = "A1"; // or any value
	$to = "AP1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);


	$row = 2;
	$sr = 1;
	foreach ($setdata2 as $k => $v) {
		
		$sql_ecname = "SELECT de_id, de_name FROM design_team where de_id =".$v['dpn_last_audit_by'];
		$data_ecname = $fwDb->queryOne($sql_ecname);
		$auditBy = $data_ecname['de_name'];
		
		$sql_cscname = "SELECT de_id, de_name FROM design_team where de_id =".$v['dpn_last_audit_cs_by'];
		$data_cscname = $fwDb->queryOne($sql_cscname);
		$auditByCs = $data_cscname['de_name'];


		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $v['chknoData'])
			->setCellValue('B' . $row, $v['bsn_address'])
			->setCellValue('C' . $row, $v['bcust_fname'] . ' ' . $v['bcust_lname'])
			->setCellValue('D' . $row, $v['dpn_customer_designer'])
			->setCellValue('E' . $row, $v['dpn_dr_per_complete'])
			->setCellValue('F' . $row, $v['dpn_dr_estimate_cost'])
			->setCellValue('G' . $row, $v['dpn_dr_ec_date'])
			->setCellValue('H' . $row, $v['dpn_dr_ec_cmt'])
			->setCellValue('I' . $row, $v['dpn_dr_likely_value'])
			->setCellValue('J' . $row, $v['dpn_dr_likely_date'])
			->setCellValue('K' . $row, $v['dpn_dr_likely_cmt'])
			->setCellValue('L' . $row, $v['dpn_dr_erc'])
			->setCellValue('M' . $row, $v['dpn_dr_erc_cmt'])
			->setCellValue('N' . $row, $v['dpn_dr_r_plus_e'])
			->setCellValue('O' . $row, $v['dpn_dr_ut_cmt'])
			->setCellValue('P' . $row, $auditBy)
			->setCellValue('Q' . $row, $v['dpn_last_audit_update_at'])
			->setCellValue('R' . $row, $auditByCs)
			->setCellValue('S' . $row, $v['dpn_last_audit_cs_updated_at'])
			
			
			
		;
		$row = $row + 1;
		$sr = $sr + 1;
	}

	// Rename worksheet
	$objPHPExcel->getActiveSheet()->setTitle('Design Estimates Report');

	// Set active sheet index to the first sheet, so Excel opens this as the first sheet
	$objPHPExcel->setActiveSheetIndex(0);

	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="design_estimates_report.xls"');
	header('Cache-Control: max-age=0');
	// If you're serving to IE 9, then the following may be needed
	header('Cache-Control: max-age=1');

	// If you're serving to IE over SSL, then the following may be needed
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
	header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header('Pragma: public'); // HTTP/1.0

	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;
}


// Print Weekly Letter	
$bsn_id = $fwRequest->getParam('print', 0);

if ($bsn_id > 0) {
	$sqlPrint = 'SELECT  business_sellers.bs_business_id,  bus_customers.bcust_fname,  
             bus_customers.bcust_lname, business.bsn_id, business.bsn_name, 
	     business.bsn_address, business.bsn_advert_text,
	     business.bsn_type,  business.bsn_initial_meeting_date, business.bsn_letter_text,
	     business.bsn_design_type, business.bsn_project_type , document_check_list.doc_date_uploaded
		
	     from business_sellers 		
	     Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	     Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	     Inner Join document_check_list ON business_sellers.bs_business_id = document_check_list.doc_bsn_id And  
	    document_check_list.doc_name_id = 45 where business.bsn_id = ' . $bsn_id . ' and document_check_list.doc_date_uploaded != "0000-00-00 00:00:00" ';

	$printData = $fwDb->queryOne($sqlPrint);

	$Statusdate = changedate_y_m_d($printData['doc_date_uploaded']);

	if (!empty($Statusdate)) {
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
	}

	$printData['dayscount'] = $dayscount;


	$sqlde = "Select person_responsible_detail.* from person_responsible_detail
			  where person_responsible_detail.prd_bsn_id = " . $bsn_id .
		" And person_responsible_detail.prd_position = 'Designer' ";
	$desig = $fwDb->queryOne($sqlde);

	$re_1 = $printData['bsn_design_type'];
	if ($re_1 == 'FPE') {
		$re = "Fixed Price Extension";
	} else if ($re_1 == 'SR') {
		$re = "Secondary Residence";
	} else if ($re_1 == 'Other') {
		$re = "Other";
	}

	$ds_1 = $printData['bsn_project_type'];
	if ($ds_1 == 'CD') {
		$ds = "Custom Design";
	} else if ($ds_1 == 'MD') {
		$ds = "Modification Design";
	} else if ($ds_1 == 'Other') {
		$ds = "Other";
	}


	$heading = "Weekly Letter";
	$fname = '';

	$dt = date("l, d F Y");

	$html = "<html><body> ";

	$html .= $dt;
	$html .= "<br><br><br>";
	$html .= $printData['bcust_fname'] . ' ' . $printData['bcust_lname'];
	$html .= "<br><br>";
	$html .= "Re " . $re . " Design " . $printData['bsn_address'] . "<br><br>";
	$html .= "This is a courtesy progress letter to keep you up to date with the progress of your design.";
	$html .= "<ul type='disk' style='line-height:40px;'>";
	$html .=  "<li>Date of initial design meeting : " . $printData['bsn_initial_meeting_date'] . "</li><br>";
	$html .=  "<li>Day count of the design process : " . $printData['dayscount'] . "</li><br>";
	$html .=  "<li>Design Status :</li><br>";
	$html .=  "<li>Appointed Customer Designer : " . $desig['prd_name'] . "</li><br>";
	$html .=  "<li>Design Type : " . $ds . "</li><br>";
	$html .=  "<li>Latest Merged Plans: Rev 2.1 is attached to the email accompanying this letter. Please note that at
the time this was sent we may have been working on revised plans, that were not complete hence
they could not be attached.</li>";

	$html .= "</ul>";

	$html .= "If you have any concerns or questions about the design process please contact myself, or your appointed
customer designer as shown above.";
	$html .= "<br><br><br>";
	$html .= "Kind Regards";
	$html .= "<br><br>";

	$html .= "Frank Walmsley<br>";
	$html .= "Client Service Manager<br>";
	$html .= "Canberra Granny Flat Builders<br>";
	$html .= "Email: ClientServices@cgfb.com.au<br>";
	$html .= "Phone: 0400 446 605 or 1300 979 658<br>";
	$html .= "</body></html>";

	create_weekly_letter($heading, $html, $fname);
}