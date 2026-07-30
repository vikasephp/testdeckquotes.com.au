<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$where .= " bac_hide = 0";

$hide = $fwRequest->getParam('hide', '');
if ($hide) {
    $keys_2 = array_keys($hide);
    $ky_2 = $keys_2[0];
    $val_2 = $hide[$ky_2];
    $detail['bac_hide'] = $val_2;
	$table = new Fw_Db_Table($TABLE);
    $table->setWhere("bac_id = " . $ky_2);
    if ($table->rowExists()) {
        $this_id = $table->updateRow($detail);
    }
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
    unset($_SESSION['hidden']);
    $fwViewData['hidden'] = '';
	unset($_SESSION['all']);
	$fwViewData['all']= '';
}

$fwViewData['hidden'] = '';
$hidden = $fwRequest->getParam('hidden', '');
if ($hidden):
    $where = " bac_hide = 1 ";
    $_SESSION['hidden'] =  $hidden;
	$fwViewData['hidden'] = $_SESSION['hidden'];
elseif ($_SESSION['hidden']):
    $where = " bac_hide = 1 ";
    $fwViewData['hidden'] = $_SESSION['hidden'];
endif;

$all = $fwRequest->getParam('all', '');
if($all):
	$where = " 1 = 1";
	$_SESSION['all'] = $all;
	$fwViewData['all'] = $_SESSION['all'];

elseif($_SESSION['all'] && $pagenum > 0):
	$where = " 1 = 1";
	$fwViewData['all']=$_SESSION['all'];
endif;

$matsql = "SELECT $TABLE.* FROM $TABLE Where $where order by $TABLE.bac_id DESC";
//echo $matsql;

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
			$list['link'] =  $BASE_URL . "business.detail/bsn_id/" . $list['va_bsn_id'];			
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
		//echo "<pre>"; print_r($lists); exit();
	}
}

$sql_status = "SELECT * FROM buyers_agent_canberra_status";
$data_status = $fwDb->query($sql_status);
$fwViewData['status'] = $data_status;

$fwViewData['title'] = $MODULE_PLURAL;
