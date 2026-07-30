<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('business_sellers');

$fwViewData['ran'] =  rand(100000, 999999);
$where = ' Where bs_sales_phase_hide = 0 ';


$hidden = $fwRequest->getParam('hidden', '');
if (!empty($hidden)) {
	$where = " WHERE 1 = 1";
}

$hide = $fwRequest->getParam('hide', '');
if ($hide) {
	$keys_2 = array_keys($hide);
	$ky_2 = $keys_2[0];
	$val_2 = $hide[$ky_2];

	$detail['bs_sales_phase_hide'] = $val_2;
	$table->setWhere("bs_business_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

$sales = $fwRequest->getParam('sales', '');
if ($sales) {
	$keys_2 = array_keys($sales);
	$ky_2 = $keys_2[0];
	$val_2 = $sales[$ky_2];

	$detail['bs_sales_phase_sales'] = $val_2;
	$table->setWhere("bs_business_id = " . $ky_2);
	if ($table->rowExists()) {
		// $this_id = $table->updateRow($detail);

		$bsnTable = new Fw_Db_Table('business');
		$bsnTable->setWhere("bsn_id = " . $ky_2);
		if ($bsnTable->rowExists()) {
			$bsnTable->updateRow([
				'bsn_pa_sales_flag' => $val_2
			]);
		}
	}
}

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($_SESSION['address']);

	$where = " where 1 = 1";
}

$address = $fwRequest->getParam('address', '');
if ($address):

	$where .= " AND business.bsn_name LIKE '%" . $address . "%'";

	$_SESSION['address'] = $address;
//$fwViewData['address']=$_SESSION['address'];

elseif ($_SESSION['address']):

	$where .= " AND business.bsn_name LIKE '%" . $_SESSION['address'] . "%' ";

	$fwViewData['address'] = $_SESSION['address'];
endif;

// $qry = 'SELECT lu_user_id, MAX(lu_login_date_time) AS last_login FROM `logged_users` GROUP BY lu_user_id;';
// $res = $fwDb->query($qry);
// $lastLoginArr = [];
// foreach ($res as $row) {
// 	$lastLoginArr[$row['lu_user_id']] = $row['last_login'];
// }
// $fwViewData['lastLoginArr'] = $lastLoginArr;
// db($lastLoginArr);

$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status, business.bsn_address, business.bsn_type, 
		bus_customers.bcust_id, bus_customers.bcust_user_id, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_email1, business_sellers.bs_sales_phase_hide, business_sellers.bs_sales_phase_sales, business.bsn_pa_sales_flag, business.bsn_planning_last_login_date
		from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id " . $where . " 
		And   business.bsn_status like '%|1|%'  " . " order by business.bsn_status_sys_date DESC" ;


if ($sql) {
	$userData = $fwDb->query($sql);
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
	$numstartvounter =  $page_rows * ($pagenum - 1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;

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

	$sql2 =  $sql . " " . $max;

	if ($sql2) {

		$setdata2 = $fwDb->query($sql2);

		foreach ($setdata2 as $k => $v) {

			$status_string = "'" . $v['bsn_status'] . "'";
			$status = '';

			if (strpos($status_string, '|1|') > 0) {
				$status .= "Convert<br>";
			}
			if (strpos($status_string, '|2|') > 0) {
				$status .= "Planning Approvals<br>";
			}
			if (strpos($status_string, '|3|') > 0) {
				$status .= "Construction<br>";
			}
			if (strpos($status_string, '|5|') > 0) {
				$status .= "Inclusions<br>";
			}
			if (strpos($status_string, '|6|') > 0) {
				$status .= "Pre Construction<br>";
			}

			$sql = "select pt_name from project_type where pt_id = " . $v['bsn_type'];
			$typedata = $fwDb->queryOne($sql);


			$link = "http://www.deckquotes.com.au/business.detail/bsn_id/" . $v['bsn_id'];

			$sqlus = "select count(*) as users from business_sellers where bs_business_id = " . $v['bs_business_id'];
			$udata = $fwDb->queryOne($sqlus);


			$setdata2[$k]['link'] = $link;

			$setdata2[$k]['status'] = $status;
			$setdata2[$k]['pt_name'] = $typedata['pt_name'];
			$setdata2[$k]['users'] =  $udata['users'];

			$setdata2[$k]['last_logged_on'] = strtotime($v['bsn_planning_last_login_date']) > 0 ? date('d-m-Y h:i:sa', strtotime($v['bsn_planning_last_login_date'])) : '';
		}

		$filter_comp = $fwRequest->getParam('filter_comp', '');
		if (!empty($filter_comp)) {
			foreach ($setdata2 as $m1 => $s1) {
				$pos = strpos($s1['status'], 'Complete', 0);
				if (!is_numeric($pos)) {
					unset($setdata2[$m1]);
				}
			}
		}

		$filter_const = $fwRequest->getParam('filter_const', '');
		if (!empty($filter_const)) {
			foreach ($setdata2 as $m1 => $s1) {
				$pos = strpos($s1['status'], 'Construction', 0);
				if (!is_numeric($pos)) {
					unset($setdata2[$m1]);
				}
			}
		}


		$fwViewData['list'] =  $setdata2;
	}
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Sales Phase Logon";
