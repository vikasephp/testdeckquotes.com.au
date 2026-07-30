<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$where = " WHERE ps_sales_hide = 0";
$ord = '';

$hideRecord = $fwRequest->getParam('hideRecord', '');
if ($hideRecord) {
	$keys_1 = array_keys($hideRecord);
	$ky_1 = $keys_1[0];
	$val_1 = $hideRecord[$ky_1];

	$detailSD['ps_sales_hide'] = $val_1;
	$this_table = new Fw_Db_Table($TABLE);
	$this_table->setWhere("$ID = " . $ky_1);
	if ($this_table->rowExists()) {
		$this_id = $this_table->updateRow($detailSD);
	}
}

$search_stage = $fwRequest->getParam('search_stage', '');
if (!empty($search_stage)) {
	$filter_stage = $fwRequest->getParam('filter_stage', '');
	if (!empty($filter_stage)) {
		$_SESSION['filter_stage'] = $filter_stage;
	}
}

$show_all = $fwRequest->getParam('show_all', '');
if (!empty($show_all)) {
	$_SESSION['show_all'] = $show_all;
}

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	$where = " WHERE ps_sales_hide = 0";
	unset($_SESSION['show_all']);
	unset($_SESSION['filter_stage']);
}

if (isset($_SESSION['show_all'])) {
	$where = " WHERE 1 = 1";
}

if (isset($_SESSION['filter_stage'])) {
	$fwViewData['filter_stage'] = $_SESSION['filter_stage'];
	$where .= ' AND ps_stage = ' . $_SESSION['filter_stage'];
}

$matsql = "SELECT $TABLE.* FROM $TABLE $where $ord";
$resultData = $fwDb->query($matsql);

$bsn_id_array = [];
foreach ($resultData as $row) {
	$bsn_id_array[] = $row['ps_bsn_id'];
}

$query = 'SELECT BS.bs_business_id, BS.bs_customers_id, BC.bcust_fname, BC.bcust_lname FROM business_sellers AS BS INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE BS.bs_business_id IN (' . implode(',', $bsn_id_array) . ')';
$result = $fwDb->query($query);
$customersData = [];
foreach ($result as $row) {
	/* if(!isset($customersData[$row['bs_business_id']])) {
		$customersData[$row['bs_business_id']] = [];
	} */
	$link = '<p style="margin: 0; padding: 0;">
		<a href="/customer.detail/bcust_id/' . $row['bs_customers_id'] . '" target="_blank">' . $row['bcust_fname'] . ' ' . $row['bcust_lname'] . '</a>
	</p>';
	$customersData[$row['bs_business_id']] .= $link;
}

$lists = [];
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
	}
}

$listsnew = [];
foreach ($lists as $list):
	$bsn_id = $list['ps_bsn_id'];
	$project_link = $BASE_URL . "business.detail/bsn_id/" . $bsn_id;
	$list['client_names'] = $customersData[$bsn_id];
	$list['project_address'] = '<a href="' . $project_link . '" target="_blank">' . $businessData[$bsn_id]['bsn_name'] . '</a>';
	if ($list['ps_msteam_folder_link']) {
		$list['ps_msteam_folder_link'] = '<a href="' . $list['ps_msteam_folder_link'] . '" target="_blank">Link</a>';
	}
	if ($list['ps_action_plan']) {
		$list['ps_action_plan'] = '<a href="' . $list['ps_action_plan'] . '" target="_blank">Link</a>';
	}
	if ($list['ps_time_line']) {
		$list['ps_time_line'] = '<a href="' . $list['ps_time_line'] . '" target="_blank">Link</a>';
	}
	if ($list['ps_home_link']) {
		$list['ps_home_link'] = '<a href="' . $list['ps_home_link'] . '" target="_blank">Link</a>';
	}
	if ($list['ps_rea_link']) {
		$list['ps_rea_link'] = '<a href="' . $list['ps_rea_link'] . '" target="_blank">Link</a>';
	}
	if ($list['ps_agent_box_link']) {
		$list['ps_agent_box_link'] = '<a href="' . $list['ps_agent_box_link'] . '" target="_blank">Link</a>';
	}
	if ($list['ps_agency_agreement']) {
		$list['ps_agency_agreement'] = '<a href="' . $list['ps_agency_agreement'] . '" target="_blank">Link</a>';
	}
	if ($list['ps_domains_link']) {
		$list['ps_domains_link'] = '<a href="' . $list['ps_domains_link'] . '" target="_blank">Link</a>';
	}
	$listsnew[] = $list;
endforeach;
$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;
