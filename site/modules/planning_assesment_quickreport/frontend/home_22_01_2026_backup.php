<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$search = $fwRequest->getParam('search', '');
$table = new Fw_Db_Table('business');
$tablebusiness = new Fw_Db_Table('business');
$busseller = new Fw_Db_Table('business_sellers');
$searchaddr = $fwRequest->getParam('searchaddr', '');


$submitmoveto = $fwRequest->getParam('moveto', '');
if (!empty($submitmoveto)) {
	$movetoData = $fwRequest->getParam('old', '');

	foreach ($movetoData as $mtk => $mtv) {
		$moveDetail['bsn_planning_moveto_old'] = 1;
		$tablebusiness->setWhere('bsn_id = ' . $mtk);
		$this_id = $tablebusiness->updateRow($moveDetail);
	}
}


$submitwatch = $fwRequest->getParam('watchlist', '');
if (!empty($submitwatch)) {
	$watchData = $fwRequest->getParam('watch', '');

	foreach ($watchData as $kw => $vw) {
		if ($vw == 'on') {
			$vw = 1;
		}
		$watchDetail['bsn_watch_list'] = $vw;
		$tablebusiness->setWhere('bsn_id = ' . $kw);
		$this_id = $tablebusiness->updateRow($watchDetail);
	}
}


$meeting_occured = $fwRequest->getParam('meeting_occured', '');
if ($meeting_occured) {
	$keys_2 = array_keys($meeting_occured);
	$ky_2 = $keys_2[0];
	$val_2 = $meeting_occured[$ky_2];

	$detail['bs_paqr_meeting_o'] = $val_2;
	$detail['bs_paqr_meeting_o_user'] = $_SESSION['user']['user_name'];
	$detail['bs_paqr_meeting_o_date'] = date('d-m-Y');

	$busseller->setWhere("bs_business_id = " . $ky_2);
	if ($busseller->rowExists()) {
		$this_id = $busseller->updateRow($detail);
	}
}

$planning = $fwRequest->getParam('planning', '');

if (!empty($planning)) {
	$plreport_not = $fwRequest->getParam('plreport_not', '');
	$_SESSION['plreport_not'] = $plreport_not;
	$fwViewData['pnot'] = $plreport_not;
}

if (!empty($search)) {
	$keyword = $fwRequest->getParam('keyword', '');
	//$_SESSION['keyword'] = $keyword;
}

if (!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
}


//Clear All
$clear = $fwRequest->getParam('clear', '');
if ($clear) {

	unset($_SESSION['keyword']);
	unset($_SESSION['plreport_not']);
	unset($_SESSION['searchkey']);
	unset($_SESSION['bbntp']);
	unset($bbntp);
}

//$where = "WHERE ((bsn_sub_status = 'Open' AND bsn_planning_moveto_old <> 1) OR (bsn_sub_status IN ('Hold', 'Lost') AND bsn_planning_moveto_old =  0 ) )";
$where = "WHERE ((business.bsn_sub_status = 'Open' AND business.bsn_planning_moveto_old <> 1) OR (business.bsn_sub_status IN ('Hold', 'Lost') AND business.bsn_planning_moveto_old = 0) )";

$dm = $fwRequest->getParam('tobedm', '');
$cleardm = $fwRequest->getParam('cleardm', '');

if (!empty($cleardm)) {
	unset($_SESSION['dm']);
	unset($dm);
	unset($_SESSION['keyword']);
	unset($_SESSION['plreport_not']);
	unset($_SESSION['searchkey']);
}

if (!empty($dm) || isset($_SESSION['dm'])) {


	unset($_SESSION['keyword']);
	unset($_SESSION['plreport_not']);
	unset($_SESSION['searchkey']);

	$where = "WHERE ((bsn_sub_status = 'Open' AND bsn_planning_moveto_old <> 1) OR 
         (bsn_sub_status IN ('Hold', 'Lost') AND bsn_planning_moveto_old =  0 ) ) AND
		 business_sellers.bs_qr_delivery_method = 'To Be Determined'";
	$_SESSION['dm'] = 1;
}

//Filter for 'Booked But Not Taken Place'
$bbntp = $fwRequest->getParam('bbntp', '');
if (!empty($bbntp) || isset($_SESSION['bbntp'])) {

	unset($_SESSION['keyword']);
	unset($_SESSION['plreport_not']);
	unset($_SESSION['searchkey']);

	$where = "WHERE ((bsn_sub_status = 'Open' AND bsn_planning_moveto_old <> 1) OR 
         (bsn_sub_status IN ('Hold', 'Lost') AND bsn_planning_moveto_old =  0 ) ) AND
		 business_sellers.bs_qr_delivery_method = 'Booked But Not Taken Place'";
	$_SESSION['bbntp'] = 1;
}



$fwViewData['ran'] =  rand(100000, 999999);

if ($keyword):

	$where .= "AND business.bsn_sub_status LIKE '%" . $keyword . "%'";

	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];

elseif ($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%" . $_SESSION['keyword'] . "%'";

	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;

if ($searchkey):

	$where .= " AND business.bsn_address LIKE '%" . $searchkey . "%'";

	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey'] = $_SESSION['searchkey'];

elseif ($_SESSION['searchkey'] && $pagenum > 0):

	$where .= " AND business.bsn_address LIKE '%" . $_SESSION['searchkey'] . "%'";

	$fwViewData['searchkey'] = $_SESSION['searchkey'];
endif;



if (empty($pagenum)) {
	unset($_SESSION['last_tdsql']);
}

if ($_SESSION['plreport_not'] && $pagenum > 0) {
	$plreport_not = 1;
}


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
	    bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name, business.bsn_type,
	    business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address , business.bsn_rating, business.bsn_watch_list,
	    business.bsn_proj_cust_type ,  business_sellers.bs_qr_delivery_method, business.bsn_address_same, business_sellers.bs_qr_dm_user,
	    business_sellers.bs_qr_dm_date, business_sellers.bs_paqr_alertoption, business_sellers.bs_paqr_alertoption_at, business_sellers.bs_paqr_alertoption_by , business_sellers.bs_paqr_sqm, business_sellers.bs_paqr_meeting_o,
		business_sellers.bs_paqr_meeting_o_user, business_sellers.bs_paqr_meeting_o_date
	    from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " Order By business.bsn_status_sys_date DESC";


if ($plreport_not == 1 || $_SESSION['plreport_not'] == 1) {
	$fwViewData['pnot'] = 1;

	/*$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, 
	bus_customers.bcust_lname, bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble, 
	bus_customers.bcust_misc_business, business.bsn_type, 
	bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name, 
	business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address , business.bsn_rating, business.bsn_watch_list,
	business.bsn_proj_cust_type, business_sellers.bs_qr_delivery_method , business.bsn_address_same,
	business_sellers.bs_paqr_alertoption, business_sellers.bs_paqr_alertoption_at, business_sellers.bs_paqr_alertoption_by, business_sellers.bs_qr_dm_user,
	business_sellers.bs_qr_dm_date, business_sellers.bs_paqr_sqm,  business_sellers.bs_paqr_meeting_o,
		business_sellers.bs_paqr_meeting_o_user, business_sellers.bs_paqr_meeting_o_date
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Right Join document_check_list on  business_sellers.bs_business_id = document_check_list.doc_bsn_id 
	And length(document_check_list.doc_file_name) = 0 And document_check_list.`doc_name_id` = 44
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " Order By business.bsn_status_sys_date DESC";*/
	/*$sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, business.bsn_type, bus_customers.bcust_misc_home,business.bsn_advert_text, business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address , business.bsn_rating, business.bsn_watch_list, business.bsn_proj_cust_type, business_sellers.bs_qr_delivery_method , business.bsn_address_same, business_sellers.bs_paqr_alertoption, business_sellers.bs_paqr_alertoption_at, business_sellers.bs_paqr_alertoption_by, business_sellers.bs_qr_dm_user, business_sellers.bs_qr_dm_date, business_sellers.bs_paqr_sqm, business_sellers.bs_paqr_meeting_o, business_sellers.bs_paqr_meeting_o_user, business_sellers.bs_paqr_meeting_o_date from business_sellers Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id Left Join document_check_list on business_sellers.bs_business_id = document_check_list.doc_bsn_id And document_check_list.`doc_name_id` = 44 Inner Join business ON business_sellers.bs_business_id = business.bsn_id WHERE ((bsn_sub_status = 'Open' AND bsn_planning_moveto_old <> 1) OR (bsn_sub_status IN ('Hold', 'Lost') AND bsn_planning_moveto_old = 0 ) ) AND (document_check_list.doc_file_name IS NULL OR TRIM(document_check_list.doc_file_name) = '') Order By business.bsn_status_sys_date DESC";*/
	$sql = "SELECT bs.bs_business_id, bs.bs_customers_id, bc.bcust_fname, bc.bcust_lname, bc.bcust_misc_email1, bc.bcust_misc_email2, bc.bcust_misc_moble, bc.bcust_misc_business, business.bsn_type, bc.bcust_misc_home, business.bsn_advert_text, business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address, business.bsn_rating, business.bsn_watch_list, business.bsn_proj_cust_type, bs.bs_qr_delivery_method, business.bsn_address_same, bs.bs_paqr_alertoption, bs.bs_paqr_alertoption_at, bs.bs_paqr_alertoption_by, bs.bs_qr_dm_user, bs.bs_qr_dm_date, bs.bs_paqr_sqm, bs.bs_paqr_meeting_o, bs.bs_paqr_meeting_o_user, bs.bs_paqr_meeting_o_date FROM business_sellers bs JOIN bus_customers bc ON bs.bs_customers_id = bc.bcust_id JOIN business ON bs.bs_business_id = business.bsn_id " . $where . " AND NOT EXISTS ( SELECT 1 FROM document_check_list dcl WHERE dcl.doc_bsn_id = bs.bs_business_id AND dcl.doc_name_id = 44 AND TRIM(COALESCE(dcl.doc_file_name, '')) <> '' ) ORDER BY business.bsn_status_sys_date DESC";
}

$sql7 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname        
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " 
	and  STR_TO_DATE(business.bsn_status_sys_date , '%Y-%m-%d' ) > CURDATE( ) - INTERVAL 7 DAY ";
$data7 = $fwDb->query($sql7);

$fwViewData['seven'] = sizeof($data7);

$sql14 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname
       
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " 
	and  STR_TO_DATE(business.bsn_status_sys_date , '%Y-%m-%d' ) > CURDATE( ) - INTERVAL 14 DAY ";

$data14 = $fwDb->query($sql14);



$fwViewData['fourteen'] = sizeof($data14);


$query = 'SELECT doc_bsn_id, doc_name_id, doc_file_name FROM document_check_list WHERE doc_name_id IN (481)';
$result = $fwDb->query($query);
$document_check_list = [];
foreach($result as $row) {
	if(!isset($document_check_list[$row['doc_bsn_id']])) {
		$document_check_list[$row['doc_bsn_id']] = [];
	}
	$document_check_list[$row['doc_bsn_id']][$row['doc_name_id']] = $row;
}

//echo $sql;
if ($sql) {
	$userData = $fwDb->query($sql);
}


$fwViewData['total'] = sizeof($userData);
$total2 = sizeof($userData);

$users = [];
$query = 'SELECT user_id, user_username FROM users';
$result = $fwDb->query($query);
foreach($result as $row) {
	$users[$row['user_id']] = $row['user_username'];
}

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

			$link = "http://www.deckquotes.com.au/business.detail/bsn_id/" . $v['bsn_id'];

			$planning_link = $BASE_URL . '/sales_phase_logon.planning/bsn_id/' . $v['bsn_id'];
			// $project_link = 'https://planningapprovalscanberra.com.au/project/design-phase/' . $v['bsn_id'];
			$project_link = $planning_link;

			$ccdate = $v['bsn_status_sys_date'];
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);

			// Uid 555 starts

			$sqluid555 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				      where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 555";
			$data555 = $fwDb->queryOne($sqluid555);

			// Uid 555 ends


			// Uid 474 starts

			$sqluid474 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				      where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 474";
			$data474 = $fwDb->queryOne($sqluid474);

			// Uid 474 ends


			// Uid 312 starts

			$sqluid312 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				      where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 312";
			$data312 = $fwDb->queryOne($sqluid312);

			// Uid 312 ends


			// Uid 301 starts

			$sqluid301 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				      where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 301";
			$data301 = $fwDb->queryOne($sqluid301);

			// Uid 301 ends

			// Uid 330 starts

			$sqluid330 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				      where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 330";
			$data330 = $fwDb->queryOne($sqluid330);

			// Uid 330 ends


			// Uid 369 starts

			$sqluid369 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				      where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 369";
			$data369 = $fwDb->queryOne($sqluid369);

			// Uid 369 ends


			// Uid 340 starts

			$sqluid340 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				      where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 340";
			$data340 = $fwDb->queryOne($sqluid340);

			// Uid 340 ends

			// Uid 44 planning assessment report

			$sql44 = "Select document_check_list.doc_file_name, document_check_list.doc_date_uploaded from document_check_list
			          where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
			$data44 = $fwDb->queryOne($sql44);

			// Uid 44 ends


			// Uid 412 Third Party Design

			$sql412 = "Select document_check_list.doc_file_name from document_check_list
			          where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 412";
			$data412 = $fwDb->queryOne($sql412);

			// Uid 412 ends

			// Phone follow ups

			$sfu = "Select count(*) as tot from  sales_followup where sf_pid = " . $v['bsn_id'];
			$sfData = $fwDb->queryOne($sfu);


			// Last follow up date

			$lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = " . $v['bsn_id'];
			$lfdData = $fwDb->queryOne($lfd);
			// Last follow up date ends


			// Uid 45 Signed Design Agreement

			$sql45 = "Select document_check_list.doc_file_name from document_check_list
			          where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 45";
			$data45 = $fwDb->queryOne($sql45);

			// Uid 45 ends

			// Uid 2 need analysis survey support

			$sql2 = "Select document_check_list.doc_file_name from document_check_list
			         where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 2";
			$data2 = $fwDb->queryOne($sql2);

			// Uid 2 ends


			// Uid 302 starts

			$sqluid302 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				      where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 302";
			$data302 = $fwDb->queryOne($sqluid302);

			// Uid 302ends


			// Uid  705 Unit Titling Planning Assessment Report

			$sql705 = "Select document_check_list.doc_file_name from document_check_list
			          where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 705";
			$data705 = $fwDb->queryOne($sql705);

			// Uid 705 Ends

			$sqltask = "Select count(*) as totpltasks from  business_tasks
		             where bt_bsn_id = " . $v['bsn_id'] . " AND business_tasks.bt_task_status_id = 2 ";
			$planingtasks = $fwDb->queryOne($sqltask);

			$sqlpldone = "Select count(*) as pltaskcomp from  business_tasks
		 where bt_bsn_id = " . $v['bsn_id'] . " AND business_tasks.bt_task_status_id = 2 AND business_tasks.bt_complete = 1";

			$taskpldone = $fwDb->queryOne($sqlpldone);

			if (!count($taskpldone) > 0) {
				$taskpldone['pltaskcomp'] = 0;
			}

			//$setdata2[$k]['bs_business_id'] = $v['bs_business_id'];
			//$setdata2[$k]['bsn_id'] = $v['bsn_id'];
			//$setdata2[$k]['bsn_address'] = $v['bsn_address'];

			$setdata2[$k]['bs_paqr_alertoption_at'] = '';
			if(strtotime($v['bs_paqr_alertoption_at']) > 0) {
				$setdata2[$k]['bs_paqr_alertoption_at'] = date('d-M-Y', strtotime($v['bs_paqr_alertoption_at']));
			}

			$setdata2[$k]['bs_paqr_alertoption_by'] = '';
			if($v['bs_paqr_alertoption_by']) {
				$setdata2[$k]['bs_paqr_alertoption_by'] = $users[$v['bs_paqr_alertoption_by']];
			}

			$setdata2[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['project_link'] = $project_link;
			$setdata2[$k]['status'] = $v['bsn_sub_status'];
			$setdata2[$k]['dayscount'] = $dayscount;
			$setdata2[$k]['budget'] = $v['bsn_advert_text'];

			$setdata2[$k]['project_type'] = $v['bsn_type'];
			//$setdata2[$k]['bsn_proj_cust_type'] = $v['bsn_proj_cust_type'];
			//$setdata2[$k]['bsn_rating'] = $v['bsn_rating'];
			//$setdata2[$k]['meet'] = $v['bsn_sales_pathway'];
			$setdata2[$k]['watch'] = $v['bsn_watch_list'];
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
			$setdata2[$k]['checklist44_date'] = changedate_d_m_y($data44['doc_date_uploaded']);
			$setdata2[$k]['checklist412'] = $data412['doc_file_name'];
			$setdata2[$k]['salesfolloup'] = $sfData['tot'];
			$setdata2[$k]['lastfoldt'] = $lfdData['last_followup_date'];
			$setdata2[$k]['checklist45'] = $data45['doc_file_name'];
			$setdata2[$k]['checklist2'] = $data2['doc_file_name'];



			$property_report = $document_check_list[$v['bsn_id']][481]['doc_file_name'] ?? '';
			if($property_report) {
				$property_report = '<a href="/planning_assesment_quickreport.download_view_content?file_name=' . $property_report . '&module_name=planning_assesment_quickreport.home" target="_blank">Download</a>';
			}
			$setdata2[$k]['property_report'] = $property_report;


			if ($data302['bt_complete'] == 1) {
				$setdata2[$k]['boxsent'] = $data302['bt_completed_date'];
			}


			//$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
			//$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];

			//$setdata2[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
			//$setdata2[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
			//$setdata2[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
			//$setdata2[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
			//$setdata2[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
			$setdata2[$k]['total_pl_task'] = $planingtasks['totpltasks'];
			$setdata2[$k]['task_pl_done'] = $taskpldone['pltaskcomp'];


			$setdata2[$k]['checklist705'] = $data705['doc_file_name'];
		}

		$fwViewData['list'] =  $setdata2;
	}
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Planning Assessment Quick Report";

$submitdownload = $fwRequest->getParam('download', '');
if ($submitdownload) {
	$pdfData = $fwRequest->getParam('pdf', '');

	if ($pdfData) {
		$data = '(';
		foreach ($pdfData as $k1 => $v1) {
			$data .= $k1 . ",";
		}
		$data .= "0)";
	}

	$html = '';

	$sqlP = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name, 
		business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address 
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id "
		. $where . " And business.bsn_id IN " . $data . " Order By business.bsn_status_sys_date DESC";


	if ($sqlP) {
		$userDataP = $fwDb->query($sqlP);
	}

	foreach ($userDataP as $k => $v) {

		$link = "http://www.deckquotes.com.au/business.detail/bsn_id/" . $v['bsn_id'];


		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);


		echo "<br>::" . $sqluid555 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 555";
		$data555 = $fwDb->queryOne($sqluid555);


		$sqluid474 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 474";
		$data474 = $fwDb->queryOne($sqluid474);

		$sqluid312 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 312";
		$data312 = $fwDb->queryOne($sqluid312);

		$sqluid301 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 301";
		$data301 = $fwDb->queryOne($sqluid301);

		$sqluid330 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 330";
		$data330 = $fwDb->queryOne($sqluid330);

		$sqluid369 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 369";
		$data369 = $fwDb->queryOne($sqluid369);

		$sqluid340 = "Select business_tasks.* from business_tasks
				              where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 340";
		$data340 = $fwDb->queryOne($sqluid340);

		$sql44 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
		$data44 = $fwDb->queryOne($sql44);


		$sfu = "Select count(*) as tot from  sales_followup where sf_pid = " . $v['bsn_id'];
		$sfData = $fwDb->queryOne($sfu);


		$lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = " . $v['bsn_id'];
		$lfdData = $fwDb->queryOne($lfd);


		$sql45 = "Select document_check_list.doc_file_name from document_check_list
						  where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 45";
		$data45 = $fwDb->queryOne($sql45);


		$sql2 = "Select document_check_list.doc_file_name from document_check_list
						 where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 2";
		$data2 = $fwDb->queryOne($sql2);


		$sqluid302 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				              where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 302";
		$data302 = $fwDb->queryOne($sqluid302);


		$setdataP[$k]['bsn_id'] = $v['bsn_id'];
		$setdataP[$k]['bsn_address'] = $v['bsn_address'];
		$setdataP[$k]['hia_sign_date'] = changedate_d_m_y($ccdate);
		$setdataP[$k]['link'] = $link;
		$setdataP[$k]['status'] = $v['bsn_sub_status'];
		$setdataP[$k]['dayscount'] = $dayscount;
		$setdataP[$k]['budget'] = $v['bsn_advert_text'];
		$setdataP[$k]['uid555complete'] = $data555['bt_complete'];
		$setdataP[$k]['uid555'] = $data555['bt_completed_date'];
		$setdataP[$k]['uid474complete'] = $data474['bt_complete'];
		$setdataP[$k]['uid474'] = $data474['bt_completed_date'];
		$setdataP[$k]['uid312complete'] = $data312['bt_complete'];
		$setdataP[$k]['uid312'] = $data312['bt_completed_date'];
		$setdataP[$k]['uid301complete'] = $data301['bt_complete'];
		$setdataP[$k]['uid301'] = $data301['bt_completed_date'];
		$setdataP[$k]['uid330complete'] = $data330['bt_complete'];
		$setdataP[$k]['uid330'] = $data330['bt_completed_date'];
		$setdataP[$k]['uid369complete'] = $data369['bt_complete'];
		$setdataP[$k]['uid369'] = $data369['bt_completed_date'];
		$setdataP[$k]['uid340complete'] = $data340['bt_complete'];
		$setdataP[$k]['uid340'] = $data340['bt_completed_date'];
		$setdataP[$k]['checklist44'] = $data44['doc_file_name'];
		$setdataP[$k]['salesfolloup'] = $sfData['tot'];
		$setdataP[$k]['lastfoldt'] = $lfdData['last_followup_date'];
		$setdataP[$k]['checklist45'] = $data45['doc_file_name'];
		$setdataP[$k]['checklist2'] = $data2['doc_file_name'];

		if ($data302['bt_complete'] == 1) {
			$setdataP[$k]['boxsent'] = $data302['bt_completed_date'];
		}


		$setdataP[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdataP[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdataP[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdataP[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
		$setdataP[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdataP[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdataP[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
	}

	foreach ($setdataP as $key => $row) {
		// replace 0 with the field's index/key
		$dates[$key]  = $row['dayscount'];
	}
	array_multisort($dates, SORT_ASC, $setdataP);


	$html = '';
	$html .= '<table class="first" cellpadding="5" border="1" style="border:1px solid #CCC">';
	$html .= "<tr>";
	$html .= "<th>Address</th><th>Customer</th> <th witdh='20'>Status </th><th>Day Count</th><th>Budget</th><th>Phone Follow Ups</th>
	          <th>Last Followup Date</th>";
	$html .= "<th>Box Sent</th>";

	$html .= "</tr>";

	foreach ($setdataP as $k => $v) {


		$html .= "<tr>";
		$html .= "<td>" . $v['bsn_address'] . "</td>";
		$html .= "<td>" . $v['bcust_fname'] . " " . $v['bcust_lname'] . "<br>" . $v['bcust_misc_moble'] . "</td>";
		$html .= "<td>" .  $v['status'] . "</td>";
		$html .= "<td>" .  $v['dayscount'] . "</td>";
		$html .= "<td>" .  $v['budget'] . "</td>";
		$html .= "<td>" .  $v['salesfolloup'] . "</td>";
		$html .= "<td>" .  $v['lastfoldt'] . "</td>";
		$html .= "<td>" .  changedate_d_m_y($v['boxsent']) . "</td>";

		$html .= "</tr>";
	}
	$html .= "</table>";

	$heading = "Planning Assesment Quick Report";

	$fname = "";

	create_quick_report($heading, $html, $fname);
}

$sqlpsc = "select * from process_street_checklist";
$fwViewData['pro_street_checklist'] = $fwDb->query($sqlpsc);

$export = $fwRequest->getParam('export', 0);

if ($export > 0) {
	$contactsql = "SELECT * FROM contact_list";

	if ($contactsql) {
		$contactData = $fwDb->query($contactsql);
	}

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Test Document")
		->setSubject("Office 2007 XLSX Test Document")
		->setDescription("Contact list exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Contact list file");

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

	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'SrNo')
		->setCellValue('B1', 'Address')
		->setCellValue('C1', 'Status')
		->setCellValue('D1', 'Day Count')
		->setCellValue('E1', 'Budget')
		->setCellValue('F1', 'Project Type')
		->setCellValue('G1', 'Project Customer Type')
		->setCellValue('H1', 'Star Rating')
		->setCellValue('I1', 'Phone Follow Ups')
		->setCellValue('J1', 'Last Followup Date')
		->setCellValue('K1', 'Box Sent')


	;

	$from = "A1"; // or any value
	$to = "N1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	// Miscellaneous glyphs, UTF-8
	//$objPHPExcel->setActiveSheetIndex(0)
	//            ->setCellValue('A4', 'Miscellaneous glyphs')
	//            ->setCellValue('A5', 'éàèùâêîôûëïüÿäöüç');
	$row = 2;
	$sr = 1;
	foreach ($setdata2 as $k => $v) {
		if ($v['project_type'] == 15) {
			$pt = "Customer Granny Flat";
		} elseif ($v['project_type'] == 17) {
			$pt = " Fixed Price Extentension";
		} elseif ($v['project_type'] == 19) {
			$pt = "Canberra Custom Homes";
		}

		if ($v['bsn_proj_cust_type'] == 2) {
			$pct = "Real Estate Buyer";
		} elseif ($v['bsn_proj_cust_type'] == 3) {
			$pct = "Real Estate Agent";
		} elseif ($v['bsn_proj_cust_type'] == 4) {
			$pct = "Financial Advisor";
		} elseif ($v['bsn_proj_cust_type'] == 5) {
			$pct = "Undetermined";
		} elseif ($v['bsn_proj_cust_type'] == 6) {
			$pct = "Standard Customer";
		}




		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $sr)
			->setCellValue('B' . $row, $v['bsn_address'])
			->setCellValue('C' . $row, $v['status'])
			->setCellValue('D' . $row, $v['dayscount'])
			->setCellValue('E' . $row, $v['budget'])
			->setCellValue('F' . $row, $pt)
			->setCellValue('G' . $row, $pct)
			->setCellValue('H' . $row, $v['bsn_rating'])
			->setCellValue('I' . $row, $v['salesfolloup'])
			->setCellValue('J' . $row, $v['lastfoldt'])
			->setCellValue('K' . $row, changedate_d_m_y($v['boxsent']))


		;
		$row = $row + 1;
		$sr = $sr + 1;
	}

	$objPHPExcel->getActiveSheet()->setTitle('Contact List');
	$objPHPExcel->setActiveSheetIndex(0);

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="contact_list.xls"');
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

// 14 Day Report Starts
$day14 = $fwRequest->getParam('day14', '');
if (!empty($day14)) {
	$cdt = date('Y-m-d');
	$dt = date('Y-m-d', strtotime($cdt . ' - 14  days'));

	$sql14 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
	bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name, business.bsn_type,
	business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address , business.bsn_rating, business.bsn_watch_list,
	 business.bsn_proj_cust_type ,  business_sellers.bs_qr_delivery_method	
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . "
	AND business.bsn_status_sys_date >= '" . $dt . "' Order By business.bsn_status_sys_date DESC";


	$Data14 = $fwDb->query($sql14);

	$html = '';
	$html .= '<table class="first" cellpadding="5" border="1" style="border:1px solid #CCC">';
	$html .= "<tr>";
	$html .= '<th width="300">Address</th><th width="80">Status </th><th width="80">Day Count</th>
	          <th width="160">Budget</th><th>Delivery Method</th>
	          <th>PAR</th><th width="50">Phone</th>';
	$html .= "</tr>";

	$heading = "14 Days Lead Report";
	$fname = "";

	foreach ($Data14 as $k => $v) {
		$ccdate = $v['bsn_status_sys_date'];
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);

		$sqluid206 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
			      where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 206";
		$data206 = $fwDb->queryOne($sqluid206);

		$sfu = "Select count(*) as tot from  sales_followup where sf_pid = " . $v['bsn_id'];
		$sfData = $fwDb->queryOne($sfu);

		$html .= '<tr nobr="true">';
		$html .= "<td>" . $v['bsn_address'] . "</td>";
		$html .= "<td>" .  $v['bsn_sub_status'] . "</td>";
		$html .= "<td>" .  $dayscount . "</td>";
		$html .= "<td>" .  $v['bsn_advert_text'] . "</td>";
		$html .= "<td>" .  $v['bs_qr_delivery_method'] . "</td>";
		if ($data206['bt_complete'] == 1) {
			$html .= "<td>" .  $data206['bt_completed_date'] . "</td>";
		} else {
			$html .= '<td style="background-color:#F00"></td>';
		}

		$html .= "<td>" . $sfData['tot'] . "</td>";

		$html .= "</tr>";
	}

	$html .= "</table>";

	create_quick_report($heading, $html, $fname);
}

// 14 Day Report Ends

$sqlAlert = "Select * from paqr_alert_admin";
$fwViewData['alertdata'] = $fwDb->query($sqlAlert);

$sqlType = "Select * from project_type";
$fwViewData['typedata'] = $fwDb->query($sqlType);

//PAR Booked
/* $parbooked_weekly = "SELECT COUNT(*) FROM business_tasks as bt 
INNER JOIN busness_status_task as bst ON bt.bt_task_id = bst.bst_task_id
WHERE (bst.bst_task_id = 661 or bst.bst_id = 661) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= CURDATE() - INTERVAL 6 DAY"; */
$parbooked_weekly = "SELECT COUNT(DISTINCT bt.bt_bsn_id) as weekly_total FROM business_tasks as bt INNER JOIN busness_status as bs ON bt.bt_task_status_id = bs.st_id INNER JOIN busness_status_task as bst ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0 LEFT JOIN business_status_task_orders as bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id LEFT JOIN users as u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template as et ON bt.bt_task_id = et.et_task AND et.et_status = 1 LEFT JOIN positions as pos ON bst.bst_posid = pos.p_id WHERE (bst.bst_task_id = 661 or bst.bst_id = 661) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= CURDATE() - INTERVAL 6 DAY ";
$parbooked_data_weekly = $fwDb->queryOne($parbooked_weekly);
$fwViewData['parbooked_data_weekly'] = $parbooked_data_weekly;

/* $parbooked_ytd = "SELECT COUNT(*) FROM business_tasks as bt INNER JOIN busness_status_task as bst ON bt.bt_task_id = bst.bst_task_id WHERE (bst.bst_task_id = 661 or bst.bst_id = 661) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') ) "; */
$parbooked_ytd = "SELECT COUNT(DISTINCT bt.bt_bsn_id) AS ytd_total FROM business_tasks AS bt INNER JOIN busness_status AS bs ON bt.bt_task_status_id = bs.st_id INNER JOIN busness_status_task AS bst ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0 LEFT JOIN business_status_task_orders AS bsto ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id LEFT JOIN users AS u ON bt.bt_completed_by = u.user_id LEFT JOIN email_template AS et ON bt.bt_task_id = et.et_task AND et.et_status = 1 LEFT JOIN positions AS pos ON bst.bst_posid = pos.p_id WHERE (bst.bst_task_id = 661 OR bst.bst_id = 661) AND bt.bt_completed_date IS NOT NULL AND bt.bt_completed_date >= IF( MONTH(CURDATE()) >= 7, DATE_FORMAT(CURDATE(), '%Y-07-01'), DATE_FORMAT(CURDATE() - INTERVAL 1 YEAR, '%Y-07-01') )";
$parbooked_data_ytd = $fwDb->queryOne($parbooked_ytd);
$fwViewData['parbooked_data_ytd'] = $parbooked_data_ytd;
