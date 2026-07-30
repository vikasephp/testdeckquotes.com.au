<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$smsHistory_Table = new Fw_Db_Table("psr_enquiry_sms_history");

$sql = "SELECT bsn_id, bsn_address FROM business";
$projdetail = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_address'];
}
$fwViewData['projectArr'] = $projectArr;


$psresh_sms_optOut = $fwRequest->getParam('psresh_sms_optOut', '');
if (!empty($psresh_sms_optOut)) {

	$psresh_id = (int)$psresh_sms_optOut['psresh_id'];
    $val_os  = $psresh_sms_optOut['psresh_sms_optOut'];

    $detail_en = array();
    $detail_en['psresh_sms_optOut'] = $val_os;
	
    $detail_en['psresh_sms_optOut_by'] = $_SESSION['user']['user_name'];
	$detail_en['psresh_sms_optOut_at'] = date('d-m-Y');

    $smsHistory_Table->setWhere("psresh_id = $psresh_id");

    if ($smsHistory_Table->rowExists()) {
        $smsHistory_Table->updateRow($detail_en);
    }

    $redirectUrl = $_SERVER['REQUEST_URI'];
    header("Location: $redirectUrl");
    exit; 	
}


$matsql = "SELECT * FROM psr_enquiry_sms_history ORDER BY psresh_sms_sent_on DESC";
$resultData = $fwDb->query($matsql);
//echo "<pre>"; print_r($resultData); exit();

if (!empty($resultData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($resultData);
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
	$fwViewData['start_sn'] = ($pagenum - 1) * $page_rows + 1;

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);
		$fwViewData['list'] = $lists;
	}
}

$fwViewData['title'] = $MODULE_PLURAL;
