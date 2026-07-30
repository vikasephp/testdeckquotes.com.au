<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}

$sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_id FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id";
$custdetail  = $fwDb->query($sql);
$clientArr = [];
foreach ($custdetail as $cust) {
	$clientArr[$cust['bs_business_id']] = [
		'name' => $cust['bcust_fname'] . ' ' . $cust['bcust_lname'],
		'id' => $cust['bcust_id']
	];
}

$matsql = "SELECT $TABLE.* FROM $TABLE where $TABLE.va_variation_in_progress = 1 order by $TABLE.va_id ASC";


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
			$list['project_name'] = $projectArr[$list['va_bsn_id']];
			//$list['client_link'] = $BASE_URL . "customer.detail/bcust_id/" . $clientArr[$list['ldd_bsn_id']]['id'];
			$list['client_name'] = $clientArr[$list['va_bsn_id']]['name'];
			
			$c_sql = "SELECT bc.bcust_misc_moble FROM business_sellers bs JOIN bus_customers bc ON bc.bcust_id = bs.bs_customers_id WHERE bs.bs_business_id = ". $list['va_bsn_id'];
			$c_data = $fwDb->queryOne($c_sql);
			$list['contact_detail'] = $c_data['bcust_misc_moble'];
			
			$sql_491 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $list['va_bsn_id'] ." and dcl.doc_name_id = 491";
			$data_491 = $fwDb->queryOne($sql_491);
			$list['file_491'] = $data_491['doc_file_name'];
			$list['doc_name_491'] = $data_491['admin_doc_name'];

			$sql_65 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $list['va_bsn_id'] ." and dcl.doc_name_id = 65";
			$data_65 = $fwDb->queryOne($sql_65);
			$list['file_65'] = $data_65['doc_file_name'];
			$list['doc_name_65'] = $data_65['admin_doc_name'];

			$sql_440 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $list['va_bsn_id'] ." and dcl.doc_name_id = 440";
			$data_440 = $fwDb->queryOne($sql_440);
			$list['file_440'] = $data_440['doc_file_name'];
			$list['doc_name_440'] = $data_440['admin_doc_name'];

			$sql_142 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $list['va_bsn_id'] ." and dcl.doc_name_id = 142";
			$data_142 = $fwDb->queryOne($sql_142);
			$list['file_142'] = $data_142['doc_file_name'];
			$list['doc_name_142'] = $data_142['admin_doc_name'];

			$sql_615 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $list['va_bsn_id'] ." and dcl.doc_name_id = 615";
			$data_615 = $fwDb->queryOne($sql_615);
			$list['file_615'] = $data_615['doc_file_name'];
			$list['doc_name_615'] = $data_615['admin_doc_name'];

			$sql_527 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $list['va_bsn_id'] ." and dcl.doc_name_id = 527";
			$data_527 = $fwDb->queryOne($sql_527);
			$list['file_527'] = $data_527['doc_file_name'];
			$list['doc_name_527'] = $data_527['admin_doc_name'];
			
			$sql_calculator = "SELECT itt_calculator_link FROM inclusions_task_tracker where itt_bsn_id = ". $list['va_bsn_id'];
			$data_calculator = $fwDb->queryOne($sql_calculator);
			$list['calculator_link'] = $data_calculator['itt_calculator_link'];
			
			$sql_notes = "SELECT vipn_notes, vipn_added_date FROM variations_in_progress_notes where vipn_va_id = ". $list['va_id'] . " Order by vipn_added_date desc LIMIT 1";
			$data_notes = $fwDb->queryOne($sql_notes);
			$list['note'] = $data_notes['vipn_notes'];
			$list['note_date'] = $data_notes['vipn_added_date'];
			
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
		//echo "<pre>"; print_r($lists); exit();
	}
}

$fwViewData['title'] = $MODULE_PLURAL;
