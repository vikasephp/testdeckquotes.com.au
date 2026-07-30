<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$defaulWhere = " WHERE FIND_IN_SET($DEFAULT_TYPE_ID, ldd_type_id) AND ldd_hide = 0";

$save_ldd_evidence_brief_link = $fwRequest->getParam('save_ldd_evidence_brief_link', '');
if ($save_ldd_evidence_brief_link && !empty($_FILES['ldd_evidence_brief_link']['name']) && $this_id = (int)$fwRequest->getParam($ID, 0)) {
	$file = $_FILES['ldd_evidence_brief_link'];
	$docfile_1 = $file['name'];
	$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
	$temp_name_1 = $file['tmp_name'];
	$fileUploaded = upload($docfile_1, $temp_name_1);
	$record['ldd_evidence_brief_link'] = $docfile_1;
	$this_table = new Fw_Db_Table($TABLE);
	$this_table->setWhere($ID . ' = ' . $this_id);
	$this_table->updateRow($record);
}

$show_hidden = $fwRequest->getParam('show_hidden', '');
if (!empty($show_hidden) || $_SESSION['show_hidden']) {
	$_SESSION['show_hidden'] =  $show_hidden;
	$where = " WHERE FIND_IN_SET($DEFAULT_TYPE_ID, ldd_type_id) AND ldd_hide = 1";
} else {
	$where = $defaulWhere;
}

$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	unset($_SESSION['show_hidden']);
	unset($_SESSION['search_type']);

	unset($fwViewData['search_type']);

	$where = $defaulWhere;
}

$set_ldd_dispute_date = $fwRequest->getParam('set_ldd_dispute_date', '');
if (!empty($set_ldd_dispute_date)) {
	$ldd_dispute_date = $fwRequest->getParam('ldd_dispute_date', '');
	$keys = array_keys($ldd_dispute_date);
	$primaryID = $keys[0];
	$data['ldd_dispute_date'] = date('Y-m-d', strtotime($ldd_dispute_date[$primaryID]));
	// db($primaryID);
	// db($ldd_dispute_date[$primaryID]);
	// db($data);
	// die();
	$mainTable = new Fw_Db_Table($TABLE);
	$mainTable->setWhere($ID . ' = ' . $primaryID);
	$mainTable->updateRow($data);
}

$ord = ' ORDER BY ldd_created_at DESC';

//$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_sub_status = 'Open' or bsn_sub_status = 'Lost' ";
$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
// $fwViewData['projectArr'] = $projectArr;

$sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_id FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id";
$custdetail  = $fwDb->query($sql);
$clientArr = [];
foreach ($custdetail as $cust) {
	$clientArr[$cust['bs_business_id']] = [
		'name' => $cust['bcust_fname'] . ' ' . $cust['bcust_lname'],
		'id' => $cust['bcust_id']
	];
}
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
			$list['project_name'] = $projectArr[$list['ldd_bsn_id']];
			$list['client_link'] = $BASE_URL . "customer.detail/bcust_id/" . $clientArr[$list['ldd_bsn_id']]['id'];
			$list['client_name'] = $clientArr[$list['ldd_bsn_id']]['name'];
			$list['ldd_type_arr'] = explode(',', $list['ldd_type_id']);
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
	}
}

$thisTable = new Fw_Db_Table($ATTRIBUTES['type']['table']);
$fwViewData['typedata'] = $typedata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table($ATTRIBUTES['status']['table']);
$fwViewData['statusdata'] = $statusdata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table($ATTRIBUTES['severity']['table']);
$fwViewData['severitydata'] = $severitydata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table($ATTRIBUTES['manage']['table']);
$fwViewData['managedata'] = $managedata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table($ATTRIBUTES['claim']['table']);
$fwViewData['claimdata'] = $claimdata = $thisTable->getAllRows();

$fwViewData['title'] = $MODULE_PLURAL;
