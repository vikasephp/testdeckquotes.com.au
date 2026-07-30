<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('project_planning_checklist');
$where = " WHERE pc_missing_plans_report = 1 and  pc_missing_plan_hide = 0 ";


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_2 = array_keys($hide);
	 $ky_2 = $keys_2[0];
	 $val_2 = $hide[$ky_2];
	
	  $detail['pc_missing_plan_hide'] = $val_2;
	  $table->setWhere("pc_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}

$hidden = $fwRequest->getParam('hidden', '');
	if(!empty($hidden)) {
	$where = " WHERE pc_missing_plans_report = 1 ";	
}

$save_pc_missing_plans_upload = $fwRequest->getParam('save_pc_missing_plans_upload', '');
if ($save_pc_missing_plans_upload && $_FILES['pc_missing_plans_upload']['name']) {
	$this_id = (int)$fwRequest->getParam($ID, 0);

	$docfile_1 = $_FILES['pc_missing_plans_upload']['name'];
	$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
	$temp_name_1 = $_FILES['pc_missing_plans_upload']['tmp_name'];
	$detail['pc_missing_plans_upload'] = $docfile_1;
	$fileUploaded = upload($docfile_1, $temp_name_1);
	// $detail['pc_missing_plans_upload_date'] = date('Y-m-d H:i:s');
	$table = new Fw_Db_Table($TABLE);
	$table->setWhere("$ID = $this_id");
	if ($table->rowExists()) {
		$detail = $table->updateRow($detail);
	}
}

$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	// unset($_SESSION['show_hidden']);
	// $where = " where ldd_hide = 0";
}

$ord = ' ORDER BY pc_missing_plans_report_date DESC';

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;

$sql = "SELECT prd_bsn_id, prd_name FROM person_responsible_detail WHERE prd_position LIKE 'Overseas Architect'";
$architectdetail  = $fwDb->query($sql);
$architectArr = [];
foreach ($architectdetail as $row) {
	$architectArr[$row['prd_bsn_id']] = $row['prd_name'];
}
$fwViewData['architectArr'] = $architectArr;
// db($architectArr);

$sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id";
$custdetail  = $fwDb->query($sql);
$clientArr = [];
foreach ($custdetail as $cust) {
	$clientArr[$cust['bs_business_id']] = $cust['bcust_fname'] . ' ' . $cust['bcust_lname'];
}
$fwViewData['clientArr'] = $clientArr;

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

$mpdTypesql = "SELECT * FROM `planning_project_checklist_admin` ";
$mpddetail  = $fwDb->query($mpdTypesql);
$fwViewData['mpddetail'] = $mpddetail;

$clear_search = $fwRequest->getParam('clear_search', '');
if(!empty($clear_search)) {
	unset($_SESSION['bsn_id']);
	unset($_SESSION['prd_bsn_id']);
	unset($_SESSION['sk']);
	unset($address);
	unset($architect);
	unset($bsn_id);
	$fwViewData['address']='';
	$fwViewData['architect']='';
	$sk='';
	unset($sk);	
	unset($_SESSION['search_status']);
	unset($search_status);
}

$address = $fwRequest->getParam('address', '');

if($address):
		$bsn_id =0;
        $sqlbsn = "select bsn_id from business where bsn_name like '%".$address."%'";
		$bid = $fwDb->queryOne($sqlbsn);
		if($bid['bsn_id'] >0 ) {
			$bsn_id = $bid['bsn_id'];
		}
		$where .= " AND  project_planning_checklist.pc_bsn_id = ".$bsn_id;
        $_SESSION['bsn_id'] = $bsn_id;
		
elseif($_SESSION['bsn_id']):
		$where .= " AND project_planning_checklist.pc_bsn_id = ".$_SESSION['bsn_id'];	      
endif;

$architect = $fwRequest->getParam('architect', '');
if($architect):
		$bsn_id =0;
        $sqlbsn = "select prd_bsn_id from person_responsible_detail  where prd_name like '%".$architect."%' and prd_position ='Overseas Architect'";
		$bid = $fwDb->query($sqlbsn);
		$sk ="(";
		foreach($bid as $bk => $bv)
		{
			$sk .= $bv['prd_bsn_id'].",";
		}
		
		$sk .= "0)";
		
		
		//$prd_bsn_id = $bid['prd_bsn_id'];

		$where .= " AND  project_planning_checklist.pc_bsn_id IN  ".$sk;
        $_SESSION['sk'] = $sk;
		
elseif($_SESSION['sk']):
		$where .= " AND project_planning_checklist.pc_bsn_id IN ".$_SESSION['sk'];	      
endif;


$filter_status = $fwRequest->getParam('filter_status', '');
if(!empty($filter_status)) {
	$search_status = $fwRequest->getParam('search_status', '');

	if(!empty($search_status)) {
		$_SESSION['search_status'] = $search_status;	
	}
}

//db($search_status);

$matsql = "SELECT $TABLE.* FROM $TABLE $where $ord";


$resultData = $fwDb->query($matsql);

//db($resultData);

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
		//$fwViewData['list'] = $listsnew;
	}
}

foreach($listsnew as $k=>$v)
{
	
	$sql1 = "select bsn_status from business where bsn_id = ".$v['pc_bsn_id'];
	$stdata = $fwDb->queryOne($sql1);
	
	$status_string = "'".$stdata['bsn_status']."'";
	$status='';
		
		
		if(strpos($status_string, '|1|') > 0) { $status .= "Convert<br>" ; }
		if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }	
		if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
		if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
		if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
		if(strpos($status_string, '|6|') > 0) { $status .= "Pre-construction<br>" ; }
	    if(strpos($status_string, '|12|') > 0) { $status .= "Design Phase<br>" ; }
		if(strpos($status_string, '|15|') > 0) { $status .= "Lost" ; }
		
		$sql64 = "Select document_check_list.doc_file_name from document_check_list
			       where document_check_list.doc_bsn_id = ". $v['pc_bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data64 = $fwDb->queryOne($sql64);
		
		$sql2 = "select pd_checklist from project_planning_checklist_data where pd_bsn_id = ".$v['pc_bsn_id'];
		$chkdata = $fwDb->queryOne($sql2);
		
		$sql20 = "Select document_check_list_mini.doc_file_name from document_check_list_mini
			      where document_check_list_mini.doc_bsn_id = ". $v['pc_bsn_id'] . " And document_check_list_mini.doc_name_id = 20";
		$data20 = $fwDb->queryOne($sql20);
		
		$listsnew[$k]['status'] = $status;
		$listsnew[$k]['doc_file_name_64'] = $data64['doc_file_name'];
		$listsnew[$k]['doc_file_name_20'] = $data20['doc_file_name'];
		$listsnew[$k]['checklist'] = $chkdata['pd_checklist'];
		
		
		
}

	if(!empty($search_status) || isset($_SESSION['search_status'])) {
	
		
		foreach($listsnew as $m1 => $s1)
		{
			
			if(strpos($s1['status'] , $_SESSION['search_status'][0]) !== false OR strpos($s1['status'] , $_SESSION['search_status'][1]) !== false)
			{
					 
			} else {
					unset($listsnew[$m1]);
			}
		}
	}
$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$tablestatus = new Fw_Db_Table('busness_status');
$tablestatus->setWhere('st_status != 0');
$tablestatus->setOrderBy('st_id' . ' ASC');
$fwViewData['business_status'] = $tablestatus->getAllRows();
