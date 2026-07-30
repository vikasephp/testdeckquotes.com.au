<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('lvc_ut_report');

$where = " WHERE lv_hide = 0";

$hidden = $fwRequest->getParam('hidden', '');
if (!empty($hidden)) {
	$where = " WHERE 1 = 1";
}


$clear = $fwRequest->getParam('clear', '');
if ($clear) {
	$fwViewData['due_date'] = '';
}


$emailed = $fwRequest->getParam('emailed', '');
if ($emailed) {
	$keys_1 = array_keys($emailed);
	$ky_1 = $keys_1[0];
	$val_1 = $emailed[$ky_1];

	$detail['lv_emailed_client'] = $val_1;

	$table->setWhere("lv_id = " . $ky_1);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$lv_sent_ma = $fwRequest->getParam('lv_sent_ma', '');
if ($lv_sent_ma) {
	$keys_1 = array_keys($lv_sent_ma);
	$ky_1 = $keys_1[0];
	$val_1 = $lv_sent_ma[$ky_1];

	$detail['lv_sent_ma'] = $val_1;
	$detail['lv_sent_ma_user'] = $_SESSION['user']['user_name'];
	$detail['lv_sent_ma_date'] = date('Y-m-d');
	$table->setWhere("lv_id = " . $ky_1);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}



$courier = $fwRequest->getParam('courier', '');
if ($courier) {
	$keys_2 = array_keys($courier);
	$ky_2 = $keys_2[0];
	$val_2 = $courier[$ky_2];
	$detail_2['lv_courier_client'] = $val_2;

	$table->setWhere("lv_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail_2);
	}
}

$hide = $fwRequest->getParam('hide', '');
if ($hide) {
	$keys_2 = array_keys($hide);
	$ky_2 = $keys_2[0];
	$val_2 = $hide[$ky_2];
	$detail_2['lv_hide'] = $val_2;

	$table->setWhere("lv_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail_2);
	}
}


//$ord =  " ORDER BY if(  zm_meeting_date  = ' '
//    OR zm_meeting_date  IS NULL , 1, 0 ) , STR_TO_DATE( zm_meeting_date, '%d-%m-%Y' ) DESC";

//$keyword = $fwRequest->getParam('keyword', '');
//if($keyword):
//
//	$where .= " AND phone_log.ph_name LIKE '%".$keyword."%' OR 
//	            phone_log.ph_company LIKE '%".$keyword."%' OR 
//                    phone_log.ph_user_created  LIKE '%".$keyword."%' OR 
//		    phone_log.ph_steam  LIKE '%".$keyword."%'  ";
//		    
//	
//	$_SESSION['keyword'] = $keyword;
//	$fwViewData['keyword']=$_SESSION['keyword'];
//
//elseif($_SESSION['keyword'] && $pagenum > 0):
//
//	$where .= " AND phone_log.ph_name LIKE '%".$_SESSION['keyword']."%' OR 
//	            phone_log.ph_company LIKE '%".$_SESSION['keyword']."% OR 
//		    phone_log.ph_user_created 	 LIKE '%".$_SESSION['keyword']."%' OR 
//		    phone_log.ph_steam LIKE '%".$_SESSION['keyword']."%' ";	
//	
//	$fwViewData['keyword']=$_SESSION['keyword'];
//endif;


$status = $fwRequest->getParam('status', '');

if ($status): {
		$where .= " AND sub_pages.sp_status   = " . $status;
		$fwViewData['status'] = $status;
		$_SESSION['status'] =  $status;
	}
elseif ($_SESSION['status']):

	$where .= " AND sub_pages.sp_status = " . $_SESSION['status'];
	$fwViewData['status'] = $_SESSION['status'];
endif;

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($fwViewData['status']);
	unset($_SESSION['status']);
	$where = " where 1 = 1";
}

$order = ' ORDER BY lv_id DESC';
$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . ' ' . $where . $order;

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
	}
}



foreach ($listsnew as $k => $v) {

	$sql = 'Select bsn_id, bsn_suburb , bsn_cd_block  from business where bsn_name = "' . $v['lv_project_address'] . '"';
	$data = $fwDb->queryOne($sql);

	$link = BASE_URL . "business.detail/bsn_id/" . $data['bsn_id'];

	$sqlsq = "select bs_paqr_sqm from business_sellers where bs_business_id = " . $data['bsn_id'];
	$sqmdata = $fwDb->queryOne($sqlsq);

	$sql288 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 288 ";
	$data288 = $fwDb->queryOne($sql288);

	$sql707 = "Select document_check_list.doc_file_name from document_check_list
			   where document_check_list.doc_bsn_id = " . $data['bsn_id'] . " And document_check_list.doc_name_id = 707 ";
	$data707 = $fwDb->queryOne($sql707);



	$listsnew[$k]['bsn_suburb'] = $data['bsn_suburb'];
	$listsnew[$k]['bsn_cd_block'] = $data['bsn_cd_block'];
	$listsnew[$k]['link'] = $link;
	$listsnew[$k]['doc_file_name'] = $data288['doc_file_name'];
	$listsnew[$k]['doc_file_name_707'] = $data707['doc_file_name'];
	$listsnew[$k]['bs_paqr_sqm'] = $sqmdata['bs_paqr_sqm'];
}

$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sql_t = "SELECT  * from lvc_ut_type";
$fwViewData['typedetail'] = $fwDb->query($sql_t);

$sql_2 = "SELECT  * from lvc_ut_lvc_type";
$fwViewData['lvcdetail'] = $fwDb->query($sql_2);;
