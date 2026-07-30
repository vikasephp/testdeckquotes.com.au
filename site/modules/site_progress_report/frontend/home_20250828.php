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

	$query = "SELECT * FROM site_progress_report_task WHERE ";
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
	foreach($result as $row) {
		if(!isset($site_progress_report_attachments[$row['spra_sp_id']])) {
			$site_progress_report_attachments[$row['spra_sp_id']] = [];
		}
		$site_progress_report_attachments[$row['spra_sp_id']][] = $row;
	}
	
	$html = '';
	$last_key = end(array_keys($list));

	// set_time_limit(0);
	// ini_set('memory_limit', '2048M');
	require_once(LIB_DIR . 'CloudEphpClass.php');
	foreach ($list as $index1 => $row) {
		$html .= '
			<p style="text-align: center;">Project Address: ' . $bsn_name . '</p>
			<p style="text-align: center;">Task Name: ' . $tn_name . '</p>
		';
		foreach($site_progress_report_attachments[$row['sp_id']] as $index2 => $record) {
			$html .= '<table border="1" width="98%" cellpadding="7">
		
			</table>';

			if ($index2 <> $last_key) {
				$html .= '<br pagebreak="true" />';
			}
		}
		

    	// $obj = new CloudEphpClass($BASEFOLDER . '.home');
		// $url = $obj->download($postedData['file_name'], false);

		/* $ext1 =  getext($lv["car_image1"]);
		if (!empty($lv["car_image1"]) && $ext1 == true) {
			$img1 = ($lv['car_image1_newdesign'] ? '<img src="' . showUrl($lv['car_image1']) . '" height="150">' : '<img src="https://www.deckquotes.com.au/files/uploads/' . $lv["car_image1"] . '" height="150">');
		} else {
			$img1 = '';
		}

		$ext2 =  getext($lv["car_image2"]);
		if (!empty($lv["car_image2"]) && $ext2 == true) {
			$img2 = ($lv['car_image2_newdesign'] ? '<img src="' . showUrl($lv['car_image2']) . '" height="150">' : '<img src="https://www.deckquotes.com.au/files/uploads/' . $lv["car_image2"] . '" height="150">');
		} else {
			$img2 = '';
		}

		$ext3 =  getext($lv["car_image3"]);
		if (!empty($lv["car_image3"]) && $ext3 == true) {
			$img3 = ($lv['car_image3_newdesign'] ? '<img src="' . showUrl($lv['car_image3']) . '" height="150">' : '<img src="https://www.deckquotes.com.au/files/uploads/' . $lv["car_image3"] . '" height="150">');
		} else {
			$img3 = '';
		}

		$ext4 =  getext($lv["car_image4"]);
		if (!empty($lv["car_image4"]) && $ext4 == true) {
			$img4 = ($lv['car_image4_newdesign'] ? '<img src="' . showUrl($lv['car_image4']) . '" height="150">' : '<img src="https://www.deckquotes.com.au/files/uploads/' . $lv["car_image4"] . '" height="150">');
		} else {
			$img4 = '';
		}

		$ext5 =  getext($lv["car_image5"]);
		if (!empty($lv["car_image5"]) && $ext5 == true) {
			$img5 = ($lv['car_image5_newdesign'] ? '<img src="' . showUrl($lv['car_image5']) . '" height="150">' : '<img src="https://www.deckquotes.com.au/files/uploads/' . $lv["car_image5"] . '" height="150">');
		} else {
			$img5 = '';
		}


		$is = preg_replace("#<a.*?>(.*?)</a>#i", "\1", $lv["car_include_supplier"]);
		$html .= '<tr style="background-color:#FF0; text-align:center;">';
		$html .= '<th  colspan="2">Rec. No. ' . $lv["car_id"] . ' </th>';
		$html .= '</tr>';
		$html .= '<tr><td style="width:35%;">Project</td><td style="width:65%;">' . $lv["car_project"] . '</td></tr>';

		$html .= '<tr><td>Contact Info</td><td>' . $lv["bcust_fname"] . ' ' . $lv["bcust_lname"] . '</td></tr>';

		if (!empty($lv["car_status"])) {
			$html .= '<tr><td>Status</td><td>' . $lv["car_status"] . '</td></tr>';
		}

		if (!empty($lv["car_date"])) {
			$html .= '<tr><td>Date</td><td>' . $lv["car_date"] . '</td></tr>';
		}

		if (!empty($lv["car_new_date"])) {
			$html .= '<tr><td>Due Date</td><td>' . $lv["car_new_date"] . '</td></tr>';
		}

		if (!empty($lv["car_type"])) {
			$html .= '<tr><td>Type</td><td>' . $lv["car_type"] . '</td></tr>';
		}

		if (!empty($lv["urgency"])) {
			$html .= '<tr><td>Urgency</td><td>' . $lv["urgency"] . '</td></tr>';
		}
		if (!empty($lv["rs"])) {
			$html .= '<tr><td>Responsible Staff</td><td>' . $lv["rs"] . '</td></tr>';
		}

		if (!empty($lv["car_alert"])) {
			$html .= '<tr><td>Alert Message</td><td>' . $lv["car_alert"] . '</td></tr>';
		}

		$html .= '<tr>';
		$html .= '<td colspan="2">' . $img1 . '  ' . $img2 . ' ' . $img3 . ' ' . $img4 . ' ' . $img5 . '</td>';
		$html .= '</tr>';
		if ($lk <> $last_key) {

			$html .= '<br pagebreak="true" />';
		} */
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

$query = "SELECT * FROM site_progress_report_task";
$result = $fwDb->query($query);
$fwViewData['cdetail'] = $result;
$site_progress_report_task = [];
foreach($result as $row) {
	$site_progress_report_task[$row['tn_id']] = $row['tn_name'];
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
	$listsnew[$index]['sp_task_name'] = $site_progress_report_task[$list['sp_task_name']];
endforeach;

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;




