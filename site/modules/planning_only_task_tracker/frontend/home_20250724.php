<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$keyword = $fwRequest->getParam('keyword', '');
$tablebusiness = new Fw_Db_Table('business');
$table = new Fw_Db_Table('business_sellers');
$tableMa = new Fw_Db_Table('ptt_meeting_agenda');
$tablePhdr = new Fw_Db_Table('post_hia_design_report');

$fwViewData['ran'] =  rand(100000, 999999);

$tableBus_task = new Fw_Db_Table('business_tasks');

$ptt_ma = $fwRequest->getParam('ptt_ma', '');
if (!empty($ptt_ma)) {
	$meeting_agenda = $fwRequest->getParam('meeting_agenda', '');
	$usr = $_SESSION['user']['user_name'];
	$dt = date('d-m-Y');

	$detail['ma_ma_doc'] = $meeting_agenda;
	$detail['ma_user'] = $usr;
	$detail['ma_date'] = $dt;
	$tableMa->setWhere("ma_id = 1");
	$this_id = $tableMa->updateRow($detail);
}

$sqlma = "select * from ptt_meeting_agenda where ma_id = 1";
$datama = $fwDb->queryOne($sqlma);

$fwViewData['ma_ma_doc'] = $datama['ma_ma_doc'];
$fwViewData['ma_user'] = $datama['ma_user'];
$fwViewData['ma_date'] = $datama['ma_date'];



$opi = $fwRequest->getParam('opi', '');
if ($opi) {
	$keys_2 = array_keys($opi);
	$ky_2 = $keys_2[0];
	$val_2 = $opi[$ky_2];

	$detail['bsn_ptt_opi'] = $val_2;
	$detail['bsn_ptt_opi_date'] = date('d-m-Y');
	$detail['bsn_ptt_opi_user'] = $_SESSION['user']['user_name'];
	$tablebusiness->setWhere("bsn_id = " . $ky_2);
	if ($tablebusiness->rowExists()) {
		$this_id = $tablebusiness->updateRow($detail);
	}
}

$add_to_phr = $fwRequest->getParam('add_to_phr', '');
if ($add_to_phr) {
	$keys_3 = array_keys($add_to_phr);
	$ky_3 = $keys_3[0];
	$val_3 = $add_to_phr[$ky_3];
	$sqlat = "Select bsn_name from business where bsn_id = " . $ky_3;
	$bsData = $fwDb->queryOne($sqlat);

	$detailAdd['ph_bsn_name'] = $bsData['bsn_name'];
	$this_id = $tablePhdr->insertRow($detailAdd);

	$detail['bs_ptt_addto_phr'] = $val_3;
	$table->setWhere("bs_business_id = " . $ky_3);
	if ($tablebusiness->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$filter_alert_projects = $fwRequest->getParam('filter_alert_projects', '');
$show_only_alert_records = false;
if ($filter_alert_projects) {
	$show_only_alert_records = true;
	$_SESSION['$show_only_alert_records'] = $show_only_alert_records;
} elseif ($_SESSION['$show_only_alert_records']) {
	$show_only_alert_records = $_SESSION['$show_only_alert_records'];
}

// Add Task Starts
$add_task = $fwRequest->getParam('add_task', '');
if (!empty($add_task)) {

	$sqlta =  "SELECT  business_sellers.bs_business_id, business.bsn_id
			  from business_sellers 		
			  Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			  Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
			  Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
			  person_responsible_detail.prd_prm_id = 8 where business.bsn_status like '%|18|%' 
			  Group By business.bsn_id 
			  Order By business_sellers.bs_ptt_sub_status_order ASC";

	$bsndata = $fwDb->query($sqlta);


	$sql_gettasks = "SELECT  st.st_id, st.st_name, bst.bst_id, bst.bst_business_types, bst.bst_task_name 
					FROM busness_status as st
					LEFT JOIN busness_status_task as bst
					ON st.st_id = bst.bst_business_status_id
					WHERE st.st_id = 2";

	$tasksOfstatus = $fwDb->query($sql_gettasks);


	foreach ($bsndata as $k => $v) {
		foreach ($tasksOfstatus as $k2 => $v2) {
			$tableBus_task->setWhere("bt_bsn_id = " . $v['bsn_id'] . " and bt_task_status_id = 2 and bt_task_id = " . $v2['bst_id']);

			if (!$tableBus_task->rowExists()) {
				$detail['bt_bsn_id'] = $v['bsn_id'];
				$detail['bt_task_status_id'] = 2;
				$detail['bt_task_id'] = $v2['bst_id'];

				$tableBus_task->insertRow($detail);
			}
		}
	}
}

// Add Tasks Ends


$bs_ptt_sub_status = $fwRequest->getParam('bs_ptt_sub_status', '');
if (!empty($bs_ptt_sub_status)) {

	$keyla = array_keys($bs_ptt_sub_status);
	$kyla = $keyla[0];
	$stDetail['bs_ptt_sub_status'] = $bs_ptt_sub_status[$kyla];
	$stDetail['bs_ptt_sub_status_date'] = date('d-m-Y');
	$stDetail['bs_ptt_sub_status_user'] = $_SESSION['user']['user_name'];

	$sql_sub = "SELECT  * from ptt_sub_type where pst_id = " . $bs_ptt_sub_status[$kyla];
	$orddata = $fwDb->queryOne($sql_sub);
	$stDetail['bs_ptt_sub_status_order'] = $orddata['pst_order'];

	$table->setWhere('bs_business_id = ' . $kyla);
	$detail_st = $table->updateRow($stDetail);
}


$override = $fwRequest->getParam('override', '');

if (!empty($override)) {
	$bsn_id = $fwRequest->getParam('bsn_id', '');
	$detailOver['bsn_ptt_override'] = 1;
	$detailOver['bsn_ptt_override_user'] = $_SESSION['user']['user_name'];

	$tablebusiness->setWhere('bsn_id = ' . $bsn_id);
	$detail_over = $tablebusiness->updateRow($detailOver);
}

$savedata = $fwRequest->getParam('savedata', '');
if ($savedata) {

	if ($_FILES['pr_letter']) {

		$bsn_id = $fwRequest->getParam('bsn_id', '');
		$doc1 = $_FILES['pr_letter']['name'];
		$file_type = $_FILES['pr_letter']['type'];

		$datetime = trim(date('d_m_Y_H_i_'), '0');
		$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
		$src =  $_FILES['pr_letter']['tmp_name'];

		upload($doc1, $src);
		$letterData['bc_ptt_letter'] = $doc1;


		$table->setWhere('bs_business_id = ' . $bsn_id);
		if ($table->rowExists()) {

			$detail = $table->updateRow($letterData);
		}
	}
}


// Save Orginal CSBD
$orginal_csbd = $fwRequest->getParam('bsn_orginal_csbd', '');
if (!empty($orginal_csbd)) {
	$o_csbd = $fwRequest->getParam('bsn_orginal_csbd', '');

	$keyo = array_keys($o_csbd);
	$kyo = $keyo[0];
	$oDetail['bsn_orginal_csbd'] = $o_csbd[$kyo];
	$oDetail['bsn_original_csbd_date'] = date('d-m-Y');
	$oDetail['bsn_original_csbd_user'] = $_SESSION['user']['user_name'];


	$tablebusiness->setWhere('bsn_id = ' . $kyo);
	$detail_st = $tablebusiness->updateRow($oDetail);
}
//End Orginal CSBD

// Save Latest CSBD
$latest_csbd = $fwRequest->getParam('bsn_latest_csbd', '');
if (!empty($latest_csbd)) {
	$l_csbd = $fwRequest->getParam('bsn_latest_csbd', '');

	$keyl = array_keys($l_csbd);
	$kyl = $keyl[0];
	$lDetail['bsn_latest_csbd'] = $l_csbd[$kyl];
	$lDetail['bsn_latest_csbd_date'] = date('d-m-Y');
	$lDetail['bsn_latest_csbd_user'] = $_SESSION['user']['user_name'];

	$tablebusiness->setWhere('bsn_id = ' . $kyl);
	$detail_l = $tablebusiness->updateRow($lDetail);
}
//End Latest CSBD

// Save Last Spoken
$bs_ptt_last_spoken = $fwRequest->getParam('bs_ptt_last_spoken', '');
if (!empty($bs_ptt_last_spoken)) {
	$l_spoken = $fwRequest->getParam('bs_ptt_last_spoken', '');

	$keyl = array_keys($l_spoken);
	$kyl = $keyl[0];
	$lDetail['bs_ptt_last_spoken'] = $l_spoken[$kyl];
	$lDetail['bs_ptt_last_spoken_date'] = date('d-m-Y');
	$lDetail['bs_ptt_last_spoken_user'] = $_SESSION['user']['user_name'];

	$table->setWhere('bs_business_id = ' . $kyl);
	$detail_l = $table->updateRow($lDetail);
}
//End Last Spoken


$sqlH = "Select distinct bst_task_id, bst_ptt_summary from busness_status_task
	where bst_business_status_id = 2 order by bst_order";
$colhead = $fwDb->query($sqlH);
$tottask = count($colhead);
$fwViewData['colhead'] = $colhead;

$where = "WHERE 1=1 ";
$clear = $fwRequest->getParam('clear', '');
if ($clear) {
	unset($_SESSION['searchkey']);
	unset($_SESSION['type_search']);
	unset($_SESSION['$show_only_alert_records']);
	$show_only_alert_records = false;
}

if ($keyword):
	$where .= "AND business.bsn_sub_status LIKE '%" . $keyword . "%'";

	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];

elseif ($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%" . $_SESSION['keyword'] . "%'";

	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;

$searchkey = $fwRequest->getParam('searchkey', '');

if ($searchkey):

	$where .= " AND business.bsn_address LIKE '%" . $searchkey . "%'";

	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey'] = $_SESSION['searchkey'];

elseif ($_SESSION['searchkey']):

	$where .= " AND business.bsn_address LIKE '%" . $_SESSION['searchkey'] . "%'";

	$fwViewData['searchkey'] = $_SESSION['searchkey'];
endif;

$redlight = $fwRequest->getParam('redlight', '');
if (!empty($redlight)) {
	$where = "WHERE business_sellers.bs_traffic_light = 3 ";
}

$amberlight = $fwRequest->getParam('amberlight', '');
if (!empty($amberlight)) {
	$where = "WHERE business_sellers.bs_traffic_light = 2 ";
}


$greenlight = $fwRequest->getParam('greenlight', '');
if (!empty($greenlight)) {
	$where = "WHERE business_sellers.bs_traffic_light = 1 ";
}

$filter_ss = $fwRequest->getParam('filter_ss', '');
if (!empty($filter_ss)) {
	$ss = $fwRequest->getParam('bs_ptt_sub_status_filter', '');

	$where = " WHERE business_sellers.bs_ptt_sub_status = " . $ss;
	$fwViewData['ss'] = $ss;
}

if (empty($pagenum)) {
	unset($_SESSION['last_tdsql']);
}


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address, person_responsible_detail.prd_name, business.bsn_cp_incl_choices,
		business.bsn_per_complete, business.bsn_ptt_d_type, business.bsn_orginal_csbd, business.bsn_latest_csbd,
		business_sellers.bc_ptt_letter, business_sellers.bc_planning_task_report, business_sellers.bs_traffic_light,
		business_sellers.bs_tl_user, business_sellers.bs_tl_date, bus_customers.bcust_ptt_letter_text,
		business_sellers.bs_ptt_sub_status, bus_customers.bcust_ptt_letter_text_date, business_sellers.bs_ptt_sub_status_date,
		business_sellers.bs_ptt_sub_status_user, bus_customers.bcust_ptt_letter_text_user, business_sellers.bs_ptt_sub_status_order,
		business.bsn_original_csbd_date, business.bsn_original_csbd_user , business.bsn_latest_csbd_date, business.bsn_latest_csbd_user,
		business_sellers.bs_ptt_last_spoken, business_sellers.bs_ptt_last_spoken_date, business_sellers.bs_ptt_last_spoken_user,
		business_sellers.bs_ptt_pc_option , business_sellers.bs_ptt_pc_user, business_sellers.bs_ptt_pc_date, business.bsn_ptt_opi,
		business.bsn_ptt_opi_date, business.bsn_ptt_opi_user, business_sellers.bs_ptt_addto_phr, 
		business.bsn_ptt_override, business.bsn_ptt_override_user, business.bsn_ptt_planning_plans, business.bsn_ptt_pp_date, business.bsn_ptt_pp_user,
		business_sellers.bs_ptt_atop_user, business_sellers.bs_ptt_atop_date
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 8 "
	. $where . " And  business.bsn_status like '%|18|%' 
		 Group By business.bsn_id 
		Order By business_sellers.bs_ptt_sub_status_order ASC";


if ($sql) {
	$userData = $fwDb->query($sql);
}

$sqlRed = "SELECT  count(*) as green_total from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 8 WHERE 1=1  And  business.bsn_status like '%|18|%' and business_sellers.bs_traffic_light = 3
		Group By business.bsn_id 
		Order By business_sellers.bs_ptt_sub_status_order ASC   ";

$dataRed = $fwDb->query($sqlRed);
$fwViewData['dataRed'] = sizeof($dataRed);


$sqlAmbar = "SELECT  count(*) as green_total from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 8 WHERE 1=1  And  business.bsn_status like '%|18|%' and business_sellers.bs_traffic_light = 2
		Group By business.bsn_id 
		Order By business_sellers.bs_ptt_sub_status_order ASC ";

$dataAmbar = $fwDb->query($sqlAmbar);
$fwViewData['dataAmbar'] = sizeof($dataAmbar);

// $sql = "SELECT pca_bsn_id, COUNT(*) AS total_active_alert FROM `planning_client_alerts` WHERE pca_status = 'Open' GROUP BY pca_bsn_id;";
// $res = $fwDb->query($sql);
// $total_active_alert_arr = [];
// foreach($res as $row){
// 	$total_active_alert_arr[$row['pca_bsn_id']] = $row['total_active_alert'];
// }
// $fwViewData['total_active_alert_arr'] = $total_active_alert_arr;

// $sql = 'SELECT * FROM `planning_client_alerts`';
// $res = $fwDb->query($sql);
// $clientArr = [];
// foreach($res as $row){
// 	$pca_bsn_id = $row['pca_bsn_id'];
// 	if(!isset($clientArr[$pca_bsn_id])){
// 		$clientArr[$pca_bsn_id] = [];
// 	}
// 	$clientArr[$pca_bsn_id][] = $row;
// }

$sqlGreen = "SELECT  count(*) as green_total from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
		Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
		person_responsible_detail.prd_prm_id = 8 WHERE 1=1  And  business.bsn_status like '%|18|%' and business_sellers.bs_traffic_light = 1
		Group By business.bsn_id 
		Order By business_sellers.bs_ptt_sub_status_order ASC";

$dataGreen = $fwDb->query($sqlGreen);
$fwViewData['dataGreen'] = sizeof($dataGreen);

$fwViewData['total'] = sizeof($userData);

// $startTime = microtime(true);

$res = $fwDb->query($sql);
$bsnIDs = [];
foreach ($res as $row) {
	$bsnIDs[] = $row['bsn_id'];
}
$qry = "SELECT pca_bsn_id, COUNT(*) AS total_active_alert FROM `planning_client_alerts` WHERE pca_status = 'Open' GROUP BY pca_bsn_id;";
$res = $fwDb->query($qry);
$total_active_alert_data = [];
foreach ($res as $row) {
	$total_active_alert_data[$row['pca_bsn_id']] = $row;
}

$qry = "SELECT doc_bsn_id, doc_name_id, doc_file_name, doc_date_uploaded from document_check_list WHERE doc_name_id IN (64,491,627,628,629,630,716,717)";
$res = $fwDb->query($qry);
$docChkLstData = [];
foreach ($res as $row) {
	if (!isset($docChkLstData[$row['doc_bsn_id']])) {
		$docChkLstData[$row['doc_bsn_id']] = [];
	}
	$docChkLstData[$row['doc_bsn_id']][$row['doc_name_id']] = $row;
}

$qry = "SELECT dpn_bsn_id, dpn_water_ref, dpn_electric_ref, dpn_gas_ref, dpn_storm_ref, dpn_tree_ref, dpn_heritage_ref, dpn_unique_id FROM document_proposal_name where dpn_archived = 0";
$res = $fwDb->query($qry);
$datawa = [];
$datawa_all = [];
foreach ($res as $row) {
	if (!isset($datawa_all[$row['dpn_bsn_id']])) {
		$datawa_all[$row['dpn_bsn_id']] = [];
	}
	$datawa_all[$row['dpn_bsn_id']][] = $row;
	$datawa[$row['dpn_bsn_id']] = $row;
}

$qry = "SELECT dt_id, dt_checklist_no from designer_tracker";
$res = $fwDb->query($qry);
$dtdata = [];
foreach ($res as $row) {
	$dtdata[$row['dt_checklist_no']] = $row;
}

$qry = "SELECT tdt_dt_id, count(*) as out_c from task_designer_tracker WHERE tdt_status <> 'COMPLETE' GROUP BY tdt_dt_id";
$res = $fwDb->query($qry);
$outdata = [];
foreach ($res as $row) {
	$outdata[$row['tdt_dt_id']] = $row;
}

$qry = "SELECT bt_bsn_id, bt_task_id, bt_completed_date, bt_task_not_required from business_tasks WHERE bt_bsn_id IN (" . implode(',', $bsnIDs) . ")";
$res = $fwDb->query($qry);
$data2 = [];
foreach ($res as $row) {
	if (!isset($data2[$row['bt_bsn_id']])) {
		$data2[$row['bt_bsn_id']] = [];
	}
	$data2[$row['bt_bsn_id']][$row['bt_task_id']] = $row;
}

$qry = "SELECT business_tasks.bt_bsn_id, count(*) as cnt_1 from business_tasks
	inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
	where bt_complete = 1 And business_tasks.bt_task_status_id = 2
	GROUP BY business_tasks.bt_bsn_id";
$res = $fwDb->query($qry);
$data3 = [];
foreach ($res as $row) {
	$data3[$row['bt_bsn_id']] = $row;
}

$qry = "SELECT business_tasks.bt_bsn_id, count(*) as cnt_2 from business_tasks
	inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
	where bt_task_not_required = 1 And business_tasks.bt_task_status_id = 2
	GROUP BY business_tasks.bt_bsn_id";
$res = $fwDb->query($qry);
$data4 = [];
foreach ($res as $row) {
	$data4[$row['bt_bsn_id']] = $row;
}

$qry = "SELECT PPC.pc_bsn_id, COUNT(*) AS total FROM project_planning_checklist AS PPC LEFT JOIN planning_project_checklist_admin AS PPCA ON PPC.pc_doc_id = PPCA.ppc_id WHERE PPCA.ppc_required = 'DA' AND PPC.pc_required = 1 GROUP BY PPC.pc_bsn_id";
$res = $fwDb->query($qry);
$datot = [];
foreach ($res as $row) {
	$datot[$row['pc_bsn_id']] = $row['total'];
}

$qry = "SELECT PPC.pc_bsn_id, COUNT(*) AS total FROM project_planning_checklist AS PPC LEFT JOIN planning_project_checklist_admin AS PPCA ON PPC.pc_doc_id = PPCA.ppc_id WHERE PPCA.ppc_required = 'DA' AND PPC.pc_required = 1 AND LENGTH(TRIM(PPC.pc_live_link)) > 0 GROUP BY PPC.pc_bsn_id";
$res = $fwDb->query($qry);
$datotll = [];
foreach ($res as $row) {
	$datotll[$row['pc_bsn_id']] = $row['total'];
}

$qry = "SELECT doc_file_name, doc_bsn_id, ppc_id
	from document_check_list 
	inner join planning_project_checklist_admin on document_check_list.doc_name_id = planning_project_checklist_admin.ppc_dc_uid 
	where length(TRIM(document_check_list.doc_file_name)) > 0 and planning_project_checklist_admin.ppc_required = 'DA'";
$res = $fwDb->query($qry);
$dataotherDA = [];
foreach ($res as $row) {
	if (!isset($dataotherDA[$row['doc_bsn_id']])) {
		$dataotherDA[$row['doc_bsn_id']] = [];
	}
	$dataotherDA[$row['doc_bsn_id']][] = $row;
}

$qry = "SELECT pc_bsn_id, pc_doc_id, pc_live_link from project_planning_checklist";
$res = $fwDb->query($qry);
$dataX = [];
foreach ($res as $row) {
	if (!isset($dataX[$row['pc_bsn_id']])) {
		$dataX[$row['pc_bsn_id']] = [];
	}
	$dataX[$row['pc_bsn_id']][$row['pc_doc_id']] = $row;
}

$qry = "SELECT PPC.pc_bsn_id, COUNT(*) AS total FROM project_planning_checklist AS PPC LEFT JOIN planning_project_checklist_admin AS PPCA ON PPC.pc_doc_id = PPCA.ppc_id WHERE PPCA.ppc_required = 'BA' AND PPC.pc_required = 1 GROUP BY PPC.pc_bsn_id";
$res = $fwDb->query($qry);
$batot = [];
foreach ($res as $row) {
	$batot[$row['pc_bsn_id']] = $row['total'];
}

$qry = "SELECT PPC.pc_bsn_id, COUNT(*) AS total FROM project_planning_checklist AS PPC LEFT JOIN planning_project_checklist_admin AS PPCA ON PPC.pc_doc_id = PPCA.ppc_id WHERE PPCA.ppc_required = 'BA' AND PPC.pc_required = 1 AND LENGTH(TRIM(PPC.pc_live_link)) > 0 GROUP BY PPC.pc_bsn_id";
$res = $fwDb->query($qry);
$batotll = [];
foreach ($res as $row) {
	$batotll[$row['pc_bsn_id']] = $row['total'];
}

$qry = "SELECT doc_file_name, doc_bsn_id , ppc_id from document_check_list 
	inner join planning_project_checklist_admin on document_check_list.doc_name_id = planning_project_checklist_admin.ppc_dc_uid 
	where length(TRIM(document_check_list.doc_file_name)) > 0
	and planning_project_checklist_admin.ppc_required = 'BA'";
$res = $fwDb->query($qry);
$dataotherBA = [];
foreach ($res as $row) {
	if (!isset($dataotherBA[$row['doc_bsn_id']])) {
		$dataotherBA[$row['doc_bsn_id']] = [];
	}
	$dataotherBA[$row['doc_bsn_id']][] = $row;
}
$dataY = $dataX;


if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}

	$rows = count($userData);

	$page_rows = 100;
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

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $sql . " " . $max;

	if ($sql2) {

		$setdata2 = $fwDb->query($sql2);

		foreach ($setdata2 as $k => $v) {
			/* $endTime = microtime(true);
			$executionTime = $endTime - $startTime;
			echo "START LOOP: " . $k;
			db($executionTime); */

			// $sql = "SELECT COUNT(*) AS total_active_alert FROM `planning_client_alerts` WHERE pca_status = 'Open' AND pca_bsn_id = " . $v['bsn_id'] . ";";
			// $res = $fwDb->queryOne($sql);
			$setdata2[$k]['total_active_alert'] = $total_active_alert_data[$v['bsn_id']]['total_active_alert'];

			if ($show_only_alert_records && $total_active_alert_data[$v['bsn_id']]['total_active_alert'] <= 0) {
				unset($setdata2[$k]);
				continue;
			}

			// $sqla = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			//       where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
			// $data = $fwDb->queryOne($sqla);


			// $sql491 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			//       where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 491";
			// $data491 = $fwDb->queryOne($sql491);

			$link = "http://www.deckquotes.com.au/business.detail/bsn_id/" . $v['bsn_id'];
			$link2 = "http://www.documentclick.com.au/site.documents/bsn_id/" . $v['bsn_id'];

			// $sqlwa = "Select dpn_water_ref , dpn_electric_ref, dpn_gas_ref, dpn_storm_ref, dpn_tree_ref , dpn_heritage_ref,
			//        dpn_unique_id from document_proposal_name 
			//        where dpn_bsn_id = " . $v['bsn_id'] . " and dpn_archived = 0";
			// // $datawa = $fwDb->queryOne($sqlwa);
			// $datawa = $fwDb->query($sqlwa);



			// $sql627 = "Select  doc_file_name from document_check_list
			//        where doc_name_id = 627 and doc_bsn_id = " . $v['bsn_id'];

			// $data627 = $fwDb->queryOne($sql627);

			// $sql628 = "Select  doc_file_name from document_check_list
			//        where doc_name_id = 628 and doc_bsn_id = " . $v['bsn_id'];

			// $data628 = $fwDb->queryOne($sql628);

			// $sql629 = "Select  doc_file_name from document_check_list
			//        where doc_name_id = 629 and doc_bsn_id = " . $v['bsn_id'];
			// $data629 = $fwDb->queryOne($sql629);

			// $sql630 = "Select  doc_file_name from document_check_list
			//        where doc_name_id = 630 and doc_bsn_id = " . $v['bsn_id'];
			// $data630 = $fwDb->queryOne($sql630);

			// $sql716 = "Select  doc_file_name from document_check_list
			//          where doc_name_id = 716 and doc_bsn_id = " . $v['bsn_id'];
			// $data716 = $fwDb->queryOne($sql716);

			// $sql717 = "Select  doc_file_name from document_check_list
			//          where doc_name_id = 717 and doc_bsn_id = " . $v['bsn_id'];
			// $data717 = $fwDb->queryOne($sql717);

			// $sql_b = "select dpn_unique_id from document_proposal_name where dpn_bsn_id = " . $v['bs_business_id'] . " and dpn_archived = 0";
			// $ppt = $fwDb->queryOne($sql_b);

			// $sqldt = "select dt_id from  designer_tracker where dt_checklist_no = '" . $ppt['dpn_unique_id'] . "'";
			// $dtdata = $fwDb->queryOne($sqldt);

			// $sql_outs = "Select count(*) as out_c from task_designer_tracker where tdt_dt_id = " . $dtdata['dt_id'] . " AND tdt_status <> 'COMPLETE' ";
			// $outdata = $fwDb->queryOne($sql_outs);


			// $sql_chk = "select dpn_unique_id from document_proposal_name where dpn_bsn_id = " . $v['bs_business_id'] . " and dpn_archived = 0";
			// $chk = $fwDb->query($sql_chk);


			if (!empty($docChkLstData[$v['bsn_id']][64]['doc_file_name'])) {
				$ccdate = $docChkLstData[$v['bsn_id']][64]['doc_date_uploaded'];
				$Statusdate = changedate_y_m_d($ccdate);
				$curdate_y_m_d = date('Y-m-d');
				$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
			} else {
				$ccdate = '';
				$dayscount = '';
			}


			$ccdate = $v['bs_ptt_sub_status_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$substatus_days = daysDifference($curdate_y_m_d, $Statusdate);

			$o_date = $v['bsn_orginal_csbd'];
			$c_date = $v['bsn_latest_csbd'];
			$date1 = changedate_y_m_d($o_date);
			$date2 = changedate_y_m_d($c_date);
			$day = '';
			if (!empty($date1) and !empty($date2)) {

				$day = daysDifference($date2, $date1);
			}


			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['link2'] = $link2;
			$setdata2[$k]['dayscount'] = $dayscount;
			$setdata2[$k]['dd'] = $day;
			$setdata2[$k]['bs_tl_date'] = changedate_d_m_y($v['bs_tl_date']);

			//$setdata2[$k]['dpn_water_ref'] = $datawa['dpn_water_ref'];
			$setdata2[$k]['datawa'] = $datawa_all[$v['bsn_id']];
			$setdata2[$k]['doc_file_name_627'] = $docChkLstData[$v['bsn_id']][627]['doc_file_name'];

			$setdata2[$k]['dpn_electric_ref'] = $datawa[$v['bsn_id']]['dpn_electric_ref'];
			$setdata2[$k]['doc_file_name_628'] = $docChkLstData[$v['bsn_id']][628]['doc_file_name'];

			$setdata2[$k]['dpn_gas_ref'] = $datawa[$v['bsn_id']]['dpn_gas_ref'];
			$setdata2[$k]['doc_file_name_629'] = $docChkLstData[$v['bsn_id']][629]['doc_file_name'];

			$setdata2[$k]['dpn_storm_ref'] = $datawa[$v['bsn_id']]['dpn_storm_ref'];
			$setdata2[$k]['doc_file_name_630'] = $docChkLstData[$v['bsn_id']][630]['doc_file_name'];


			$setdata2[$k]['doc_file_name_716'] = $docChkLstData[$v['bsn_id']][630]['doc_file_name'];
			$setdata2[$k]['doc_file_name_717'] = $docChkLstData[$v['bsn_id']][630]['doc_file_name'];
			$setdata2[$k]['checklist'] = $datawa_all[$v['bsn_id']];



			$setdata2[$k]['substatus_days'] = $substatus_days;

			$setdata2[$k]['doc_file_name_491'] = $docChkLstData[$v['bsn_id']][491]['doc_file_name'];
			$setdata2[$k]['doc_date_uploaded_491'] = changedate_d_m_y($docChkLstData[$v['bsn_id']][491]['doc_date_uploaded']);
			$setdata2[$k]['out_c'] = $outdata[$dtdata[$datawa['dpn_unique_id']]]['out_c'];

			foreach ($colhead as $kh => $kv) {

				$taskid = $kv['bst_task_id'];

				// $sql2 = "Select business_tasks.* from business_tasks
				//  where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = " . $kv['bst_task_id'];

				// $data2 = $fwDb->queryOne($sql2);

				if ($data2[$v['bsn_id']][$taskid]['bt_task_not_required'] == 1) {
					$taskdata[$taskid] = 'N / R';
				} else {
					$taskdata[$taskid] = changedate_d_m_y($data2[$v['bsn_id']][$taskid]['bt_completed_date']);
				}
			}

			$setdata2[$k]['task'] = $taskdata;


			// $sql3 = "Select count(*) as cnt_1 from business_tasks
			//  inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
			// where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And bt_complete = 1 And business_tasks.bt_task_status_id = 2";

			// $data3 = $fwDb->queryOne($sql3);

			$percomp = round($data3[$v['bsn_id']]['cnt_1'] / $tottask * 100);
			$setdata2[$k]['completed'] = $percomp;

			// $sql4 = "Select count(*) as cnt_2 from business_tasks
			//   inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
			//   where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And bt_task_not_required = 1 
			//   And business_tasks.bt_task_status_id = 2";

			// $data4 = $fwDb->queryOne($sql4);
			$nr = round($data4[$v['bsn_id']]['cnt_2'] / $tottask * 100, 2);
			$setdata2[$k]['notreq'] = $nr;

			// For DA Docs
			$totalDA = $datot[$v['bs_business_id']] ?? 0;

			// $sqlDAll = "select project_planning_checklist.pc_bsn_id , planning_project_checklist_admin.ppc_id from project_planning_checklist
			//        left join planning_project_checklist_admin on  project_planning_checklist.pc_doc_id = planning_project_checklist_admin.ppc_id
			// 	   where planning_project_checklist_admin.ppc_required = 'DA' AND 
			// 	   project_planning_checklist.pc_required = 1
			// 	   and length(TRIM(project_planning_checklist.pc_live_link)) > 0
			// 	   and  project_planning_checklist.pc_bsn_id = " . $v['bs_business_id'];

			// $datotll = $fwDb->query($sqlDAll);
			$totalDAll = $datotll[$v['bs_business_id']] ?? 0;


			// $sql99 = "select doc_file_name, doc_bsn_id , ppc_id from document_check_list 
			// 		  inner join planning_project_checklist_admin on document_check_list.doc_name_id = planning_project_checklist_admin.ppc_dc_uid 
			// 		  where document_check_list.doc_bsn_id = " . $v['bs_business_id'] . " and length(TRIM(document_check_list.doc_file_name)) > 0
			// 		  and planning_project_checklist_admin.ppc_required = 'DA' ";

			// $dataotherDA = $fwDb->query($sql99);


			$x = 0;
			// if (isset($dataotherDA[$v['bs_business_id']])) {
			// 	// db($v['bs_business_id']);
			// 	// db($dataotherDA[$v['bs_business_id']]);
			// 	foreach ($dataotherDA[$v['bs_business_id']] as $k1 => $v1) {
			// 		// $sqlX = " select pc_bsn_id, pc_live_link from project_planning_checklist 
			// 		//           where pc_doc_id = " . $v1['ppc_id'] . " and pc_bsn_id = " . $v1['doc_bsn_id'];

			// 		// $dataX = $fwDb->queryOne($sqlX);
			// 		// db($v1);
			// 		// db($dataX);
			// 		if (empty($dataX[$v1['doc_bsn_id']][$v1['ppc_id']]['pc_live_link'])) {
			// 			$x++;
			// 		}
			// 	}
			// }


			//$t1 = sizeof($dataotherDA);
			//$totalDAll = $totalDAll + $t1;
			$totalDAll = $totalDAll + $x;
			unset($x);


			$setdata2[$k]['totalDA'] = $totalDA;
			$setdata2[$k]['totalDAll'] = $totalDAll;
			//DA Docs Ends


			// For BA Docs
			$totalBA = $batot[$v['bs_business_id']] ?? 0;
			$totalBAll = $batotll[$v['bs_business_id']] ?? 0;

			$t2 = sizeof($dataotherBA[$v['bs_business_id']]);

			$y = 0;
			// if (isset($dataotherBA[$v['bs_business_id']])) {
			// 	// db($dataotherBA[$v['bs_business_id']]);
			// 	foreach ($dataotherBA[$v['bs_business_id']] as $k1 => $v1) {
			// 		// $sqlY = " select pc_bsn_id, pc_live_link from project_planning_checklist 
			// 		//           where pc_doc_id = " . $v1['ppc_id'] . " and pc_bsn_id = " . $v1['doc_bsn_id'];

			// 		// $dataY = $fwDb->queryOne($sqlY);

			// 		// if (empty($dataY['pc_live_link'])) {
			// 		// 	$y++;
			// 		// }

			// 		if (empty($dataY[$v1['doc_bsn_id']][$v1['ppc_id']]['pc_live_link'])) {
			// 			$y++;
			// 		}
			// 	}
			// }


			$totalBAll = $totalBAll + $y;

			$setdata2[$k]['totalBA'] = $totalBA;
			$setdata2[$k]['totalBAll'] = $totalBAll;
			//BA Docs Ends


		}


		$sort_hia = $fwRequest->getParam('sort_hia', '');
		if ($sort_hia):

			foreach ($setdata2 as $key => $row) {

				$desig[$key]  = $row['dayscount'];
			}

			array_multisort($desig, SORT_ASC, $setdata2);
		endif;

		$fwViewData['list'] =  $setdata2;

		$report = new Fw_Db_Table('report_planning_only_task_tracker');
		$report->setWhere("1=1");
		$report->deleteRows();

		foreach ($setdata2 as $rk => $rv) {
			if (!empty($rv['bsn_id'])) {
				$detailrp['re_bsn_id'] = $rv['bsn_id'];
				$this_id = $report->insertRow($detailrp);
			}
		}
	}
}



//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Planning Task Tracker";


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if ($export > 0) {

	for ($char = 'A'; $char <= 'Z'; $char++) {
		$col[] = $char . '1';
	}
	for ($char = 'A'; $char <= 'Z'; $char++) {
		$col2[] = $char;
	}

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";


	// Create new PHPExcel object
	$objPHPExcel = new PHPExcel();

	// Set document properties
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

	$j = 8;
	foreach ($colhead as $ke => $ve) {
		$objPHPExcel->getActiveSheet()->getColumnDimension($col2[$j])->setWidth(14);
		$j++;
	}


	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Address')
		->setCellValue('B1', 'Customer Name')
		->setCellValue('C1', 'D Type')
		->setCellValue('D1', 'Planning Manager')
		->setCellValue('E1', 'Link')
		->setCellValue('F1', 'HIA Days')
		->setCellValue('G1', 'Latest CSBD')
		->setCellValue('H1', 'Letter Text');


	$i = 8;
	foreach ($colhead as $ke => $ve) {
		$objPHPExcel->setActiveSheetIndex(0)->setCellValue($col[$i], $ve['bst_task_id']);
		$i++;
	};

	$from = "A1"; // or any value
	$to = "AZ1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);


	$row = 2;
	$sr = 1;
	foreach ($setdata2 as $k => $v) {
		$cno = 8;
		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $v['bsn_address'])
			->setCellValue('B' . $row, $v['bcust_fname'] . ' ' . $v['bcust_lname'])
			->setCellValue('C' . $row, $v['bsn_ptt_d_type'])
			->setCellValue('D' . $row, $v['prd_name'])
			->setCellValue('E' . $row, $v['link'])
			->setCellValue('F' . $row, $v['dayscount'])
			->setCellValue('G' . $row, $v['bsn_latest_csbd'])
			->setCellValue('H' . $row, $v['bcust_ptt_letter_text']);


		foreach ($setdata2[$k]['task'] as $kc => $vc) {

			//db($vc);	
			$objPHPExcel->getActiveSheet()->setCellValue($col2[$cno] . $row, $vc);
			$cno++;
		}



		$row = $row + 1;
		$sr = $sr + 1;
	}

	// Rename worksheet
	$objPHPExcel->getActiveSheet()->setTitle('Planning Only Task Tracker');


	// Set active sheet index to the first sheet, so Excel opens this as the first sheet
	$objPHPExcel->setActiveSheetIndex(0);


	// Redirect output to a client’s web browser (Excel2007)
	//header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="planning_only_task_tracker.xls"');
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


// Print Task

$bus_id = $fwRequest->getParam('print', 0);

if ($bus_id > 0) {
	$sql1 = "SELECT business.bsn_name, business.bsn_ptt_d_type, person_responsible_detail.prd_name, business.bsn_latest_csbd
		FROM business
		RIGHT JOIN person_responsible_detail ON business.bsn_id = person_responsible_detail.prd_bsn_id
		AND person_responsible_detail.prd_prm_id = 8
		WHERE bsn_id = " . $bus_id;

	$busdata = $fwDb->queryOne($sql1);

	$sql2 = "Select bc_cpr_hia_date from business_sellers where business_sellers.bs_business_id = " . $bus_id;
	$hiadata = $fwDb->queryOne($sql2);


	$sql5 = "SELECT  business_sellers.bs_business_id,  bus_customers.bcust_fname, bus_customers.bcust_lname,
		business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		where business.bsn_id = " . $bus_id;

	$b_data = $fwDb->queryOne($sql5);
	$name = $b_data['bcust_fname'] . ' ' . $b_data['bcust_lname'] . ' ' . $b_data['bsn_address'];

	$hiadate = $hiadata['bc_cpr_hia_date'];
	$hia = changedate_y_m_d($hiadate);
	$curdate_y_m_d1 = date('Y-m-d');
	$daysdiff = daysDifference($curdate_y_m_d1, $hia);




	$newdate = date('Y-m-d', strtotime("-7 days"));


	$sql3 = "Select count(*) as task_done from business_tasks
			 
			  where business_tasks.bt_bsn_id = " . $v['bsn_id'] . "
			  And business_tasks.bt_task_status_id = 2  AND business_tasks.bt_completed_date >= '" . $newdate . "'";

	$data3 = $fwDb->queryOne($sql3);




	$sqlT = "select * from busness_status_task where bst_business_status_id = 2 order by bst_order";
	$taskdata = $fwDb->query($sqlT);


	foreach ($taskdata as $tk => $tv) {

		$sqlbt = "select business_tasks.*, users.user_name from business_tasks 
		Inner join users on business_tasks.bt_completed_by = users.user_id
		where bt_task_id = " . $tv['bst_task_id'] . " And bt_bsn_id = " . $bus_id;

		$taskdetail = $fwDb->queryOne($sqlbt);


		$setdata3[$tk]['bst_task_id'] = $tv['bst_task_id'];
		$setdata3[$tk]['bst_task_name'] = $tv['bst_task_name'];

		if ($taskdetail['bt_complete'] == 1) {
			$comp = 'Yes';
		} else {
			$comp = 'No';
		}
		$setdata3[$tk]['bt_complete'] = $comp;

		if ($taskdetail['bt_complete'] == 1) {
			$setdata3[$tk]['bt_completed_date'] = $taskdetail['bt_completed_date'];
		} else {

			$setdata3[$tk]['bt_completed_date'] =  '';
		}
		$setdata3[$tk]['user_name'] = $taskdetail['user_name'];
	}

	$dt = date("l, d F Y");
	$html = "<html><body>";

	//$html .= "<h1>".$busdata['bsn_name']."</h1><br>";
	$html .= '<h1 style = "font-size:90px;text-align:center;"> 7 Day Planning Task Progress Report </h1>';

	$html .= '<strong><table  cellpadding="5" >';
	$html .= '<tr><td>' . $dt . '</td> <td>' . $name . ' </td> </tr>';
	$html .= '<tr><td>Planning Manager : ' . $busdata['prd_name'] . '</td><td>Development Type : ' . $busdata['bsn_ptt_d_type'] . ' </td></tr>';
	$html .= '<tr><td>Hia Sign Date : ' . $hiadata['bc_cpr_hia_date'] . ' </td> <td>Day Count :' . $daysdiff . ' </td></tr>';
	$html .= '<tr><td>Could Start Building Date : ' . $busdata['bsn_latest_csbd'] . '</td><td>Tasks Completed last 7 Days : ' . $data3['task_done'] . ' </td></tr>';

	$html .= '<div style="width:100%;"> &nbsp;';

	$html .= '</div>';

	$html .= '</table></strong><br><br>';

	$html .= '<br><table border="1" cellpadding="5">
		  <tr><th style="width:6%;"><strong>UID</strong></th><th style="width:58%;"><strong>Task Name</strong></th>
	          <th style="width:8%;"><strong>Complete</strong></th><th style="width:14%;"><strong>Complete Date</strong></th>
		  <th style="width:8%;"><strong>Days Count</strong></th> <th style="width:14%;"><strong>Completed By</strong></th></tr>';

	$hiadate = $hiadata['bc_cpr_hia_date'];
	$hia = changedate_y_m_d($hiadate);

	foreach ($setdata3 as $k2 => $v2) {

		$day_count = '';
		if (!empty($v2['bt_completed_date'])) {
			$comp_date =  changedate_y_m_d($v2['bt_completed_date']);
			$day_count = daysDifference($comp_date, $hia);
		}

		$html .= '<tr>';
		$html .= '<td>' . $v2['bst_task_id'] . '</td>';
		$html .= '<td>' . $v2['bst_task_name'] . '</td>';
		if ($v2['bt_complete'] == 'Yes') {
			$html .= '<td style="background-color: #6F9;">' . $v2['bt_complete'] . '</td>';
		} else {
			$html .= '<td>' . $v2['bt_complete'] . '</td>';
		}
		$html .= '<td>' . $v2['bt_completed_date'] . '</td>';
		$html .= '<td>' . $day_count . '</td>';
		$html .= '<td>' . $v2['user_name'] . '</td>';
		$html .= '</tr>';
	}

	$html .= '</table></body></html>';

	$heading = "Planning Task Tracker";
	$fname = "Manoj";

	create_planning_report($heading, $html, $bus_id);
}


// Print All Task

$printall = $fwRequest->getParam('printall', 0);

if ($printall) {

	$sqlBus = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, 
bus_customers.bcust_lname, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, bus_customers.bcust_misc_home,
 business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address, 
 business.bsn_cp_incl_choices
FROM business_sellers
INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id
WHERE business.bsn_status LIKE '%|18|%'
GROUP BY business.bsn_id
ORDER BY business.bsn_status_sys_date DESC";

	if ($sqlBus) {
		$businessDetail = $fwDb->query($sqlBus);
	}

	$html = "<html><body>";
	foreach ($businessDetail as $bk => $bv) {

		$sqlT = "select * from busness_status_task where bst_business_status_id = 2 order by  bst_order";
		$taskdata = $fwDb->query($sqlT);

		foreach ($taskdata as $tk => $tv) {

			$sqlbt = "select business_tasks.*, users.user_name from business_tasks 
		Inner join users on business_tasks.bt_completed_by = users.user_id
		where bt_task_id = " . $tv['bst_task_id'] . " And bt_bsn_id = " . $bv['bsn_id'];

			$taskdetail = $fwDb->queryOne($sqlbt);

			$setdata3[$tk]['bst_task_id'] = $tv['bst_task_id'];
			$setdata3[$tk]['bst_task_name'] = $tv['bst_task_name'];

			if ($taskdetail['bt_complete'] == 1) {
				$comp = 'Yes';
			} else {
				$comp = 'No';
			}
			$setdata3[$tk]['bt_complete'] = $comp;

			if ($taskdetail['bt_complete'] == 1) {
				$setdata3[$tk]['bt_completed_date'] = $taskdetail['bt_completed_date'];
			} else {

				$setdata3[$tk]['bt_completed_date'] =  '';
			}
			$setdata3[$tk]['user_name'] = $taskdetail['user_name'];
		}


		$html .= '<table border="1" cellpadding="5">
		  <tr><th colspan="5" style="text-align:center; color:#25b4e5;"><h1>' . $bv['bsn_name'] . '</h1></th></tr>
		  <tr><th style="width:6%;"><strong>UID</strong></th><th style="width:58%;"><strong>Task Name</strong></th>
	          <th style="width:8%;"><strong>Complete</strong></th><th style="width:14%;"><strong>Complete Date</strong></th>
		  <th style="width:14%;"><strong>Completed By</strong></th></tr>';

		foreach ($setdata3 as $k2 => $v2) {
			$html .= '<tr>';
			$html .= '<td>' . $v2['bst_task_id'] . '</td>';
			$html .= '<td>' . $v2['bst_task_name'] . '</td>';
			$html .= '<td>' . $v2['bt_complete'] . '</td>';
			$html .= '<td>' . $v2['bt_completed_date'] . '</td>';
			$html .= '<td>' . $v2['user_name'] . '</td>';
			$html .= '</tr>';
		}

		$html .= '</table>';
		$html .= '<div style="page-break-before:always">&nbsp;</div>';
	}
	$html .= '</body></html><br><br>';
	$heading = "Planning Task Tracker";
	$fname = "Manoj";
	create_planning_report($heading, $html, $fname);
}



// Merge

$bus_id = $fwRequest->getParam('merge', 0);
if ($bus_id > 0) {
	require_once(MODULES_DIR . 'PDFMerger.php');
	$pdf = new PDFMerger;;

	$sql_A = "select bc_ptt_letter from business_sellers where bs_business_id = " . $bus_id;
	$data_A = $fwDb->queryOne($sql_A);



	$folder_path = "files/cma/";
	$object_name = $data_A['bc_ptt_letter'];
	$docfile1 = get_file_raw_data($folder_path, $object_name);

	$newfile1 = "new_doc1.pdf";
	shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=' . $newfile1 . ' ' . $docfile1);
	rename($newfile1, BASE_DIR . 'files/merged/' . $newfile1);
	//sleep(1);

	$sql_B = "select bc_planning_task_report from business_sellers where bs_business_id = " . $bus_id;
	$data_B = $fwDb->queryOne($sql_B);


	$folder_path = "files/cma/";
	$object_name = $data_B['bc_planning_task_report'];
	$docfile2 = get_file_raw_data($folder_path, $object_name);

	$newfile2 = "new_doc2.pdf";

	shell_exec('gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=' . $newfile2 . ' ' . $docfile2);
	rename($newfile2, BASE_DIR . 'files/merged/' . $newfile2);

	$newfile3 = BASE_DIR . 'files/merged/' . $newfile1;
	//$pdf->addPDF($docfile);
	$pdf->addPDF($newfile3);

	$newfile4 = BASE_DIR . 'files/merged/' . $newfile2;
	$pdf->addPDF($newfile4);

	$fn = "combined_report.pdf";
	$pdf->merge('file', BASE_DIR . 'files/merged/' . $fn);

	$filepath_url = BASE_URL . 'files/merged/' . $fn;
	echo "<script>window.open('$filepath_url', '_blank','toolbar=yes, width=900, height=750'); window.focus();</script>";
}


// Management Report

$management = $fwRequest->getParam('management', 0);

if ($management) {

	$html .= '<table border="1" cellpadding="5">
		  <tr>
		  <th  style="width:20%;">Project</th>
		  <th style="width:15%;">Sub Status</th><th style="width:10%;">Planning Manager</th>
	          <th style="width:8%;">Days at Sub Status </th><th style="width:8%;">Hia Days</th><th style="width:8%;">Latest CSBD </th>
		  <th style="width:8%;">Day Difference</th><th style="width:14%;">Traffic Light</th>
		  <th style="width:9%;">Last Spoken</th>
		  </tr>';

	foreach ($setdata2 as $mk => $mv) {

		$sql99 = "SELECT  pst_status from ptt_sub_type where pst_id = " . $mv['bs_ptt_sub_status'];
		$sub_status = $fwDb->queryOne($sql99);

		$html .= "<tr>";
		$html .= "<td>" . $mv['bcust_fname'] . " " . $mv['bcust_lname'] . "<br>" . $mv['bsn_address'] . "  </td>";
		$html .= "<td>" . $sub_status['pst_status'] . "</td>";
		$html .= "<td>" . $mv['prd_name'] . "</td>";
		$html .= "<td>" . $mv['substatus_days'] . "</td>";
		$html .= "<td>" . $mv['dayscount'] . "</td>";
		$html .= "<td>" . $mv['bsn_latest_csbd'] . "</td>";
		$html .= "<td>" . $mv['dd'] . "</td>";

		if ($mv['bs_traffic_light'] == 1) {
			$html .= '<td style="background-color:#00CC33;">' . $mv["bs_tl_user"] . '<br>' . $mv["bs_tl_date"] . '</td>';
		} elseif ($mv['bs_traffic_light'] == 2) {
			$html .= '<td style="background-color:#ff7f27;">' . $mv["bs_tl_user"] . '<br>' . $mv["bs_tl_date"] . '</td>';
		} elseif ($mv['bs_traffic_light'] == 3) {
			$html .= '<td style="background-color:#F00;">' . $mv["bs_tl_user"] . '<br>' . $mv["bs_tl_date"] . '</td>';
		} else {
			$html .= "<td></td>";
		}

		if ($mv['bs_ptt_last_spoken']) {
			$html .= "<td>" . $mv['bs_ptt_last_spoken'] . "<br>" . $mv["bs_ptt_last_spoken_user"] . "</td>";
		} else {
			$html .= "<td></td>";
		}
		$html .= "</tr>";
	}

	$html .= "</table>";
	$heading = "Planning Task Tracker Management Report";
	create_management_report($heading, $html, $bus_id);
	//exit;
}

$sql_l = "Select * from letter_text_planning order by lt_code";
$fwViewData['letterData'] = $fwDb->query($sql_l);

$sql_2 = "Select * from ptt_plans_changed";
$fwViewData['pcData'] = $fwDb->query($sql_2);


$sql_sub = "SELECT  * from ptt_sub_type";
$fwViewData['sub_status'] = $fwDb->query($sql_sub);
