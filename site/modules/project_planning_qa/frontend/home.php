<?php

$tableqa = new Fw_Db_Table('business_qa');

$where  = " where length(business_qa.bqa_ans) IS NULL ";
$keyword = $fwRequest->getParam('searchkey', '');
if (!empty(trim($keyword))):
	$sql2 = "select bsn_id from business where bsn_name like '%" . $keyword . "%'";
	$bsnid = $fwDb->queryOne($sql2);
	$bsn_id = $bsnid['bsn_id'];
	$where .= " AND business_qa.bqa_bsn_id = " . $bsn_id;
	$_SESSION['keyword'] = $keyword;
	$_SESSION['bsn_id'] = $bsn_id;
	$fwViewData['keyword'] = $_SESSION['keyword'];
elseif ($_SESSION['keyword']):
	$where .= " AND business_qa.bqa_bsn_id  = " . $_SESSION['bsn_id'];
	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;
$clearsearch = $fwRequest->getParam('clearsearch', '');
if (!empty($clearsearch)) {
	unset($fwViewData['keyword']);
	unset($_SESSION['bsn_id']);
	unset($_SESSION['keyword']);
	$where = " where length(business_qa.bqa_ans)  IS NULL ";
}
$show_hidden = $fwRequest->getParam('show_hidden', '');
if (!empty($show_hidden)) {
	$where  = " where 1 = 1 ";
}

$sql = " SELECT business_qa.*, business.bsn_name FROM `business_qa`
         Inner JOIN business ON business_qa.bqa_bsn_id=business.bsn_id "
	. $where . " AND bqa_from_pae = 1 order by  business_qa.bqa_ans IS NULL DESC, business_qa.bqa_created_date ASC";
$data = $fwDb->query($sql);
foreach ($data as $k => $v) {
	$sql2 = "select bcust_fname,bcust_lname from bus_customers where bcust_id = " . $v['bqa_cust_id'];
	$custData = $fwDb->queryOne($sql2);
	$data[$k]['bcust_fname'] = $custData['bcust_fname'];
	$data[$k]['bcust_lname'] = $custData['bcust_lname'];

	$data[$k]['answer_user'] = '';
	if($v['bqa_ans_user_id']){
		$sql3 = "SELECT user_username FROM `users` WHERE `user_id` = " . $v['bqa_ans_user_id'];
		$usrData = $fwDb->queryOne($sql3);
		$data[$k]['answer_user'] = $usrData['user_username'];
	}
	
}
$fwViewData['list'] = $data;
$fwViewData['title'] = $MODULE_PLURAL;
