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

$searchtype = $fwRequest->getParam('searchtype', '');
if (!empty($searchtype) || isset($_SESSION['type'])) {
	$type = $fwRequest->getParam('type', '');
	if (empty($type)) {
		$type = $_SESSION['type'];
	}

	$where .= " and dpn_dr_type_new =  " . $type;

	if (!empty($type)) {
		$_SESSION['type'] = $type;
	}
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


$searchdesigner = $fwRequest->getParam('searchdesigner', '');
if (!empty($searchdesigner)) {
	$design = $fwRequest->getParam('design', '');

	if (!empty($design)) {
		$_SESSION['design'] = $design;
	}
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



$sql = "Select SQL_CALC_FOUND_ROWS null as row_name,  dpn_bsn_id, dpn_unique_id, dpn_budget, dpn_dr_type, dpn_dr_what, dpn_dr_survey_imple,
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
	  dpn_dr_gen_hour_date, dpn_dr_gen_hour_user, dpn_customer_designer, dpn_dr_next_date, dpn_dr_next_time, dpn_dr_next_location,
	  dpn_dr_ec_cmt, dpn_dr_ec_date, dpn_dr_likely_cmt, dpn_dr_likely_date, dpn_dr_erc_cmt, dpn_dr_erc_date, dpn_customer_objectives, dpn_customer_objectives_date, dpn_customer_objectives_user
	  
	  from document_proposal_name " . $where;

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


			$sql_bus = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
           bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business,
	   bus_customers.bcust_misc_home,  business.bsn_id, business.bsn_name,  business.bsn_address,
	   business.bsn_address_same, business.bsn_showin_cpr
	   from business_sellers 		
	   Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	   Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	   where business.bsn_id = " . $v['dpn_bsn_id'];

			$busData = $fwDb->queryOne($sql_bus);

			$link = "http://www.deckquotes.com.au/business.detail/bsn_id/" . $v['dpn_bsn_id'];


			$sql45 = "Select doc_date_uploaded from document_check_list
	           where doc_name_id = 45 and doc_bsn_id = " . $v['dpn_bsn_id'];

			$data45 = $fwDb->queryOne($sql45);

			$dayscount = '';

			$Statusdate = changedate_y_m_d($data45['doc_date_uploaded']);

			if (!empty($Statusdate)) {
				$curdate_y_m_d = date('Y-m-d');
				$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
			}



			$sqlcp = "SELECT doc_date_uploaded, doc_file_name FROM document_check_list_mini 
		          WHERE doc_bsn_id = " . $v['dpn_bsn_id'] . " AND doc_name_id = 53 and doc_checklist_number = " . $v['dpn_proposal_number'];
			$cpData = $fwDb->queryOne($sqlcp);



			$sql54 = "SELECT doc_date_uploaded, doc_bsn_id, doc_checklist_number FROM document_check_list_mini 
		          WHERE doc_bsn_id = " . $v['dpn_bsn_id'] . " AND doc_name_id = 54 and doc_checklist_number = " . $v['dpn_proposal_number'];

			$data54 = $fwDb->queryOne($sql54);

			$dt = changedate_y_m_d($data54['doc_date_uploaded']);

			$days = '';
			if (!empty($dt)) {
				$curdate_y_m_d = date('Y-m-d');
				$days = daysDifference($curdate_y_m_d, $dt);
			}

			// Uid 54 ends

			// Phone follow ups

			$sqlalert = "Select count(*) as tot from  business_alert
		             where be_business_id = " . $v['dpn_bsn_id'] . " AND business_alert.be_alert_active = 'Yes' ";
			$alertData = $fwDb->queryOne($sqlalert);


			// Person Responsible

			$sqlpr = "Select person_responsible_detail.* from person_responsible_detail
			  where person_responsible_detail.prd_bsn_id = " . $v['dpn_bsn_id'] .
				" And person_responsible_detail.prd_position = 'Designer' ";
			$dataDesig = $fwDb->queryOne($sqlpr);


			$sqlpoa = "Select person_responsible_detail.* from person_responsible_detail
			    where person_responsible_detail.prd_bsn_id = " . $v['dpn_bsn_id'] .
				" And person_responsible_detail.prd_position like '%Overseas Architect%' ";
			$dataOsa = $fwDb->queryOne($sqlpoa);

			// End Person Responsible.		

			// Proposal Checklist

			$sqlpc = "Select document_check_list_mini_count.dcnt_counter from document_check_list_mini_count
		          where document_check_list_mini_count.dcnt_bsn_id = " . $v['dpn_bsn_id'];
			$datapc = $fwDb->queryOne($sqlpc);

			// End Proposal Checklist


			// Latest Merged Plans

			//		$sqlmp = "SELECT document_check_list_mini.doc_file_name, doc_date_uploaded, document_proposal_name.dpn_unique_id
			//			FROM document_proposal_name
			//			inner join document_check_list_mini ON ( document_proposal_name.dpn_bsn_id = document_check_list_mini.doc_bsn_id
			//			AND document_proposal_name.dpn_proposal_number = document_check_list_mini.doc_checklist_number )
			//			WHERE doc_name_id =20
			//			AND document_proposal_name.dpn_bsn_id = " .  $v['dpn_bsn_id'];

			$sqlmp = "SELECT document_check_list_mini.doc_file_name, doc_date_uploaded, document_proposal_name.dpn_unique_id
			FROM document_proposal_name
			inner join document_check_list_mini ON ( document_proposal_name.dpn_bsn_id = document_check_list_mini.doc_bsn_id
			AND document_proposal_name.dpn_proposal_number = document_check_list_mini.doc_checklist_number )
			WHERE doc_name_id =20
			AND document_proposal_name.dpn_bsn_id = " .  $v['dpn_bsn_id'] . " and doc_checklist_number = " . $v['dpn_proposal_number'];

			$mpData = $fwDb->queryOne($sqlmp);


			// End Latest Merged Plans


			// Project Type

			$sqlprotype = "Select pt_name from project_type where  pt_id  = " . $v['bsn_type'];
			$ptData = $fwDb->queryOne($sqlprotype);

			// End  Project Type

			// Survey Uploaded

			$sqlsu = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = " . $v['dpn_bsn_id']
				. " And doc_name_id = 72 ";
			$suData = $fwDb->queryOne($sqlsu);

			$sql303 = "Select business_tasks.bt_completed_date from business_tasks
			     where business_tasks.bt_bsn_id = " . $v['dpn_bsn_id'] . " And business_tasks.bt_task_id = 303";

			$data303 = $fwDb->queryOne($sql303);

			// End Survey Uploaded

			// Client design signup form 33

			$sql_lcl = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $v['dpn_bsn_id'] . " And document_check_list.doc_name_id = 458 ";
			$data_lcl = $fwDb->queryOne($sql_lcl);

			// Uid 33 ends

			// CWG  179

			$sql_cwg = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			    where document_check_list.doc_bsn_id = " . $v['dpn_bsn_id'] . " And document_check_list.doc_name_id = 180 ";
			$data_cwg = $fwDb->queryOne($sql_cwg);

			// CWG  179 End


			//Renovation Checklist Nuber

			$sql_rcn = "Select document_renovation_name.dpn_unique_id from document_renovation_name
			    where document_renovation_name.dpn_bsn_id = " . $v['dpn_bsn_id'];
			$data_rcn = $fwDb->queryOne($sql_rcn);

			// Renovation Checklist Number End


			$setdata2[$k]['chknoData'] = $v['dpn_unique_id'];
			$setdata2[$k]['bsn_id'] = $v['dpn_bsn_id'];
			$setdata2[$k]['bs_customers_id'] = $busData['bs_customers_id'];
			$setdata2[$k]['bsn_address'] = $busData['bsn_address'];
			$setdata2[$k]['bcust_fname'] = $busData['bcust_fname'];
			$setdata2[$k]['bcust_lname'] = $busData['bcust_lname'];
			$setdata2[$k]['bcust_misc_email1'] = $busData['bcust_misc_email1'];
			$setdata2[$k]['bcust_misc_email2'] = $busData['bcust_misc_email2'];
			$setdata2[$k]['bcust_misc_moble'] = $busData['bcust_misc_moble'];
			$setdata2[$k]['bcust_misc_business'] = $busData['bcust_misc_business'];
			$setdata2[$k]['bcust_misc_home'] = $busData['bcust_misc_home'];
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['reno_checklist_no'] = $data_rcn['dpn_unique_id'];
			$setdata2[$k]['checklist53'] =  changedate_d_m_y($cpData['doc_date_uploaded']);
			$setdata2[$k]['checklist53_file'] = $cpData['doc_file_name'];
			$setdata2[$k]['checklist54'] =  changedate_d_m_y($data54['doc_date_uploaded']);
			$setdata2[$k]['designer'] = $dataDesig['prd_name'];
			$setdata2[$k]['osarchi'] = $dataOsa['prd_name'];
			$setdata2[$k]['prochklist'] = $datapc['dcnt_counter'];
			//$setdata2[$k]['lmpData'] = $mpData;
			$setdata2[$k]['lmp_date'] = changedate_d_m_y($mpData['doc_date_uploaded']);
			$setdata2[$k]['lmp_doc_file_name'] = $mpData['doc_file_name'];
			$setdata2[$k]['chknoData_new'] = $chknoData_new['dpn_unique_id'];
			$setdata2[$k]['bsn_address_same'] = $busData['bsn_address_same'];
			$setdata2[$k]['survey_uploaded'] = $suData['doc_file_name'];
			$setdata2[$k]['tasklist303'] =  changedate_d_m_y($data303['bt_completed_date']);
			$setdata2[$k]['checklist458'] = $data_lcl['doc_file_name'];
			$setdata2[$k]['checklist179_file'] = $data_cwg['doc_file_name'];
			$setdata2[$k]['checklist179_date'] = changedate_d_m_y($data_cwg['bt_completed_date']);
			$setdata2[$k]['bsn_showin_cpr'] = $busData['bsn_showin_cpr'];
			$setdata2[$k]['dayscount'] = $dayscount;
			$setdata2[$k]['checklist45'] =  changedate_d_m_y($data45['doc_date_uploaded']);
			$setdata2[$k]['days'] = $days;

			$v['dpn_dr_general_hours'] = (!empty($v['dpn_dr_general_hours'])) ? $v['dpn_dr_general_hours'] : 0;
			$v['dpn_dr_cust_des_hour'] = (!empty($v['dpn_dr_cust_des_hour'])) ? $v['dpn_dr_cust_des_hour'] : 0;
			$v['dpn_dr_overhour'] = (!empty($v['dpn_dr_overhour'])) ? $v['dpn_dr_overhour'] : 0;

			$setdata2[$k]['total_hours'] = $v['dpn_dr_general_hours'] + $v['dpn_dr_cust_des_hour'] + $v['dpn_dr_overhour'];

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

if (!empty($reno_only) || isset($_SESSION['reno_only'])) {
	foreach ($setdata2 as $m2 => $s2) {
		if ($s2['dpn_dr_renoonly'] == 0) {
			unset($setdata2[$m2]);
		}
	}
}


$fwViewData['list'] =  $setdata2;


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
	$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('R')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('S')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('T')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('U')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('V')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('W')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('X')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('Y')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('Z')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('AA')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('AB')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('AC')->setAutoSize(true);

	$objPHPExcel->getActiveSheet()->getColumnDimension('AD')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('AE')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('AF')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('AG')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('AH')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('AI')->setAutoSize(true);


	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Address')
		->setCellValue('B1', 'Customer Name')
		->setCellValue('C1', 'Design Agreement $$')
		->setCellValue('D1', 'Survey')
		->setCellValue('E1', 'Aerial Inspection Completed')
		->setCellValue('F1', 'RR')
		->setCellValue('G1', 'Relevant Checklist Number')
		->setCellValue('H1', 'Type')
		->setCellValue('I1', 'What')
		->setCellValue('J1', 'Design Agreement Signed')
		->setCellValue('K1', 'First Meeting Date')

		->setCellValue('L1', 'Days Count')
		->setCellValue('M1', 'Designer')
		->setCellValue('N1', 'Overseas Architect')
		->setCellValue('O1', 'Commencement Plans')
		->setCellValue('P1', 'Percentage Completed')
		->setCellValue('Q1', 'What we are at')
		->setCellValue('R1', 'Letter Text')
		->setCellValue('S1', 'Last Meeting')
		->setCellValue('T1', 'Number Of Days')
		->setCellValue('U1', 'Alerts')
		->setCellValue('V1', 'Target Design Sign Off')

		->setCellValue('W1', 'Customer Designer Hours')
		->setCellValue('X1', 'Overseas Architect Hours')
		->setCellValue('Y1', 'Total Hours')
		->setCellValue('Z1', 'Sign off sent date')
		->setCellValue('AA1', 'Customer Budget')
		->setCellValue('AB1', 'SQM')
		->setCellValue('AC1', 'Estimate Cost')
		->setCellValue('AD1', 'Rev-Estimate Build Cost')
		->setCellValue('AE1', 'Estimated Renovation Cost')
		->setCellValue('AF1', 'Rev-Estimated Renovation Cost')
		->setCellValue('AG1', 'Likely site scope value')
		->setCellValue('AH1', 'Rev-Likely site scope value')
		->setCellValue('AI1', 'Building File')
	;

	$from = "A1"; // or any value
	$to = "AL1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);


	$row = 2;
	$sr = 1;
	foreach ($setdata2 as $k => $v) {


		$days = '';

		if ($v['checklist54']) {
			$Statusdate2 = changedate_y_m_d($v['checklist54']);

			if (!empty($Statusdate2)) {
				$curdate_y_m_d = date('Y-m-d');
				$days = daysDifference($curdate_y_m_d, $Statusdate2);
			}
		}

		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $v['bsn_address'])
			->setCellValue('B' . $row, $v['bcust_fname'] . ' ' . $v['bcust_lname'])
			->setCellValue('C' . $row, $v['dpn_dr_deagree'])
			->setCellValue('D' . $row, $v['dpn_dr_survey'])
			->setCellValue('E' . $row, $v['tasklist303'])
			->setCellValue('F' . $row, $v['dpn_dr_rr'])
			->setCellValue('G' . $row, $v['chknoData'])
			->setCellValue('H' . $row, $v['dpn_dr_type'])
			->setCellValue('I' . $row, $v['dpn_dr_what'])
			->setCellValue('J' . $row, $v['checklist45'])
			->setCellValue('K' . $row, $v['dpn_dr_first_meeting_date'])

			->setCellValue('L' . $row, $v['dayscount'])
			->setCellValue('M' . $row, $v['designer'])
			->setCellValue('N' . $row, $v['osarchi'])
			->setCellValue('O' . $row, $v['checklist53'])
			->setCellValue('P' . $row, $v['dpn_dr_per_complete'])
			->setCellValue('Q' . $row, $v['dpn_dr_wherewe'])
			->setCellValue('R' . $row, $v['dpn_dr_letter_text'])
			->setCellValue('S' . $row, $v['checklist54'])
			->setCellValue('T' . $row, $days)
			->setCellValue('U' . $row, $v['dpn_dr_alerts'])
			->setCellValue('V' . $row, $v['dpn_dr_tdso_dt'])

			->setCellValue('W' . $row, $v['dpn_dr_cust_des_hour'])
			->setCellValue('X' . $row, $v['dpn_dr_overhour'])
			->setCellValue('Y' . $row, $v['total_hours'])
			->setCellValue('Z' . $row, $v['dpn_dr_sign_off_sent_date'])
			->setCellValue('AA' . $row, $v['dpn_dr_cust_budget'])
			->setCellValue('AB' . $row, $v['dpn_dr_sqm'])
			->setCellValue('AC' . $row, $v['dpn_dr_estimate_cost'])
			->setCellValue('AD' . $row, $v['dpn_dr_ec_cmt'])
			->setCellValue('AE' . $row, $v['dpn_dr_erc'])
			->setCellValue('AF' . $row, $v['dpn_dr_erc_cmt'])
			->setCellValue('AG' . $row, $v['dpn_dr_likely_value'])
			->setCellValue('AH' . $row, $v['dpn_dr_likely_cmt'])
			->setCellValue('AI' . $row, $v['dpn_dr_building_file'])

		;
		$row = $row + 1;
		$sr = $sr + 1;
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


$sql_designer = "SELECT DISTINCT prd_name FROM person_responsible_detail
       WHERE `prd_position` = 'designer' ";
$fwViewData['des_data'] = $fwDb->query($sql_designer);

$print_merge = $fwRequest->getParam('print_merge', 0);
if (!empty($print_merge)) {



	foreach ($setdata2 as $mk => $mv) {

		$dt = date("l, d F Y");

		$re_1 = $mv['dpn_dr_what'];
		if ($re_1 == 'FPE') {
			$re = "Fixed Price Extension";
		} else if ($re_1 == 'SR') {
			$re = "Secondary Residence";
		} else if ($re_1 == 'Other') {
			$re = "Other";
		}

		$sql_l = "Select * from letter_text_design_report where lt_id = " . $mv['dpn_dr_letter_text'];
		$letterdata = $fwDb->queryOne($sql_l);


		$html = '<html><body style="font-family:calibi; font-size:36px">';
		//$html .= '<img src='.BASE_URL.'images/header2.jpg>';
		$html .= "<p>" . $dt . "</p>";
		//$html .= "<br>";
		$html .= "<p>" . $mv['bcust_fname'] . ' ' . $mv['bcust_lname'] . "</p>";;
		//$html .= '<br>';
		$html .= "<p>Re: Your " . $re . " Design " . $mv['chknoData'] . " - " . $mv['bsn_address'] . "</p>";
		$html .= '<p>This is a courtesy progress letter to keep you up to date with the progress of your design.</p>';
		$html .= '<ul style="list-style: disc;line-height:6px;">';
		$html .=  '<li>Date of initial design meeting :' . $mv["dpn_dr_first_meeting_date"] . '</li>';
		$html .=  "<li>Day count of the design process : " . $mv['dayscount'] . "</li>";
		$html .=  "<li>Total hours invested so for : " . $mv['total_hours'] . "</li>";
		$html .=  "<li>Design Status :" . $letterdata['lt_text'] . "</li>";
		$html .=  "<li>Appointed Customer Designer : " . $mv['designer'] . "</li>";
		$html .=  "<li>Design Type : " . $re . "</li>";
		$html .=  "<li>Draft Merged Plans: Rev 4.1 is attached to the email accompanying this letter. If you have 
recently meet with your Customer Designer, the attached plan may not reflect the latest changes discussed at your meeting.</p>";
		$html .= "</ul>";

		$html .= "<p>Based upon your latest draft floorplans design, we have anticipated the following amounts:</p>";

		$html .= '<ol style="line-height:6px;">';
		$html .= "<li><u>Estimated</u> investment amount for <strong> project build</strong>, including planning and and approvals :" . $mv['dpn_dr_estimate_cost'] . "</li>";
		$html .= "<li><u>Estimated</u> investment amount for <strong> site scope works</strong>, including site preparation :" . $mv['dpn_dr_likely_value'] . "</li>";
		$html .= "<li><u>Estimated</u> investment amount for <strong> renovations</strong>, (if applicable) :" . $mv['dpn_dr_erc'] . "</li>";

		$html .= "</ul>";
		$html .= "If you have any concerns or questions about the design process please contact myself, or " . $mv['designer'] . " your appointed
customer designer.";
		$html .= "<br><br><br>";
		$html .= "Kind Regards";
		//$html .= "<br>";

		$html .= "<p>Frank Walmsley<br>";
		$html .= "Client Service Manager<br>";
		$html .= "Canberra Granny Flat Builders<br>";
		$html .= "Email: ClientServices@cgfb.com.au<br>";
		$html .= "Phone: 0400 446 605 or 1300 979 658</p>";
		$html .= '<br pagebreak="true" />';
		$html .= "<p><strong>Content of the design updated letter explained </strong></p>";
		$html .= "<p>It's our objective to provide a world class experience from the beginning of the design process through to the end of construction.</p>";
		$html .= "<p>To that end our business is committed to create Design Plans that can be legally and practically built whilst delivering your objectives in terms of both quality and value.</p>";
		$html .= "<p>Unlike other building and design businesses we are doing our absolute best to provide accurate pricing estimates throughout the design process.</p>";
		$html .= "<p>It is not a perfect process, but we assign resources and meet on a regular basis to try and determine the value of individual projects based on our experience of building hundreds of extensions and secondary residences.</p>";
		$html .= "<p>Our commitment stands to build a world class project at Fixed Price Agreement. We have never, nor will we pass on general cost increases over the life of a project. That is why providing accurate pricing throughout the design phase is so important.</p>";
		$html .= "<p><strong>What happens if we have two or more designs in progress? </strong></p>";
		$html .= "<p>Most customers have multiple design concepts running at any one time. Each design is identified by a unique number called a checklist number. This is a 3-to-4-digit number.</p>";
		$html .= "<p>If you have more than one design concept that we are working on or you are working on a major renovation as well as an extension or a secondary dwelling, then we may need to send you two weekly emails with each unique design. </p>";
		$html .= "<p>At the top of the letter there is a design checklist number which referred to and it aligns with the attached plans that we send. Below are the two examples of this unique numbering system.</p>";
		$html .= '<img src="' . BASE_DIR . '/images/cdl.png" width="500">';
		$html .= '<br pagebreak="true" />';
		$html .= "<p><strong>Questions and Answers asked by previous customers</strong></p>";
		$html .= "<p><strong>Q:</strong> What is included in the project build?</p>";
		$html .= "<p><strong>A:</strong> This relates to the extension or secondary residence and any attached garaging, decks or pergolas etc. It also includes planning & approvals Government fees and charges.</p>";
		$html .= "<p><strong>Q:</strong> What is included in the site scope works including site preparation:</p>";
		$html .= "<p><strong>A:</strong> This relates to the demolition and removal of structures requested by the client. Anticipated movement of power, water, and utilities. Excavation related to the site. The building of detached structures like garages that are not attached to the extension or secondary residence. </p>";
		$html .= "<p><strong>Q:</strong> What does it mean when it has TBC or DNA</p>";
		$html .= "<p><strong>A:</strong> TBC relates To Be Confirmed this means that we are investigating the value of the component and allocating construction staff to review. DNA means that now this value does not apply to your project (noting if the scope of the project expands or decreases then so may the price).</p>";
		$html .= "<p><strong>Q:</strong> When will we know what type of planning approvals will be required for our project? </p>";
		$html .= "<p><strong>A:</strong> This happens after you sign-off on the project. At this point we engage our internal planning approvals staff and compliance staff to check the plans and proposed works. </p>";


		$html .= "</body></html>";

		//db($html);	

		merge_print_report("Customer Design Update Letter ", $html, $mv['bsn_address']);
		exit;
	}
}


// Design management Report Starts
$dmr = $fwRequest->getParam('dmr', 0);



if (!empty($dmr)) {

	$HTML = '';
	$html .= '<table border="1" cellpadding="5">';
	$html .= '<tr><th>Address</th>
	              <th>Checklist No</th>
		      <th>Checklist</th>
		      <th>Type</th>
		      <th>Day</th>
		      <th>Designer</th>
		      <th>%</th>
	              <th>Total Hours</th>
		      <th>Latest Plans Date</th>  
		      <th>Traffic Light</th>
		  </tr>';

	foreach ($setdata2 as $mk => $mv) {

		$sql_l = "Select dr_type from design_report_type where dr_id = " . $mv['dpn_dr_type_new'];
		$typedata = $fwDb->queryOne($sql_l);

		$html .= "<tr>";
		$html .= "<td>" . $mv['bcust_fname'] . " " . $mv['bcust_lname'] . "<br>" . $mv['bsn_address'] . "  </td>";
		$html .= "<td>" . $mv['chknoData'] . "</td>";
		$html .= "<td>" . $mv['prochklist'] . "</td>";
		$html .= "<td>" . $typedata['dr_type'] . "</td>";
		$html .= "<td>" . $mv['dayscount'] . "</td>";
		$html .= "<td>" . $mv['designer'] . "</td>";
		$html .= "<td>" . $mv['dpn_dr_per_complete'] . "</td>";
		$html .= "<td>" . $mv['total_hours'] . "</td>";
		$html .= "<td>" . $mv['lmp_date'] . "</td>";

		if ($mv['dpn_dr_traffic_light'] == 1) {
			$html .= '<td style="background-color:#00CC33;">' . $mv["dpn_dr_tl_user"] . '<br>' . $mv["dpn_dr_tl_date"] . '</td>';
		} elseif ($mv['dpn_dr_traffic_light'] == 2) {
			$html .= '<td style="background-color:#ff7f27;">' . $mv["dpn_dr_tl_user"] . '<br>' . $mv["dpn_dr_tl_date"] . '</td>';
		} elseif ($mv['dpn_dr_traffic_light'] == 3) {
			$html .= '<td style="background-color:#F00;">' . $mv["dpn_dr_tl_user"] . '<br>' . $mv["dpn_dr_tl_date"] . '</td>';
		} else {
			$html .= "<td></td>";
		}


		$html .= '</tr>';
	}

	$html .= '</table>';
	//db($html);


	dm_report("Design Managemtn Report ", $html);
}

// Design management report ends
