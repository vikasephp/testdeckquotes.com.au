<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('warranty_log');
$serviceClass = new ServiceClass;

$photos = $serviceClass->setLogPhotosIdWise();
$fwViewData['photos'] = $photos;
$videos = $serviceClass->setLogVideosIdWise();
$fwViewData['videos'] = $videos;

$matsql = "SELECT * from warranty_form where wf_status = 'Pending' ";

$showhidden = $fwRequest->getParam('show_hidden', '');

if (!empty($showhidden)) {
	$matsql = "SELECT * from warranty_form";
}

if ($matsql) {
	$userData = $fwDb->query($matsql);
}

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
	$page_rows = 100;
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

		$fwViewData['list'] = $listsnew;
	}
}



$fwViewData['title'] = $MODULE_PLURAL;

 		
//$sqlpr = "Select * from warranty_log_priority";
//$fwViewData['prdetail'] = $fwDb->query($sqlpr); 
//
//$thisTable = new Fw_Db_Table("warranty_log_type");
//$fwViewData['typedetail'] = $thisTable->getAllRows(); 