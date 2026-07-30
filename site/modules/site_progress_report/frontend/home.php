<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$print_merge = $fwRequest->getParam('print_merge', '');
$sp_bsn_id = $fwRequest->getParam('sp_bsn_id', 0);
$sp_task_id = $fwRequest->getParam('sp_task_id', 0);
if ($print_merge != '' && $sp_bsn_id > 0 && $sp_task_id > 0) {
	$heading = $MODULE_SINGULAR;

	$query = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_id = $sp_bsn_id";
	$result  = $fwDb->queryOne($query);
	$bsn_name = $result['bsn_name'];

	$query = "SELECT * FROM site_progress_report_task WHERE tn_id = $sp_task_id";
	$result = $fwDb->queryOne($query);
	$tn_name = $result['tn_name'];

	$sql = "SELECT * FROM $TABLE WHERE sp_bsn_id = $sp_bsn_id AND sp_task_name = $sp_task_id ORDER BY sp_id DESC";
	$list = $fwDb->query($sql);
	$spIDs = [];
	foreach($list as $row) {
		$spIDs[] = $row['sp_id'];
	}

	$query = 'SELECT * FROM site_progress_report_attachments WHERE spra_sp_id IN (' . implode(',', $spIDs) . ')';
	$result = $fwDb->query($query);
	$site_progress_report_attachments = [];
	foreach($result as $row) {
		if(!isset($site_progress_report_attachments[$row['spra_sp_id']])) {
			$site_progress_report_attachments[$row['spra_sp_id']] = [];
		}
		$site_progress_report_attachments[$row['spra_sp_id']][] = $row;
	}
	
	$html = '';
	$last_key = end(array_keys($list));

	set_time_limit(0);
	// ini_set('memory_limit', '2048M');
	require_once(LIB_DIR . 'CloudEphpClass.php');
	foreach ($list as $index1 => $row) {
		$second_last_key = end(array_keys($site_progress_report_attachments[$row['sp_id']]));
		foreach($site_progress_report_attachments[$row['sp_id']] as $index2 => $record) {
			$html .= '
				<p style="text-align: center;">Project Address: ' . $bsn_name . '</p>
				<p style="text-align: center;">Task Name: ' . $tn_name . '</p>
			';
			$obj = new CloudEphpClass($BASEFOLDER . '.home');
			$url = $obj->download($record['spra_attachment'], false);

			$html .= '<table border="1" width="98%" cellpadding="7">
				<tr style="background-color:#FF0; text-align:center">
					<th>Attachment</th>
				</tr>
				<tr>
					<td><img src="' . str_replace(' ', '%20', $url) . '" style="height: 300px;"></td>
				</tr>
				<tr style="background-color:#FF0; text-align:center">
					<th>Comment</th>
				</tr>
				<tr>
					<td>' . $record['spra_comment'] . '</td>
				</tr>
			</table>';

			if ($index1 <> $last_key || $index2 <> $second_last_key) {
				$html .= '<br pagebreak="true" />';
			}
		}
	}
	

	$fileName = 'site_progress_report_attachments';
	generatePDF($heading, $html, $fileName);
}

$where = " WHERE 1 = 1";
// $ord = " ORDER BY $ID DESC";
$ord = " ORDER BY sp_id DESC";
// $ord =  " ORDER BY IF(sp_date='' OR sp_date IS NULL, 1, 0), STR_TO_DATE(sp_date, '%d-%m-%Y') DESC";

$hidden = $fwRequest->getParam('hidden', '');
if (!empty($hidden)) {
	$where = " WHERE 1 = 1";
}

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($_SESSION['address']);
	unset($_SESSION['sp_task_name']);
	unset($_SESSION['position']);
	unset($_SESSION['due_date']);
	$where = " where 1 = 1";
}

$address = $fwRequest->getParam('address', '');
if ($address):
	$where .= " AND site_progress_report.sp_project LIKE '%" . $address . "%'";
	$_SESSION['address'] = $address;
	$fwViewData['address'] = $_SESSION['address'];
elseif ($_SESSION['address']):
	$where .= " AND site_progress_report.sp_project LIKE '%" . $_SESSION['address'] . "%' ";
	$fwViewData['address'] = $_SESSION['address'];
endif;

$sp_task_name = $fwRequest->getParam('sp_task_name', '');
if ($sp_task_name):
	$where .= " AND site_progress_report.sp_task_name = $sp_task_name";
	$_SESSION['sp_task_name'] = $sp_task_name;
	$fwViewData['sp_task_name'] = $_SESSION['sp_task_name'];
elseif ($_SESSION['sp_task_name']):
	$where .= " AND site_progress_report.sp_task_name = " . $_SESSION['sp_task_name'] . "";
	$fwViewData['sp_task_name'] = $_SESSION['sp_task_name'];
endif;

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;

$sql_companies = "SELECT DISTINCT co_categry, co_id FROM companies where co_categry is not null and co_categry != '' ";
$fwViewData['data_companies'] = $data_companies = $fwDb->query($sql_companies);
$categoryArr = [];
foreach ($data_companies as $cat) {
    $categoryArr[$cat['co_id']] = $cat['co_categry'];
}

//$sql_con_positions = "Select distinct cs_position, cs_id from contacts where cs_position IS NOT NULL AND cs_position != '' ";
$sql_con_positions = "SELECT * FROM contacts_position";
$fwViewData['data_con_positions'] = $data_con_positions = $fwDb->query($sql_con_positions);
$positionArr = [];
foreach ($data_con_positions as $pos) {
    //$positionArr[$pos['cs_id']] = $pos['cs_position'];
	$positionArr[$pos['cp_id']] = $pos['cp_name'];
}

$query = "SELECT * FROM site_progress_report_task";
$result = $fwDb->query($query);
$fwViewData['cdetail'] = $result;
$site_progress_report_task = [];
foreach($result as $row) {
	$site_progress_report_task[$row['tn_id']] = [
        'name' => $row['tn_name'],
        'category_id' => $row['tn_category'],
        'position_id' => $row['tn_position']
    ];;
}
$fwViewData['site_progress_report_task'] = $site_progress_report_task;

$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . ' ' . $where . ' GROUP BY sp_bsn_id, sp_task_name' . $ord;

if ($matsql) {
	$userData = $fwDb->query($matsql);
}

$fwViewData['total'] = sizeof($userData);
$listsnew = [];
if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
	$page_rows = 200;
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
	}
}

foreach ($listsnew as $index => $list):
	$listsnew[$index]['link'] = BASE_URL . 'business.detail/bsn_id/' . $list['sp_bsn_id'];
	$listsnew[$index]['sp_project'] = $projectArr[$list['sp_bsn_id']];
	$listsnew[$index]['sp_task_id'] = $list['sp_task_name'];
	
	$taskId = $list['sp_task_name'];
	// Task Name
    $listsnew[$index]['sp_task_name'] = $site_progress_report_task[$taskId]['name'] ?? '';

    // Category Name (companies)
    $catId = $site_progress_report_task[$taskId]['category_id'] ?? '';
    $listsnew[$index]['tn_category'] = $categoryArr[$catId] ?? '';

    // Position Name (contacts)
    $posId = $site_progress_report_task[$taskId]['position_id'] ?? '';
    $listsnew[$index]['tn_position'] = $positionArr[$posId] ?? '';
	
	//$listsnew[$index]['sp_task_name'] = $site_progress_report_task[$list['sp_task_name']];
endforeach;

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

