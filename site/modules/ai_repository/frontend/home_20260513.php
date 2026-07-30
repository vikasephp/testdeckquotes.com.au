<?php

header("Expires: Tue, 01 Jan 2000 00:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

clearstatcache();

$fwViewData['ran'] =  rand(100000, 999999);

$pagenum = $fwRequest->getparam('pagenum', '');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');
$templateData = $fwRequest->getParam($TABLE, '');

/* Start Enable Disable Link */
$linkopen = $fwRequest->getParam('linkopen', '');
if ($linkopen) {
	$saveTotable = new Fw_Db_Table('template_docs');
	$keys_1 = array_keys($linkopen);
	$ky_1 = $keys_1[0];
	$val_1 = $linkopen[$ky_1];

	$detail['dh_enable_ai_procedure_page'] = $val_1;
	$saveTotable->setWhere("dh_id = " . $ky_1);
	if ($saveTotable->rowExists()) {
		$this_id = $saveTotable->updateRow($detail);
	}
}
/* End Enable Disable Link */

$keyword = $templateData['keyword'] ?? '';
$where = "WHERE dh_enable_ai_procedure_page=1 ";

$keyword2  = (int)$keyword;

if ($keyword):
	//$where .= "AND ".$TABLE.".dh_title LIKE '%".$keyword."%'" ;

	$where .= "AND " . $TABLE . ".dh_title LIKE '%" . $keyword . "%' OR " . $TABLE . ".dh_uid = " . $keyword2;


	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];
elseif ($_SESSION['keyword'] && $pagenum > 0):
	$where .= "AND " . $TABLE . ".dh_title LIKE '%" . $_SESSION['keyword'] . "'";
	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;

if ($short) {
	switch ($short) {
		case 'lc':
			$_SESSION['sort_order'] = $TABLE . ".dh_uid DESC";
			break;

		case 'bl':
			$_SESSION['sort_order'] = $TABLE . ".dh_uid ASC";
			break;
	}
}
//if($_SESSION['sort_order']){$order = "ORDER BY ".$_SESSION['sort_order'];}else{$order = "ORDER BY CONVERT (".$TABLE.".dh_uid USING latin2) ASC";}
if ($_SESSION['sort_order']) {
	$order = "ORDER BY " . $_SESSION['sort_order'];
} else {
	$order = "ORDER BY " . $TABLE . ".dh_uid ASC";
}


$logged_username = $_SESSION['user']['user_username'];

if (empty($pagenum)) {
	unset($_SESSION['last_sql']);
}
if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$fwViewData['detail'] = $detail;
	$fwViewData['ord_id'] = $detail['orderBy'];
}

if ($_SESSION['last_sql']) {
	$sql = $_SESSION['last_sql'];
} else {
	$sql = "SELECT " . $TABLE . ".*, users.user_name FROM " . $TABLE . " LEFT JOIN users ON users.user_id = " . $TABLE . ".dh_author " . $where . " " . $order;
}

if ($sql) {
	$userData = $fwDb->query($sql);
}


if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}

	$rows = count($userData);

	$page_rows = 30;
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

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $sql . " " . $max;

	if ($sql2) {
		$setdata = $fwDb->query($sql2);
	}

	if ($setdata) {
		foreach ($setdata as $k => $v) {
			$docid = $v['dh_id'];
			$sqldocs = "SELECT template_hub_docs.* FROM template_hub_docs WHERE template_hub_docs.dhd_dh_id = " . $docid;
			$doc_files = $fwDb->query($sqldocs);
			if ($doc_files) {
				foreach ($doc_files as $kf => $vf) {
					if ($vf['dhd_type']) {
						$vf['iconpath'] = get_icon_path($vf['dhd_type'], $vf['dhd_name2'], 'template_documents_hub');
					}
					$filedata[] = $vf;
				}
			}

			$v['doc_files'] = $filedata;
			unset($filedata);
			$fwViewData['list'][] = $v;
			$fldt[] = $v['doc_files'];
		}
	}
}
$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "AI Repository";


//foreach($fldt as $fd)
//{
		
		//$m = explode('.',$fd[0]['dhd_name']);
		//$new  = 'DID'.$fd[0]['dhd_dh_id'].'.'.$m[1];
		//copy(BASE_DIR.'files/template_documents_hub/'.$fd[0]['dhd_name'], BASE_DIR.'files/template_documents_hub/'.$new);
//}
//$sqldocs = "SELECT template_hub_docs.* FROM template_hub_docs";
//$doc_files = $fwDb->query($sqldocs);
//
//$tabledid = new Fw_Db_Table('template_hub_docs');
//foreach($doc_files as $df)
//{
//	$m = explode('.',$df['dhd_name']);
//	$ddi = $df['dhd_dh_id'];
//	$new['dhd_name2'] = 'DID'.$ddi.".".$m[1];
//	
//	$tabledid->setWhere('dhd_dh_id = '. $ddi);
//	$tabledid->updateRow($new); 
//	
//	db($new);	
//}
//exit;
