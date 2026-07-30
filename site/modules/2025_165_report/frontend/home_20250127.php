<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table($TABLE);

$where = " WHERE 1 = 1  ";

$ord = '';

$implemented = $fwRequest->getParam('implemented', '');
if($implemented)
{
	 $keys_2 = array_keys($implemented);
	 $ky_2 = $keys_2[0];
	 $val_2 = $implemented[$ky_2];
	
	  $detail['os2_solution_imple'] = $val_2;
	  $table->setWhere("os2_id = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}
 	$clear = $fwRequest->getParam('clear_search', '');
			if(!empty($clear)) {
			unset($fwViewData['address']);
			unset($_SESSION['address']);
		
			$where = " where 1 = 1";	
		}

$address = $fwRequest->getParam('address', '');
if ($address):
	$where .= " AND  2025_165_report  .os2_project LIKE '%" .$address . "%'";

	$_SESSION['address'] = $address;
	$fwViewData['address'] = $_SESSION['address'];

elseif ($_SESSION['address']):

	$where .= " AND 2025_165_report  .os2_project  LIKE '%" . $_SESSION['address'] . "%' ";

	$fwViewData['address'] = $_SESSION['address'];
endif; 

/* $checkpass = $fwRequest->getParam('checkpass', '');
if ($checkpass):
	$where .= " AND  165_report.os_comp_chk_pass = '" . $checkpass . "'";

	$_SESSION['checkpass'] = $checkpass;
	$fwViewData['checkpass'] = $_SESSION['checkpass'];

elseif ($_SESSION['checkpass']):

	$where .= " AND 165_report.os_comp_chk_pass = '" . $_SESSION['checkpass'] . "' ";

	$fwViewData['checkpass'] = $_SESSION['checkpass'];
endif;


$wasrequest = $fwRequest->getParam('wasrequest', '');
if ($wasrequest):
	if ($wasrequest == -1) {
		$wasrequest = 0;
	}
	$where .= " AND  165_report.os_was_there_request = " . $wasrequest;

	$_SESSION['wasrequest'] = $wasrequest;
	$fwViewData['wasrequest'] = $_SESSION['wasrequest'];

elseif ($_SESSION['wasrequest']):

	$where .= " AND 165_report.os_was_there_request = " . $_SESSION['wasrequest'];

	$fwViewData['wasrequest'] = $_SESSION['wasrequest'];
endif;

$dapassed = $fwRequest->getParam('dapassed', '');
if ($dapassed):
	$where .= " AND  165_report.os_da_passed = '" . $dapassed . "'";

	$_SESSION['dapassed'] = $dapassed;
	$fwViewData['dapassed'] = $_SESSION['dapassed'];

elseif ($_SESSION['dapassed']):

	$where .= " AND 165_report.os_da_passed = '" . $_SESSION['dapassed'] . "' ";

	$fwViewData['dapassed'] = $_SESSION['dapassed'];
endif; */

$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . " " . $where . ' ' . $ord;


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

/* foreach ($listsnew as $k => $v) {

	$sqlb = "select bsn_id,bsn_status_sys_date  from business where bsn_name = '" . $v['os_project'] . "'";
	$busdata = $fwDb->queryOne($sqlb);

	$sqluid369 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				  where business_tasks.bt_bsn_id = " . $busdata['bsn_id'] . " And business_tasks.bt_task_id = 369";
	$data369 = $fwDb->queryOne($sqluid369);

	$sql_nt = "Select max(STR_TO_DATE(on_date, '%d-%m-%Y' )) as notes_date from 165_report_notes where on_os_id = " . $v['os_id'];
	$ntdata = $fwDb->queryOne($sql_nt);


	$sql_228 = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = " . $busdata['bsn_id']
		. " And doc_name_id = 228 ";
	$data228 = $fwDb->queryOne($sql_228);


	$listsnew[$k]['bsn_id'] = $busdata['bsn_id'];
	$listsnew[$k]['bsn_status_sys_date'] = $busdata['bsn_status_sys_date'];

	$listsnew[$k]['bt_completed_date'] = changedate_d_m_y($data369['bt_completed_date']);
	$listsnew[$k]['notes_date']  = changedate_d_m_y($ntdata['notes_date']);

	$listsnew[$k]['doc_file_name_228'] = $data228['doc_file_name'];
	$listsnew[$k]['doc_date_uploaded_228']  = changedate_d_m_y($data228['doc_date_uploaded']);
}


//$fwViewData['list'] = $listsnew;

foreach ($listsnew as $key => $row) {
	$desig[$key] = strtotime($row['bt_completed_date']);
	//$desig[$key]  = $row['bt_completed_date'];
}

array_multisort($desig, SORT_DESC, $listsnew); */

$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sql_6 = "Select * from 165_report_change_needed";
$fwViewData['cndata'] = $fwDb->query($sql_6);

$sql = "select * from 165_2025_stage";
$fwViewData['stage'] = $fwDb->query($sql);

$sql = "select ppc_id , ppc_document from planning_project_checklist_admin";
$fwViewData['docplan'] = $fwDb->query($sql);
