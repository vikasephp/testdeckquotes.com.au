<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$where = " WHERE 1 = 1";
$ord = "Order by `cld_id` desc";

$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	// unset($_SESSION['show_hidden']);
	// $where = " where ldd_hide = 0";
}

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;


//$sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id";
$custsql = "Select business_sellers.bs_business_id, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname from business_sellers LEFT JOIN bus_customers on business_sellers.bs_customers_id = bus_customers.bcust_id";
$custdetail  = $fwDb->query($custsql);
$clientArr = [];
foreach ($custdetail as $cust) {
	$clientArr[$cust['bs_business_id']] = $cust['bcust_fname'] . ' ' . $cust['bcust_lname'];
}
$fwViewData['clientArr'] = $clientArr;


$userSql = "SELECT `user_id`, `user_name` FROM `users`";
$userdetail = $fwDb->query($userSql);
$userArr = [];
foreach ($userdetail as $user) {
	$userArr[$user['user_id']] = $user['user_name'];
}
$fwViewData['userArr'] = $userArr;
// db($userArr);


$lmpsql = "SELECT `doc_bsn_id`,`doc_name_id`, `doc_file_name`, `doc_date_uploaded`, `doc_user_name` FROM `document_check_list` where `doc_name_id` = 491";
$lmpdetail  = $fwDb->query($lmpsql);
$lmpArr = [];
foreach ($lmpdetail as $projectlmp ) {
	$lmpArr[$projectlmp['doc_bsn_id']] = [
                                    	    "doc_file_name"=>$projectlmp['doc_file_name'],
                                    	    "doc_date_uploaded"=>$projectlmp['doc_date_uploaded']
                                    	    ]; 
}
$fwViewData['lmpArr'] = $lmpArr;

$matsql = "SELECT $TABLE.* FROM $TABLE";

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
		$totalPlansMissingArr = [];
		foreach ($lists as $list):
			$list['link'] =  $BASE_URL . "business.detail/bsn_id/" . $list['pc_bsn_id'];
			if(!isset($totalPlansMissingArr[$list['pc_bsn_id']])){
				$totalPlansMissingArr[$list['pc_bsn_id']] = 1;
			}
			else{
				$totalPlansMissingArr[$list['pc_bsn_id']]++;
			}
			// $list['total_plans_missing'][$list['pc_bsn_id']] = $total_plans_missing[$list['pc_bsn_id']];
			$listsnew[] = $list;
		endforeach;

		$fwViewData['totalPlansMissingArr'] = $totalPlansMissingArr;
		$fwViewData['list'] = $listsnew;
	}
}

// db($listsnew);

// $thisTable = new Fw_Db_Table($ATTRIBUTES['type']['table']);
// $fwViewData['typedata'] = $typedata = $thisTable->getAllRows();
// $thisTable = new Fw_Db_Table($ATTRIBUTES['status']['table']);
// $fwViewData['statusdata'] = $statusdata = $thisTable->getAllRows();

$fwViewData['title'] = $MODULE_PLURAL;
