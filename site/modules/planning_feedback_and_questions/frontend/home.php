<?php

// $table = new Fw_Db_Table($TABLE);
// $table->setWhere('fb_planning_approval = 1');
// $resultData = $table->getAllRows();

$sql = "SELECT FB.*, BUS.bsn_name, BUS.bsn_id, BC.bcust_user_id, BC.bcust_fname, BC.bcust_lname FROM feedback AS FB INNER JOIN business AS BUS ON BUS.bsn_id = FB.fb_bsn_id INNER JOIN bus_customers AS BC ON BC.bcust_user_id = FB.fb_user_id WHERE FB.fb_planning_approval = 1 ORDER BY FB.fb_created_at DESC";
$resultData = $fwDb->query($sql);

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

	$sql2 =  $sql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);

		foreach ($lists as $list):

			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
	}
}

$fwViewData['title'] = $MODULE_PLURAL;
