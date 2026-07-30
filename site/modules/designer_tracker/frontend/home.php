<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$listdata = $fwRequest->getParam($TABLE, array());
$keyword = $listdata['keyword'];
$keyword_project = $listdata['keyword_project'];
$keyword_customer = $listdata['keyword_customer'];
$keyword_checklist = $listdata['keyword_checklist'];
$keyword_designer = $listdata['keyword_designer'];
$keyword_architect = $listdata['keyword_architect'];

if (!empty($keyword)) {
	$_SESSION['keyword'] = $keyword;
}
if (!empty($keyword_project)) {
	$_SESSION['keyword_project'] = $keyword_project;
}
if (!empty($keyword_customer)) {
	$_SESSION['keyword_customer'] = $keyword_customer;
}
if (!empty($keyword_checklist)) {
	$_SESSION['keyword_checklist'] = $keyword_checklist;
}
if (!empty($keyword_designer)) {
	$_SESSION['keyword_designer'] = $keyword_designer;
}
if (!empty($keyword_architect)) {
	$_SESSION['keyword_architect'] = $keyword_architect;
}


$keyword2 = $listdata['keyword2'];
if (!empty($keyword2)) {
	$_SESSION['keyword2'] = $keyword2;
}

$query = 'SELECT DISTINCT dt_checklist_no FROM `designer_tracker` WHERE dt_checklist_no != "" ORDER BY dt_checklist_no ASC;';
$result = $fwDb->query($query);
$filter_checklist_no_list = [];
foreach($result as $row) {
	$filter_checklist_no_list[] = $row['dt_checklist_no'];
}
$fwViewData['filter_checklist_no_list'] = $filter_checklist_no_list;

$query = 'SELECT DISTINCT dt_assignee FROM `designer_tracker` WHERE dt_assignee != "" ORDER BY dt_assignee ASC;';
$result = $fwDb->query($query);
$filter_architect_list = [];
foreach($result as $row) {
	$filter_architect_list[] = $row['dt_assignee'];
}
$fwViewData['filter_architect_list'] = $filter_architect_list;

$query = 'SELECT DISTINCT dt_cust_designer FROM `designer_tracker` WHERE dt_cust_designer != "" ORDER BY dt_cust_designer ASC;';
$result = $fwDb->query($query);
$filter_designer_list = [];
foreach($result as $row) {
	$filter_designer_list[] = $row['dt_cust_designer'];
}
$fwViewData['filter_designer_list'] = $filter_designer_list;

$query = 'SELECT dpn_unique_id, dpn_bsn_id FROM document_proposal_name WHERE dpn_unique_id IN ("' . implode('","', $filter_checklist_no_list) . '")';
$result = $fwDb->query($query);
$bsnIDs = [];
$checklist_bsnIDs = [];
foreach($result as $row) {
	$bsnIDs[] = $row['dpn_bsn_id'];
	if(!isset($checklist_bsnIDs[$row['dpn_bsn_id']])) {
		$checklist_bsnIDs[$row['dpn_bsn_id']] = [];
	}
	$checklist_bsnIDs[$row['dpn_bsn_id']][] = $row['dpn_unique_id'];
}
$query = 'SELECT dpn_unique_id, dpn_bsn_id FROM document_renovation_name WHERE dpn_unique_id IN ("' . implode('","', $filter_checklist_no_list) . '")';
$result = $fwDb->query($query);
foreach($result as $row) {
	$bsnIDs[] = $row['dpn_bsn_id'];
	if(!isset($checklist_bsnIDs[$row['dpn_bsn_id']])) {
		$checklist_bsnIDs[$row['dpn_bsn_id']] = [];
	}
	$checklist_bsnIDs[$row['dpn_bsn_id']][] = $row['dpn_unique_id'];
}

$filter_project_list = [];
$filter_customer_list = [];
$query = 'SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_name FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id WHERE business.bsn_id IN (' . implode(',', $bsnIDs) . ')';
$result = $fwDb->query($query);
foreach($result as $row) {
	// if(!isset($filter_project_list[trim($row['bsn_name'])])) {
	// 	$filter_project_list[trim($row['bsn_name'])] = [];
	// }
	// $filter_project_list[trim($row['bsn_name'])][] = $checklist_bsnIDs[$row['bs_business_id']];
	$filter_project_list[trim($row['bsn_name'])] = $checklist_bsnIDs[$row['bs_business_id']];

	// if(!isset($filter_customer_list[trim($row['bcust_fname'] . ' ' . $row['bcust_lname'])])) {
	// 	$filter_customer_list[trim($row['bcust_fname'] . ' ' . $row['bcust_lname'])] = [];
	// }
	// $filter_customer_list[trim($row['bcust_fname'] . ' ' . $row['bcust_lname'])][] = $checklist_bsnIDs[$row['bs_business_id']];
	$filter_customer_list[trim($row['bcust_fname'] . ' ' . $row['bcust_lname'])] = $checklist_bsnIDs[$row['bs_business_id']];
}
ksort($filter_project_list);
ksort($filter_customer_list);
$fwViewData['filter_project_list'] = $filter_project_list;
$fwViewData['filter_customer_list'] = $filter_customer_list;


$where = " WHERE dt_complete = 1 ";

$table_dt = new Fw_Db_Table('designer_tracker');

$updaterenovation = $fwRequest->getParam('updaterenovation', '');
if (!empty($updaterenovation)) {

	$sql_1 = "Select dpn_bsn_id, dpn_unique_id from document_renovation_name";
	$data_1 = $fwDb->query($sql_1);

	foreach ($data_1 as $k1 => $v1) {
		$detail['dt_checklist_no'] = $v1['dpn_unique_id'];

		$table_dt->setWhere("dt_checklist_no = '" . $v1['dpn_unique_id'] . "'");

		if (!$table_dt->rowExists()) {

			$table_dt->insertRow($detail);
		}
	}
}

// Complete starts


$completed = $fwRequest->getParam('completed', '');
if ($completed) {
	$keys_2 = array_keys($completed);
	$ky_2 = $keys_2[0];
	$val_2 = $completed[$ky_2];

	$detail['dt_complete'] = $val_2;
	$table_dt->setWhere("dt_id = " . $ky_2);
	if ($table_dt->rowExists()) {
		$this_id = $table_dt->updateRow($detail);
	}
}

// Complete Ends


$table_toplink = new Fw_Db_Table('top_links');

$update_link = $fwRequest->getParam('update_link', '');
if (!empty($update_link)) {
	$proc = $fwRequest->getParam('proc', '');
	$tlDetail['tl_link'] = $proc;

	$table_toplink->setWhere("tl_slug = 'designer_tracker'");
	$table_toplink->updateRow($tlDetail);
}

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($_SESSION['keyword']);
	unset($_SESSION['keyword2']);
	unset($_SESSION['keyword_project']);
	unset($_SESSION['keyword_customer']);
	unset($_SESSION['keyword_checklist']);
	unset($_SESSION['keyword_designer']);
	unset($_SESSION['keyword_architect']);

	$keyword2 = '';
	$keyword = '';
	$keyword_project = '';
	$keyword_customer = '';
	$keyword_checklist = '';
	$keyword_designer = '';
	$keyword_architect = '';

	$fwViewData['keyword'] = '';
	$fwViewData['keyword_project'] = '';
	$fwViewData['keyword_customer'] = '';
	$fwViewData['keyword_checklist'] = '';
	$fwViewData['keyword_designer'] = '';
	$fwViewData['keyword_architect'] = '';

	unset($keyword);
	unset($keyword2);
	unset($keyword_project);
	unset($keyword_customer);
	unset($keyword_checklist);
	unset($keyword_designer);
	unset($keyword_architect);
}

if (isset($_SESSION['keyword'])) {
	$keyword = $_SESSION['keyword'];
}
if (isset($_SESSION['keyword_project'])) {
	$keyword_project = $_SESSION['keyword_project'];
}
if (isset($_SESSION['keyword_customer'])) {
	$keyword_customer = $_SESSION['keyword_customer'];
}
if (isset($_SESSION['keyword_checklist'])) {
	$keyword_checklist = $_SESSION['keyword_checklist'];
}
if (isset($_SESSION['keyword_designer'])) {
	$keyword_designer = $_SESSION['keyword_designer'];
}
if (isset($_SESSION['keyword_architect'])) {
	$keyword_architect = $_SESSION['keyword_architect'];
}

function getValueFromKey($keyword, $array)
{
	$result = [];
	foreach($array as $key => $item) {
		$key = strtolower(str_replace('  ', ' ', $key));
		$keyword = strtolower(str_replace('  ', ' ', $keyword));
		// db($key . ' | ' . $keyword . ' | ' . strstr($key, $keyword));
		if(strstr($key, $keyword)) {
			$result = array_merge($result, $item);
		}
	}
	if(!empty($result)) {
		return implode(',', $result);
	}
	return '';
}

// db($filter_project_list);

// db(getValueFromKey($keyword_project, $filter_project_list));

if ($keyword_project && $dt_checklist_no = getValueFromKey($keyword_project, $filter_project_list)):
	$where2 .= " AND designer_tracker.dt_checklist_no IN (" . $dt_checklist_no . ")";

	$_SESSION['keyword_project'] = $keyword_project;
	$fwViewData['keyword_project'] = $_SESSION['keyword_project'];

elseif ($_SESSION['keyword_project'] && $dt_checklist_no = getValueFromKey($_SESSION['keyword_project'], $filter_project_list)):
	$where2 .= " AND designer_tracker.dt_checklist_no IN (" . $dt_checklist_no . ")";

	$fwViewData['keyword_project'] = $_SESSION['keyword_project'];
endif;

if ($keyword_customer && $dt_checklist_no = getValueFromKey($keyword_customer, $filter_customer_list)):
	$where2 .= " AND designer_tracker.dt_checklist_no IN (" . $dt_checklist_no . ")";

	$_SESSION['keyword_customer'] = $keyword_customer;
	$fwViewData['keyword_customer'] = $_SESSION['keyword_customer'];

elseif ($_SESSION['keyword_customer'] && $dt_checklist_no = getValueFromKey($_SESSION['keyword_customer'], $filter_customer_list)):
	$where2 .= " AND designer_tracker.dt_checklist_no IN (" . $dt_checklist_no . ")";

	$fwViewData['keyword_customer'] = $_SESSION['keyword_customer'];
endif;

if ($keyword_checklist):
	$where2 .= " AND designer_tracker.dt_checklist_no LIKE '%" . $keyword_checklist . "%' ";

	$_SESSION['keyword_checklist'] = $keyword_checklist;
	$fwViewData['keyword_checklist'] = $_SESSION['keyword_checklist'];

elseif ($_SESSION['keyword_checklist']):
	$where2 .= " AND designer_tracker.dt_checklist_no LIKE '%" . $keyword_checklist . "%' ";

	$fwViewData['keyword_checklist'] = $_SESSION['keyword_checklist'];
endif;

if ($keyword_designer):
	$where2 .= " AND designer_tracker.dt_cust_designer LIKE '%" . $keyword_designer . "%' ";

	$_SESSION['keyword_designer'] = $keyword_designer;
	$fwViewData['keyword_designer'] = $_SESSION['keyword_designer'];

elseif ($_SESSION['keyword_designer']):
	$where2 .= " AND designer_tracker.dt_cust_designer LIKE '%" . $keyword_designer . "%' ";

	$fwViewData['keyword_designer'] = $_SESSION['keyword_designer'];
endif;

if ($keyword_architect):
	$where2 .= " AND designer_tracker.dt_assignee LIKE '%" . $keyword_architect . "%' ";

	$_SESSION['keyword_architect'] = $keyword_architect;
	$fwViewData['keyword_architect'] = $_SESSION['keyword_architect'];

elseif ($_SESSION['keyword_architect']):
	$where2 .= " AND designer_tracker.dt_assignee LIKE '%" . $keyword_architect . "%' ";

	$fwViewData['keyword_architect'] = $_SESSION['keyword_architect'];
endif;

if ($keyword):

	$where2 .= " and ( designer_tracker.dt_checklist_no LIKE '%" . $keyword . "%' OR designer_tracker.dt_assignee LIKE '%" . $keyword . "%' OR 
		   designer_tracker.dt_cust_designer LIKE '%" . $keyword . "%' )  ";

	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];

elseif ($_SESSION['keyword']):

	$where2 .= " and ( designer_tracker.dt_checklist_no LIKE '%" . $_SESSION['keyword'] . "%'
	           OR designer_tracker.dt_assignee LIKE '%" . $_SESSION['keyword'] . "%' 
		   OR designer_tracker.dt_cust_designer LIKE '%" . $_SESSION['keyword'] . "%' ) ";

	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;

$complete = $fwRequest->getParam('complete', '');
if (!empty($complete)) {
	$where = " where designer_tracker.dt_complete = 0 ";
}


$current = $fwRequest->getParam('current', '');
if (!empty($current)) {
	$where = " where designer_tracker.dt_complete = 1 ";
}

$showall = $fwRequest->getParam('showall', '');
if (!empty($showall)) {

	$where = " where 1 = 1 ";
}


//$matsql = "SELECT * from designer_tracker ".$where.''.$where2;	
$matsql = " SELECT * from designer_tracker " . $where . " " . $where2;

//db($matsql);

if ($matsql) {
	$userData = $fwDb->query($matsql);
}

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
	$page_rows = 500;
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

if ($listsnew) {

	foreach ($listsnew as $k => $v2) {


		$sql_b = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '" . $v2['dt_checklist_no'] . "'";
		$ppt = $fwDb->queryOne($sql_b);

		if (!empty($ppt)) {
			$bsn_id =  $ppt['dpn_bsn_id'];
		}

		$sql_b2 = "select dpn_bsn_id from document_renovation_name where dpn_unique_id = '" . $v2['dt_checklist_no'] . "'";

		$ppt2 = $fwDb->queryOne($sql_b2);

		if (!empty($ppt2)) {
			$bsn_id =  $ppt2['dpn_bsn_id'];
		}


		if (isset($_SESSION['keyword2'])) {
			$keyword2 = $_SESSION['keyword2'];
		}

		if (!empty($keyword2) || isset($_SESSION['keyword2'])) {


			$sq122 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
				bus_customers.bcust_misc_moble, business.bsn_name
				from business_sellers 		
				Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
				Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_id = " . $bsn_id
				. " And business.bsn_name like '%" . $keyword2 . "%'";
		} else {

			$sq122 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname,
			bus_customers.bcust_lname, bus_customers.bcust_misc_moble, business.bsn_name
			from business_sellers 		
			Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
			where business.bsn_id = " . $bsn_id;
		}

		// db($sq122); 
		$data = $fwDb->queryOne($sq122);



		$Statusdate = changedate_y_m_d($v2['dt_date_submitted']);

		if (!empty($Statusdate)) {
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}

		$sql_outs = "Select count(*) as out_c from task_designer_tracker where tdt_dt_id = " . $v2['dt_id'] . " AND tdt_status <> 'COMPLETE' ";
		$outdata = $fwDb->queryOne($sql_outs);


		if (!empty($data['bsn_name'])) {
			$setdata2[$k]['dt_id'] = $v2['dt_id'];
			$setdata2[$k]['dt_project_name'] = $data['bsn_name'];
			$setdata2[$k]['dt_checklist_no'] = $v2['dt_checklist_no'];
			$setdata2[$k]['dt_status'] = $v2['dt_status'];
			$setdata2[$k]['bcust_fname'] = $data['bcust_fname'];
			$setdata2[$k]['bcust_lname'] = $data['bcust_lname'];
			$setdata2[$k]['dt_date_submitted'] = changedate_d_m_y($v2['dt_date_submitted']);
			$setdata2[$k]['dt_due_date'] = $v2['dt_due_date'];
			$setdata2[$k]['day_open'] = $dayscount;
			$setdata2[$k]['dt_cust_designer'] = $v2['dt_cust_designer'];
			$setdata2[$k]['dt_assignee'] = $v2['dt_assignee'];
			$setdata2[$k]['o_task'] = $outdata['out_c'];
			$setdata2[$k]['count'] = count($chknodata);
			$setdata2[$k]['dt_complete'] = $v2['dt_complete'];
			$setdata2[$k]['dt_priority'] = $v2['dt_priority'];
		}
	}
}
$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;
$table_toplink->setWhere("tl_slug = 'designer_tracker'");
$fwViewData['proc_detail'] = $table_toplink->getRow();

$sqlpr = "Select * from design_tracker_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr);
