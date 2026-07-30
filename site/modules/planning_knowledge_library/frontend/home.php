<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$where = " where 1 = 1 ";

$fwViewData['search_doc_name'] = '';
$search_doc_name = $fwRequest->getParam('search_doc_name', '');
if ($search_doc_name):
    $where .= " AND pkl_name LIKE '%".$search_doc_name."%' ";
    $_SESSION['search_doc_name'] =  $search_doc_name;
	$fwViewData['search_doc_name'] = $_SESSION['search_doc_name'];
elseif ($_SESSION['search_doc_name']):
    $where .= " AND pkl_name LIKE '%".$_SESSION['search_doc_name']."%' ";
    $fwViewData['search_doc_name'] = $_SESSION['search_doc_name'];
endif;

$clear = $fwRequest->getParam('clear', '');
if($clear)
{
	$where = "WHERE 1 = 1";
	unset($_SESSION['search_doc_name']);
	$fwViewData['search_doc_name']='';
	
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$matsql = "SELECT $TABLE.* FROM $TABLE ".$where." order by $TABLE.pkl_id DESC";

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

		/* foreach ($lists as $list):
			$list['link'] =  $BASE_URL . "business.detail/bsn_id/" . $list['va_bsn_id'];			
			
			$listsnew[] = $list;
		endforeach;
		$fwViewData['list'] = $listsnew; */
		$fwViewData['list'] = $lists;
		//echo "<pre>"; print_r($lists); exit();
	}
}

$fwViewData['title'] = $MODULE_PLURAL;
