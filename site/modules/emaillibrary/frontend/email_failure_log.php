<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$tableEmailLog = new Fw_Db_Table('email_failure_log');

$templateData = $fwRequest->getParam($TABLE, '');
$keyword = (!empty($templateData['keyword'])) ? $templateData['keyword'] : NULL;
$where = "WHERE 1 = 1 ";
$TABLE1 = 'email_failure_log';

if ($keyword):
	$where .= "AND " . $TABLE1 . ".elog_eml_code LIKE '%" . $keyword . "%' ";
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];
elseif ($_SESSION['keyword'] && $pagenum > 0):
	$where .= "AND " . $TABLE1 . ".elog_eml_code LIKE '%" . $_SESSION['keyword'] . "%' ";
	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;

/*Search by Project Name*/
$project_name = $fwRequest->getParam('project_name', '');
if ($project_name):
	$where .= " AND " . $TABLE1 . ".elog_business LIKE '%" . $project_name . "%'  ";
	$_SESSION['project_name'] = $project_name;
	$fwViewData['project_name'] = $_SESSION['project_name'];
elseif ($_SESSION['project_name'] && $pagenum >= 0):
	$where .= " AND " . $TABLE1 . ".elog_business LIKE '%" . $_SESSION['project_name'] . "%'   ";
	$fwViewData['project_name'] = $_SESSION['project_name'];
endif;


if (empty($pagenum)) {
	unset($_SESSION['last_tdsql']);
}
if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$fwViewData['detail'] = $detail;
} elseif (empty($pagenum)) {
	unset($_SESSION['keyword']);
}

$ord = " order by elog_id desc ";

$eid = $fwRequest->getParam('id', '');
if (!empty($eid)) {
	$ord = " Order By elog_id ";
}

$ecode = $fwRequest->getParam('ecode', '');
if (!empty($ecode)) {
	$ord = " Order By elog_eml_code ";
}

$datesent = $fwRequest->getParam('datesent', '');
if (!empty($datesent)) {
	$ord = " Order By elog_date ";
}

$from = $fwRequest->getParam('from', '');
if (!empty($from)) {
	$ord = " Order By elog_from ";
}

$to = $fwRequest->getParam('to', '');
if (!empty($to)) {
	$ord = " Order By elog_to ";
}

$forbusiness = $fwRequest->getParam('forbusiness', '');
if (!empty($forbusiness)) {
	$ord = " Order By elog_business ";
}

$pdocs = $fwRequest->getParam('pdocs', '');
if (!empty($pdocs)) {
	$ord = " Order By elog_doc_attached ";
}

$tdocs = $fwRequest->getParam('tdocs', '');
if (!empty($tdocs)) {
	$ord = " Order By elog_temp_attached ";
}

/*Clear Search*/
$clear = $fwRequest->getParam('clear', '');
if ($clear) {
	unset($_SESSION['project_name']);
	unset($_SESSION['keyword']);
	$fwViewData['keyword'] = '';
	$where = "WHERE 1 = 1 ";
	$ord = " order by elog_id desc ";
}

if ($_SESSION['last_tdsql']) {
	$tdsql = $_SESSION['last_tdsql'];
} else {
	$tdsql = "SELECT SQL_CALC_FOUND_ROWS null as row_name, email_failure_log.* FROM email_failure_log " . $where;
	$tdsql .= $ord;
}

//$records_data = $fwDb->query($_SESSION['last_tdsql']); 
$total_records = 0;
if ($tdsql) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	if ($pagenum <= 1) {
		$pagenum = 1;
	}

	$query_count = $fwDb->query("SELECT COUNT('elog_eml_code') as total_records FROM email_failure_log " . $where);
	if (!empty($query_count)) {
		$total_records = $query_count[0]['total_records'];
	}
	$page_rows = 50;

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$tdsql2 =  $tdsql . " " . $max;

	if ($tdsql2) {
		$setdata = $fwDb->query($tdsql2);
	}

	$rows = $total_records;
}



if (!empty($setdata)) {

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

}


foreach ($setdata as $k => $v) {
	$d1 = explode(",", $v['elog_doc_attached']);
	$elog_to = json_decode($setdata[$k]['elog_to'], true);
	if (is_array($elog_to)) {
		$total = count($elog_to);
		$setdata[$k]['elog_to'] = '';
		for ($i = 0; $i < $total; $i++) {
			$setdata[$k]['elog_to'] .= $elog_to[$i]['name'] . ' - ' . $elog_to[$i]['email'];
			if ($i < $total) {
				$setdata[$k]['elog_to'] .= '<br>';
			}
		}
	}
	$elog_cc = json_decode($setdata[$k]['elog_cc'], true);
	if (is_array($elog_cc)) {
		$total = count($elog_cc);
		$setdata[$k]['elog_cc'] = '';
		for ($i = 0; $i < $total; $i++) {
			$setdata[$k]['elog_cc'] .= $elog_cc[$i]['name'] . ' - ' . $elog_cc[$i]['email'];
			if ($i < $total) {
				$setdata[$k]['elog_cc'] .= '<br>';
			}
		}
	}
	foreach ($d1 as $k1 => $v1) {
		$setdata[$k]['elog_doc_attached_new'] .= "<a class='elog_doc_attached_new' href='/emaillibrary.download_content?file_name=" . trim($v1) . "&module_name=emaillibrary.email_failure_log.document_check_list_files' >" . $v1 . "</a><br>";
	}

	$d2 = explode(",", $v['elog_temp_attached']);

	foreach ($d2 as $k2 => $v2) {
		$setdata[$k]['elog_temp_attached_new'] .= "<a class='elog_temp_attached_new' href='" . $BASE_URL . "files/template_documents_hub/" . $v2 . "'target='_blank'>" . $v2 . "</a><br>";
	}

	$setdata[$k]['elog_image_new'] .= "<a class='elog_image_new' href='" . $BASE_URL . "files/email_attachment/" . $v['elog_image'] . "'target='_blank'>" . $v['elog_image'] . "</a><br>";
	$setdata[$k]['elog_attach1_new'] .= "<a class='elog_attach1_new' href='" . $BASE_URL . "files/email_attachment/" . $v['elog_attachment1'] . "'target='_blank'>" . $v['elog_attachment1'] . "</a><br>";
	$setdata[$k]['elog_attach2_new'] .= "<a class='elog_attach2_new' href='" . $BASE_URL . "files/email_attachment/" . $v['elog_attachment2'] . "'target='_blank'>" . $v['elog_attachment2'] . "</a><br>";
	$setdata[$k]['elog_attach3_new'] .= "<a class='elog_attach3_new' href='" . $BASE_URL . "files/email_attachment/" . $v['elog_attachment3'] . "'target='_blank'>" . $v['elog_attachment3'] . "</a><br>";
}

$fwViewData['list'] = $setdata;

//db($fwViewData['list']);

$_SESSION['last_tdsql'] = $tdsql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Email Library";
