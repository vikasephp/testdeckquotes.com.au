<?php

//define( 'DB_NAME', 'constructioncale_db' );
///** Database username */
//define( 'DB_USER', 'constructioncale_dbnew' );
//
///** Database password */
//define( 'DB_PASSWORD', ')KE88FLyPOI#' );
//
//
//$servername = "localhost";
//$username = "constructioncale_dbnew";
//$password = ")KE88FLyPOI#";
//$dbname = "constructioncale_db";
//$conn = new mysqli($servername, $username, $password,$dbname);
//
//// Check connection
//if ($conn->connect_error) {
//  die("Connection failed: " . $conn->connect_error);
//}
////echo "Connected successfully";

$table = new Fw_Db_Table('business_sellers');
$tableCustomer = new Fw_Db_Table('bus_customers');
$tablestatus = new Fw_Db_Table('busness_status');
$pagenum = $fwRequest->getparamget('pagenum', 0);

//$ord =  " ORDER BY if( lb_date = ' '
//        OR lb_date IS  NULL , 0, 1 ) , STR_TO_DATE( lb_date, '%d-%m-%Y' ) DESC ";

$whereClauses = [];
//$where = " WHERE ( business.bsn_status like '%|2|%' Or  business.bsn_status like '%|12|%' ) ";

//$hidden = $fwRequest->getParam('hidden', '');
//	if(!empty($hidden)) {
//	$where = " WHERE business.bsn_status like '%|3|%'";	
//}

$unhide = $fwRequest->getParam('unhide', '');
$whereClauses[] = ' WHERE ' . ($unhide ? ' 1=1' : 'bsn_dpcr_hide = 0');

$block = $fwRequest->getParam('block', '');
if ($block) {
	$keys_2 = array_keys($block);
	$ky_2 = $keys_2[0];
	$val_2 = $block[$ky_2];
	$detail['bcust_pcr_block'] = $val_2;

	$tableCustomer->setWhere("bcust_id = " . $ky_2);
	if ($tableCustomer->rowExists()) {
		$this_id = $tableCustomer->updateRow($detail);
	}
}

$audit = $fwRequest->getParam('audit', '');
if ($audit) {
	$keys_2 = array_keys($audit);
	$ky_2 = $keys_2[0];
	$val_2 = $audit[$ky_2];

	$detail['bs_audit_block'] = $val_2;
	$detail['bs_audit_by'] = $_SESSION['user']['user_id'];
	$detail['bs_audit_date_time'] = date('Y-m-d H:i:s');

	$table->setWhere("bs_business_id = '$ky_2'");
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$searchkey = $fwRequest->getParam('searchkey', '');
$designerName = $fwRequest->getParam('designerName', '');
$filterStatus = $fwRequest->getParam('filterStatus', '');

if ($filterStatus) {
	$_SESSION['filterStatus'] = $filterStatus;
	$fwViewData['filterStatus'] = $filterStatus;
	$whereClauses[] = " business.bsn_status LIKE '%|" . $filterStatus . "|%'";
} elseif (!empty($_SESSION['filterStatus'])) {
	$fwViewData['filterStatus'] = $_SESSION['filterStatus'];
	$whereClauses[] = " business.bsn_status LIKE '%|" . $_SESSION['filterStatus'] . "|%'";
} else {
	$whereClauses[] = " ( business.bsn_status like '%|2|%' Or  business.bsn_status like '%|12|%' ) ";
}

if ($searchkey) {
	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey'] = $searchkey;
	$whereClauses[] = " business.bsn_name LIKE '%" . $searchkey . "%'";
} elseif (!empty($_SESSION['searchkey'])) {
	$fwViewData['searchkey'] = $_SESSION['searchkey'];
	$whereClauses[] = " business.bsn_name LIKE '%" . $_SESSION['searchkey'] . "%'";
}

if ($designerName) {
	$_SESSION['designerName'] = $designerName;
	$fwViewData['designerName'] = $designerName;
	$whereClauses[] = " person_responsible_detail.prd_name LIKE '%" . $designerName . "%'";
} elseif (!empty($_SESSION['designerName'])) {
	$fwViewData['designerName'] = $_SESSION['designerName'];
	$whereClauses[] = " person_responsible_detail.prd_name LIKE '%" . $_SESSION['designerName'] . "%'";
}

if (!empty($whereClauses)) {
	$where .= "" . implode(" AND ", $whereClauses);
}

$clearsearch = $fwRequest->getParam('clearsearch', '');
if (!empty($clearsearch)) {
	unset($fwViewData['searchkey']);
	unset($_SESSION['searchkey']);
	unset($fwViewData['filterStatus']);
	unset($_SESSION['filterStatus']);
	unset($fwViewData['designerName']);
	unset($_SESSION['designerName']);
	$where = " WHERE (business.bsn_status like '%|2|%' Or business.bsn_status like '%|12|%') AND bsn_dpcr_hide = 0";
}

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($fwViewData['callinked']);
	unset($_SESSION['callinked']);
	$where = " WHERE business.bsn_status like '%|3|%' and business_sellers.bs_cdr_hide = 0 ";
}

$matsql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
           bus_customers.bcust_misc_email1, bus_customers.bcust_misc_moble, business.bsn_id,business.project_type, business.bsn_name, bus_customers.bcust_id, 
		   business_sellers.bs_cdr_ss_link, business_sellers.bs_cdr_cc_link, business_sellers.bs_cdr_hide, business.bsn_status,
		   business_sellers.bs_cdr_cal_linked , business_sellers.bs_cdr_cal_lin_date, business_sellers.bs_cdr_cal_lin_user, bus_customers.bcust_pcr_block, business_sellers.bs_audit_block, business_sellers.bs_audit_by, business_sellers.bs_audit_date_time, person_responsible_detail.*, business.bsn_dpcr_hide, business.bsn_pa_design_flag, business.bsn_pa_planning_flag, business.bsn_pa_inclusion_flag, business.bsn_pa_construction_flag, business.bsn_pa_completion_flag, business.bsn_planning_last_login_date
		   from business_sellers
		   Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
		   Inner Join person_responsible_detail ON business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id
		   Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " AND person_responsible_detail.prd_position = 'Designer' order by business_sellers.bs_business_id ";


if ($matsql) {
	$userData = $fwDb->query($matsql);
}

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
	$page_rows = 400;
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

		//foreach ($lists as $key => $list) {
		//	    $post_id = $list['bsn_id']; $list['ready_email_status'] = "NO";
		//	    $sql = "SELECT * FROM wp_events_email_status where project_id = '".$post_id."'";
		//        $result = $conn->query($sql);
		//        
		//        if ($result->num_rows > 0) {
		//          // output data of each row
		//          while($row = $result->fetch_assoc()) {
		//            $email_status = $row["email_status"] ;
		//            if( $email_status == 1 ){ $list['ready_email_status'] = "YES"; }
		//          }
		//        }
		//
		//		$listsnew[] = $list;
		//     }
	}
}

foreach ($lists as $k => $v) {
	$status_string = "'" . $v['bsn_status'] . "'";
	$status = '';
	$project_type = trim($v['project_type']);
	$bsn_name = trim($v['bsn_name']);
	$bsn_name_arr = explode("-", $bsn_name);
	if (!empty($project_type)) {
		//  echo $project_type;
		if (count($bsn_name_arr) >= 2) {
			$lists[$k]['bsn_name'] = $project_type . " - " . $bsn_name_arr[1];
		} else {
			$lists[$k]['bsn_name'] = $project_type . " - " . $bsn_name;
		}
	}

	if (strpos($status_string, '|1|') > 0) {
		$status .= "Convert<br>";
	}
	if (strpos($status_string, '|2|') > 0) {
		$status .= "Planning Approvals<br>";
	}
	if (strpos($status_string, '|3|') > 0) {
		$status .= "Construction<br>";
	}
	if (strpos($status_string, '|4|') > 0) {
		$status .= "Complete<br>";
	}
	if (strpos($status_string, '|5|') > 0) {
		$status .= "Inclusions<br>";
	}
	if (strpos($status_string, '|6|') > 0) {
		$status .= "Pre-construction<br>";
	}
	if (strpos($status_string, '|12|') > 0) {
		$status .= "Design Phase<br>";
	}
	if (strpos($status_string, '|15|') > 0) {
		$status .= "Lost";
	}

	$link = $BASE_URL . "business.detail/bsn_id/" . $v['bs_business_id'];


	$sqlus = "select count(*) as users from business_sellers where bs_business_id = " . $v['bs_business_id'];
	$udata = $fwDb->queryOne($sqlus);

	$ckhlist_sqlus = "SELECT document_proposal_name.checklist_status, document_proposal_name.dpn_id,document_proposal_name.dpn_bsn_id,document_proposal_name.dpn_name,document_proposal_name.dpn_unique_id FROM `document_proposal_name` where dpn_bsn_id =" . $v['bs_business_id'];
	$ckhlist_sqlus_r = $fwDb->query($ckhlist_sqlus);

	$lists[$k]['status'] =  $status;
	$lists[$k]['link'] =  $link;
	//$lists[$k]['customer_link'] =  $BASE_URL . "customer.detail/bcust_id/" . $v['bcust_id'];
	$lists[$k]['customer_link'] = 'https://planningapprovalscanberra.com.au/project/design-phase/' . $v['bs_business_id'];
	$lists[$k]['users'] =  $udata['users'];
	$lists[$k]['last_logged_on'] = strtotime($v['bsn_planning_last_login_date']) > 0 ? date('d-m-Y h:i:sa', strtotime($v['bsn_planning_last_login_date'])) : '';
	$lists[$k]['checklist'] =  $ckhlist_sqlus_r;
	$lists[$k]['audit_user_name'] = $_SESSION['user']['user_name'];
	$lists[$k]['audit_date'] = $v['bs_audit_block'] == 1 ? date('d-m-Y', strtotime($v['bs_audit_date_time'])) : '';
}

$fwViewData['list'] = $lists;
$fwViewData['title'] = "Design Phase Customer Report";

$tablestatus->setOrderBy('st_id' . ' ASC');
$fwViewData['business_status'] = $tablestatus->getAllRows();

$sqlA = "select * from calendar_linked_admin";
$fwViewData['cal_linked'] = $fwDb->query($sqlA);
