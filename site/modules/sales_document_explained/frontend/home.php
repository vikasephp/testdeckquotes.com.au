<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('sales_document_explained');

$where = " WHERE 1 = 1";
$order = ' ORDER BY sd_order';

$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . ' ' . $where . $order;

if ($matsql) {
	$userData = $fwDb->query($matsql);
}

$fwViewData['total'] = sizeof($userData);

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

$docNameIDs = [];
foreach ($userData as $row) {
	if ($row['sd_name_id'] > 0) {
		$docNameIDs[] = $row['sd_name_id'];
	}
}
$implodeDocNameIDs = implode(',', $docNameIDs);

foreach ($listsnew as $k => $v) {
}

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;
