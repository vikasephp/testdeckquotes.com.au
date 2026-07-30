<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('debt_management');

$where = " WHERE 1 = 1";

// $hidden = $fwRequest->getParam('hidden', '');
// if (!empty($hidden)) {
// 	$where = " WHERE 1 = 1";
// }
// else{
// 	$where = " WHERE dm_hide = 0";
// }

$clear = $fwRequest->getParam('clear', '');
if ($clear) {
	$fwViewData['due_date'] = '';
}

$first_email = $fwRequest->getParam('first_email', '');
if ($first_email) {
	$keys_1 = array_keys($first_email);
	$ky_1 = $keys_1[0];
	$val_1 = $first_email[$ky_1];

	$detail['dm_first_email'] = $val_1;
	$detail['dm_first_email_user'] = $_SESSION['user']['user_name'];
	$detail['dm_first_email_date'] = date('Y-m-d');

	$table->setWhere("dm_id = " . $ky_1);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$second_email = $fwRequest->getParam('second_email', '');
if ($second_email) {
	$keys_2 = array_keys($second_email);
	$ky_2 = $keys_2[0];
	$val_2 = $second_email[$ky_2];

	$detail['dm_second_email'] = $val_2;
	$detail['dm_second_email_user'] = $_SESSION['user']['user_name'];
	$detail['dm_second_email_date'] = date('Y-m-d');

	$table->setWhere("dm_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}
$show_hidden = $fwRequest->getParam('show_hidden', '');
if (!empty($show_hidden) || $_SESSION['show_hidden']) {
	$_SESSION['show_hidden'] =  $show_hidden;
	$where = " WHERE dm_hide = 1";
}
else{
	$where = " WHERE dm_hide = 0";
}
$status = $fwRequest->getParam('status', '');

if ($status): {
		$where .= " AND debt_management.dm_status   = '" . $status . "'";
		$fwViewData['status'] = $status;
		$_SESSION['status'] =  $status;
	}
elseif ($_SESSION['status']):

	$where .= " AND debt_management.dm_status = '" . $_SESSION['status'] . "'";
	$fwViewData['status'] = $_SESSION['status'];

endif;

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($fwViewData['status']);
	unset($_SESSION['status']);
	unset($_SESSION['show_hidden']);
	$where = " where dm_hide = 0";
}

// db($_SESSION);

$phone_call = $fwRequest->getParam('phone_call', '');
if ($phone_call) {
	$keys_3 = array_keys($phone_call);
	$ky_3 = $keys_3[0];
	$val_3 = $phone_call[$ky_3];

	$detail['dm_phone_call'] = $val_3;
	$detail['dm_phone_call_user'] = $_SESSION['user']['user_name'];
	$detail['dm_phone_call_date'] = date('Y-m-d');

	$table->setWhere("dm_id = " . $ky_3);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$ord =  " ORDER BY if(  dm_next_contact_date 	  = ' '
       OR dm_next_contact_date 	  IS NULL , 1, 0 ) , STR_TO_DATE( dm_next_contact_date 	, '%d-%m-%Y' ) ";

$sql = "SELECT td_project_name, td_dmp, td_dmp_date, td_dmp_user FROM 30_days_rec_report WHERE td_hide = 0";
$dmpdetail  = $fwDb->query($sql);
$dmpArr = [];
foreach($dmpdetail as $dmp){
    $dmpArr[$dmp['td_project_name']] = $dmp['td_dmp'] == 1 ? 'YES' : 'NO';
}
$fwViewData['dmpArr'] = $dmpArr;

// $matsql = "SELECT $TABLE.*, T30.td_project_name, T30.td_dmp, T30.td_dmp_date, T30.td_dmp_user FROM $TABLE LEFT JOIN 30_days_rec_report T30 ON T30.td_project_name = $TABLE.dm_bsn_name $where $ord";
$matsql = "SELECT $TABLE.* FROM $TABLE $where $ord";

if ($matsql) {
	$userData = $fwDb->query($matsql);
}

$fwViewData['total'] = sizeof($userData);

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
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

$thisTable = new Fw_Db_Table($ACTION_TABLE);
$fwViewData['actiondata'] = $actiondata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table($JURISDICTION_TABLE);
$fwViewData['jurisdictiondata'] = $jurisdictiondata  = $thisTable->getAllRows();

$fwViewData['title'] = $MODULE_PLURAL;
