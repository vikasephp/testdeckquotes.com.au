<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$where = " WHERE lu_planning_approval = 1 AND lu_bsn_id > 0";

$ord = ' ORDER BY lu_id DESC';

$matsql = "SELECT $TABLE.*, BUS.bsn_id, BUS.bsn_name, CUST.bcust_user_id, CUST.bcust_fname, CUST.bcust_lname FROM $TABLE INNER JOIN business BUS ON BUS.bsn_id = $TABLE.lu_bsn_id INNER JOIN bus_customers CUST ON CUST.bcust_user_id = $TABLE.lu_user_id $where $ord";

$resultData = $fwDb->query($matsql);

// db($resultData);

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
            $lu_download_docs = json_decode($list['lu_download_docs']);
			if(count($lu_download_docs)){
				$list['lu_download_docs'] = implode(',<br>', $lu_download_docs);
			}            
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
	}
}

$fwViewData['title'] = $MODULE_PLURAL;
