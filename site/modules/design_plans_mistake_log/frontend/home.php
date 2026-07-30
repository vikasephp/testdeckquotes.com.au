<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$save_dpml_example_evidence = $fwRequest->getParam('save_dpml_example_evidence', '');
if ($save_dpml_example_evidence && $_FILES['dpml_example_evidence']['name']) {
	$this_id = (int)$fwRequest->getParam($ID, 0);

	$docfile_1 = $_FILES['dpml_example_evidence']['name'];
	$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
	$temp_name_1 = $_FILES['dpml_example_evidence']['tmp_name'];
	$detail['dpml_example_evidence'] = $docfile_1;
	$fileUploaded = upload($docfile_1, $temp_name_1);
	// $detail['dpml_example_evidence_date'] = date('Y-m-d H:i:s');
	$table = new Fw_Db_Table($TABLE);
	$table->setWhere("$ID = $this_id");
	if ($table->rowExists()) {
		$detail = $table->updateRow($detail);
	}
}

$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	unset($_SESSION['show_hidden']);
	unset($_SESSION['search_designer']);
	unset($_SESSION['search_architect']);
	unset($_SESSION['search_project']);
	unset($_SESSION['search_type']);
	unset($fwViewData['search_designer']);
	unset($fwViewData['search_architect']);
	unset($fwViewData['search_project']);
	unset($fwViewData['search_type']);
	unset($fwViewData['search_plans']);
	$where = " WHERE $HIDE_COL = 0";
}

$show_hidden = $fwRequest->getParam('show_hidden', '');
if (!empty($show_hidden) || $_SESSION['show_hidden']) {
	$_SESSION['show_hidden'] =  $show_hidden;
	$where = " WHERE $HIDE_COL = 1";
}
else{
	$where = " WHERE $HIDE_COL = 0";
}

$search_designer = $fwRequest->getParam('search_designer', '');
if ($search_designer):
	$where .= " AND dpml_designer LIKE '%" . $search_designer . "%'";
	$_SESSION['search_designer'] = $search_designer;
	$fwViewData['search_designer'] = $_SESSION['search_designer'];
elseif ($_SESSION['search_designer']):
	$where .= " AND dpml_designer LIKE '%" . $_SESSION['search_designer'] . "%' ";
	$fwViewData['search_designer'] = $_SESSION['search_designer'];
endif;

$search_architect = $fwRequest->getParam('search_architect', '');
if ($search_architect):
	$where .= " AND dpml_architect_responsible LIKE '%" . $search_architect . "%'";
	$_SESSION['search_architect'] = $search_architect;
	$fwViewData['search_architect'] = $_SESSION['search_architect'];
elseif ($_SESSION['search_architect']):
	$where .= " AND dpml_architect_responsible LIKE '%" . $_SESSION['search_architect'] . "%'";
	$fwViewData['search_architect'] = $_SESSION['search_architect'];
endif;

$search_project = $fwRequest->getParam('search_project', '');
if ($search_project):
	$sql = 'SELECT bsn_id, bsn_name, bsn_address from business where bsn_sub_status = "Open" AND bsn_name = "' . $search_project . '"';
    $res = $fwDb->queryOne($sql);
	$where .= " AND dpml_bsn_id = " . $res['bsn_id'] . "";
	$_SESSION['search_project'] = $search_project;
	$fwViewData['search_project'] = $_SESSION['search_project'];
elseif ($_SESSION['search_project']):
	$sql = 'SELECT bsn_id, bsn_name, bsn_address from business where bsn_sub_status = "Open" AND bsn_name = "' . $_SESSION['search_project'] . '"';
    $res = $fwDb->queryOne($sql);
	$where .= " AND dpml_bsn_id = " . $res['bsn_id'] . "";
	$fwViewData['search_project'] = $_SESSION['search_project'];
endif;

$search_type = $fwRequest->getParam('search_type', '');
if ($search_type != ''):
	$where .= " AND dpml_type_id = " . $search_type . "";
	$_SESSION['search_type'] = $search_type;
	$fwViewData['search_type'] = $_SESSION['search_type'];
elseif ($_SESSION['search_type'] != ''):
	$where .= " AND dpml_type_id = " . $_SESSION['search_type'] . "";
	$fwViewData['search_type'] = $_SESSION['search_type'];
endif;

$search_plans = $fwRequest->getParam('search_plans', '');
if ($search_plans > 0):
	$where .= " AND dpml_plan = " . $search_plans . "";
	$_SESSION['search_plans'] = $search_plans;

elseif ($_SESSION['search_plans'] != ''):
	$where .= " AND dpml_plan = " . $_SESSION['search_plans'] . "";
	
endif;


$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	unset($_SESSION['show_hidden']);
	unset($_SESSION['search_designer']);
	unset($_SESSION['search_architect']);
	unset($_SESSION['search_project']);
	unset($_SESSION['search_type']);
	unset($fwViewData['search_designer']);
	unset($fwViewData['search_architect']);
	unset($fwViewData['search_project']);
	unset($fwViewData['search_type']);
	unset($fwViewData['search_plans']);
	$where = " WHERE $HIDE_COL = 0";
	
}

$ord = ' ORDER BY dpml_created_at DESC';

$sql = "SELECT u.user_name FROM users u, groups g, users_groups ug WHERE u.user_id = ug.user_id AND ug.group_id = g.group_id AND g.group_id != 2 AND u.user_id != 1 ORDER By g.group_id ASC, u.user_name ASC";


$userData = $fwDb->query($sql);
$fwViewData['userData'] = $userData;

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_sub_status = 'Open'";
$projdetail  = $fwDb->query($sql);
$fwViewData['projdetail'] = $projdetail;
$projectArr = [];
foreach($projdetail as $project){
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;

// $sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id";
// $custdetail  = $fwDb->query($sql);
// $clientArr = [];
// foreach($custdetail as $cust){
// 	$clientArr[$cust['bs_business_id']] = $cust['bcust_fname'] . ' ' . $cust['bcust_lname'];
// }
// $fwViewData['clientArr'] = $clientArr;

$matsql = "SELECT $TABLE.* FROM $TABLE $where $ord";


$resultData = $fwDb->query($matsql);

if (!empty($resultData)) {
    if (!(isset($pagenum))) {
        $pagenum = 1;
    }
    $rows = count($resultData);
	$page_rows = 300;
	$last = ceil($rows / $page_rows);
	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
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

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);

		foreach ($lists as $list):
			$list['link'] =  $BASE_URL . "business.detail/bsn_id/" . $list['ldd_bsn_id'];
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
	}
}

$thisTable = new Fw_Db_Table($ATTRIBUTES[0]['table']);
$fwViewData['typedata'] = $typedata = $thisTable->getAllRows();

$sql = "SELECT DPML.dpml_type_id, DPMLT.dpmlt_option, COUNT(*) AS total FROM `design_plans_mistake_log` AS DPML INNER JOIN design_plans_mistake_log_type AS DPMLT ON DPMLT.dpmlt_id = DPML.dpml_type_id GROUP BY DPML.dpml_type_id, DPMLT.dpmlt_option;";
$fwViewData['record_type'] = $fwDb->query($sql);

$sql = "SELECT COUNT(*) AS total from `design_plans_mistake_log` WHERE dpml_type_id = 0";
$fwViewData['no_type_total'] = $fwDb->query($sql)[0]['total'];

$sql = "SELECT COUNT(*) AS total from `design_plans_mistake_log`";
$fwViewData['total_records'] = $fwDb->query($sql)[0]['total'];


$sqlp = "select * from dp_mistak_log_plan";
$fwViewData['plansData'] = $fwDb->query($sqlp);

$fwViewData['title'] = $MODULE_PLURAL;

// db($fwViewData);
