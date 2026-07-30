<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
// $show_hidden = $fwRequest->getParam('show_hidden', '');
// if (!empty($show_hidden) || $_SESSION['show_hidden']) {
// 	$_SESSION['show_hidden'] =  $show_hidden;
// 	$where = " WHERE $HIDE_COL = 1";
// }
// else{
// 	$where = " WHERE $HIDE_COL = 0";
// }

$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	// unset($_SESSION['show_hidden']);
	// $where = " where $HIDE_COL = 0";
}

$ord = ' ORDER BY pca_created_at DESC';

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_sub_status = 'Open'";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach($projdetail as $project){
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;

echo $matsql = "SELECT $TABLE.* FROM $TABLE $where $ord";

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

// $thisTable = new Fw_Db_Table($ATTRIBUTES[0]['table']);
// $fwViewData['typedata'] = $typedata = $thisTable->getAllRows();

$fwViewData['title'] = $MODULE_PLURAL;

// db($fwViewData);
