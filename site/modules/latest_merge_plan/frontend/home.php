<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$listdata = $fwRequest->getParam($TABLE, array());
$keyword = $listdata['keyword'];
$table = new Fw_Db_Table('latest_merge_plan');
$tableMini = new Fw_Db_Table('document_check_list_mini');
$where = " WHERE 1 = 1";

$sync = $fwRequest->getParam('sync', '');
if (!empty($sync)) {
	$lm_id = $fwRequest->getParam('lm_id', '');
	if (!empty($lm_id)) {
		$sql_1 = "SELECT lm_bsn_id, lm_doc_file_name, lm_checklist_number FROM latest_merge_plan WHERE lm_id = " . $lm_id;
		$data1 = $fwDb->queryOne($sql_1);

		$sql_2 = "SELECT dpn_proposal_number FROM document_proposal_name WHERE dpn_unique_id = " . $data1['lm_checklist_number'];
		$data2 = $fwDb->queryOne($sql_2);

		$detail['doc_file_name'] = $data1['lm_doc_file_name'];
		$detail['doc_user_name'] = $_SESSION['user']['user_id'];
		$detail['doc_date_uploaded'] = date('Y-m-d h:i:sa');

		$tableMini->setWhere("doc_bsn_id = " . $data1['lm_bsn_id'] . " AND doc_checklist_number = " . $data2['dpn_proposal_number'] . " AND doc_name_id = 20 ");
		if ($tableMini->rowExists()) {

			$opr = $tableMini->updateRow($detail);
			$usr = $_SESSION['user']['user_name'];

			$sql = "UPDATE latest_merge_plan SET lm_sync_date = '" . date('d-m-Y') . "', lm_sync_user  = '" . $usr . "' WHERE lm_id = " . $lm_id;
			$fwDb->queryOne($sql);
		}
	}
}

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($_SESSION['keyword']);
	$keyword = '';
	// unset($keyword);
}

if (isset($_SESSION['keyword'])) {
	$keyword = $_SESSION['keyword'];
}

$fwViewData['keyword'] = $keyword;

$matsql = 'SELECT CASE WHEN (SELECT MAX(LMP.lm_id) FROM latest_merge_plan AS LMP WHERE LMP.lm_bsn_id = latest_merge_plan.lm_bsn_id AND LMP.lm_checklist_number = latest_merge_plan.lm_checklist_number) = latest_merge_plan.lm_id THEN "Latest" ELSE STR_TO_DATE(latest_merge_plan.lm_doc_date_uploaded, "%d-%m-%Y") END AS latest_date, latest_merge_plan.* FROM latest_merge_plan WHERE lm_bsn_name IS NOT NULL AND lm_bsn_name LIKE "%' . $keyword . '%" ORDER BY latest_date DESC, lm_id DESC;';
$userData = $fwDb->query($matsql);



$listsnew = [];
if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
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

			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
	}
}

$fwDb = new Fw_Db();

$total_count_array = [];
$query = 'SELECT lm_bsn_id, COUNT(*) AS total FROM latest_merge_plan GROUP BY lm_bsn_id;';
$result = $fwDb->query($query);
foreach($result as $row) {
	$total_count_array[$row['lm_bsn_id']] = $row['total'];
}

$total_checklist_array = [];
$query = 'SELECT dpn_bsn_id, COUNT(*) AS total FROM document_proposal_name WHERE dpn_archived = 0 GROUP BY dpn_bsn_id;';
$result = $fwDb->query($query);
foreach($result as $row) {
	$total_checklist_array[$row['dpn_bsn_id']] = $row['total'];
}

$business_data = [];
$business_name_data = [];
$query = "SELECT bsn_id, bsn_name, bsn_address, bsn_status FROM business";
$result = $fwDb->query($query);
foreach($result as $row) {
	$business_data[$row['bsn_id']] = $row;
	$business_name_data[$row['bsn_name']] = $row['bsn_id'];
}

// $query = 'SELECT * FROM latest_merge_plan WHERE lm_bsn_id = 0';
// $result = $fwDb->query($query);
// foreach($result as $row) {
// 	$bsn_id = $business_name_data[$row['lm_bsn_name']];
// 	if($bsn_id > 0) {
// 		$fwDb->queryOne('UPDATE latest_merge_plan SET lm_bsn_id = ' . $bsn_id . ' WHERE lm_id = ' . $row['lm_id']);
// 	}
// }

foreach ($listsnew as $k => $v) {
	$listsnew[$k]['lm_doc_date_uploaded'] = $listsnew[$k]['latest_date'];
	if(strtotime($listsnew[$k]['latest_date'])){
		$listsnew[$k]['lm_doc_date_uploaded'] = date("d-m-Y", strtotime($listsnew[$k]['latest_date']));
	}

	$status_string = "'" . $business_data[$v['lm_bsn_id']]['bsn_status'] . "'";
	$status = '';

	if (strpos($status_string, '|1|') > 0) {
		$status .= "Convert<br>";
	}
	if (strpos($status_string, '|2|') > 0) {
		$status .= "Planning Approvals<br>";
	}
	if (strpos($status_string, '|3|') > 0) {
		$status .= "Construction<br>";
	}
	if (strpos($status_string, '|4|') > 0) {
		$status .= "Complete<br>";
	}
	if (strpos($status_string, '|5|') > 0) {
		$status .= "Inclusions<br>";
	}
	if (strpos($status_string, '|6|') > 0) {
		$status .= "Pre-construction<br>";
	}
	if (strpos($status_string, '|12|') > 0) {
		$status .= "Design Phase<br>";
	}
	if (strpos($status_string, '|15|') > 0) {
		$status .= "Lost";
	}
	$listsnew[$k]['status'] = $status;

	$listsnew[$k]['lm_bsn_name'] = $business_data[$v['lm_bsn_id']]['bsn_name'] ?? '';

	$listsnew[$k]['act_chk'] = $total_checklist_array[$v['lm_bsn_id']];

	$listsnew[$k]['tot_plan'] = $total_count_array[$v['lm_bsn_id']];
}

$fwViewData['list'] = $listsnew;
$fwViewData['total'] = count($listsnew);

$fwViewData['title'] = $MODULE_PLURAL;
