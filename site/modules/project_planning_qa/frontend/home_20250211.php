<?php
//$servername = "localhost";
//$username = "deckquotescom_deckquote";
//$password = "DOG&fI#QQ3g!";
//$dbname = "deckquotescom_deckquot8thFeb";
//
//
//$mysqli = new mysqli($servername, $username, $password, $dbname);
//
//
//if ($mysqli->connect_errno) {
//    echo "Failed to connect to MySQL: " . $mysqli->connect_error;
//    exit();
//}

$table = new Fw_Db_Table('planning_approval_enquiries');
$tableqa = new Fw_Db_Table('business_qa');

$linked = $fwRequest->getParam('linked', '');
if ($linked) {
	$keys_2 = array_keys($linked);
	$ky_2 = $keys_2[0];
	$val_2 = $linked[$ky_2];

	$detail['linked_to_ccw'] = $val_2;
	$detail['linked_user'] = $_SESSION['user']['user_name'];
	$detail['linked_date'] = date('d-m-Y');
	$table->setWhere("id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$merge = $fwRequest->getParam('merge', '');
if ($merge) {
	$keys_2 = array_keys($merge);
	$ky_2 = $keys_2[0];
	$val_2 = $merge[$ky_2];

	$detail['merge'] = $val_2;
	$table->setWhere("id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}



	if ($val_2 == 1) {

		$sql2 = "SELECT planning_approval_enquiries.*,business.bsn_name,business_sellers.bs_customers_id,construction_calendar_events.text as 		event_text,construction_calendar_events.start_date,construction_calendar_events.end_date FROM `planning_approval_enquiries` LEFT JOIN construction_calendar_events ON planning_approval_enquiries.event_id=construction_calendar_events.id LEFT JOIN business ON planning_approval_enquiries.project_id=business.bsn_id INNER JOIN business_sellers ON planning_approval_enquiries.project_id=business_sellers.bs_business_id where planning_approval_enquiries.id = " . $ky_2;

		$quedata = $fwDb->queryOne($sql2);

		$sqlmx = "select max(bqa_unique_id) as bqa_unique_id from business_qa";
		$uni = $fwDb->queryOne($sqlmx);
		$ui = $uni['bqa_unique_id'] + 1;

		$qdetail['bqa_unique_id'] = $ui;
		$qdetail['bqa_bsn_id']  = $quedata['project_id'];
		$qdetail['bqa_cust_id'] = $quedata['bs_customers_id'];
		$qdetail['bqa_que'] = $quedata['enquiry'];
		$qdetail['bqa_ans'] = $quedata['solution'];
		$qdetail['bqa_plain_ans'] = $quedata['solution'];
		$qdetail['bqa_created_date'] = $quedata['created_at'];
		$qdetail['bqa_ans_date'] =  $quedata['updated_at'];
		$qdetail['bqa_from_pqa'] = $quedata['id'];


		$opr = $tableqa->insertRow($qdetail);
	} else {

		$tableqa->setWhere('bqa_from_pqa = ' . $ky_2);
		$tableqa->deleteRow();
	}
}

$where  = " where length(planning_approval_enquiries.solution) IS NULL ";

$keyword = $fwRequest->getParam('searchkey', '');

if (!empty(trim($keyword))):


	$sql2 = "select bsn_id from business where bsn_name like '%" . $keyword . "%'";
	$bsnid = $fwDb->queryOne($sql2);
	$bsn_id = $bsnid['bsn_id'];

	$where .= " AND planning_approval_enquiries.project_id = " . $bsn_id;

	$_SESSION['keyword'] = $keyword;
	$_SESSION['bsn_id'] = $bsn_id;
	$fwViewData['keyword'] = $_SESSION['keyword'];

elseif ($_SESSION['keyword']):

	$where .= " AND planning_approval_enquiries.project_id  = " . $_SESSION['bsn_id'];
	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;

$clearsearch = $fwRequest->getParam('clearsearch', '');

if (!empty($clearsearch)) {
	unset($fwViewData['keyword']);
	unset($_SESSION['bsn_id']);
	unset($_SESSION['keyword']);
	$where = " where length(planning_approval_enquiries.solution)  IS NULL ";
}

$show_hidden = $fwRequest->getParam('show_hidden', '');
if (!empty($show_hidden)) {
	$where  = " where 1 = 1 ";
}

//$sql = "SELECT planning_approval_enquiries.*,business.bsn_name,business_sellers.bs_customers_id FROM `planning_approval_enquiries` 
//LEFT JOIN business ON planning_approval_enquiries.project_id=business.bsn_id 
//INNER JOIN business_sellers ON planning_approval_enquiries.project_id=business_sellers.bs_business_id " .$where ."
//order by  planning_approval_enquiries.solution IS NULL DESC, planning_approval_enquiries.created_at ASC";

$sql = " SELECT planning_approval_enquiries.*, business.bsn_name FROM `planning_approval_enquiries`
         Inner JOIN business ON planning_approval_enquiries.project_id=business.bsn_id "
	. $where . " order by  planning_approval_enquiries.solution IS NULL DESC, planning_approval_enquiries.created_at ASC";


$data = $fwDb->query($sql);

foreach ($data as $k => $v) {
	$sql2 = "select bcust_fname,bcust_lname from bus_customers where bcust_id = " . $v['user_id'];
	$custData = $fwDb->queryOne($sql2);
	$data[$k]['bcust_fname'] = $custData['bcust_fname'];
	$data[$k]['bcust_lname'] = $custData['bcust_lname'];
}


$fwViewData['list'] = $data;

$fwViewData['title'] = $MODULE_PLURAL;
