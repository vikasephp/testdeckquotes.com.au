<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$keyword = $fwRequest->getParam('keyword', '');
$searchaddr = $fwRequest->getParam('searchaddr', '');
$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000, 999999);

$saverating = $fwRequest->getParam('saverating', '');
$clear = $fwRequest->getParam('clear', '');

$searchkey = $fwRequest->getParam('searchkey', '');

if ($saverating) {

	$rating = $fwRequest->getParam('rating', '');

	foreach ($rating as $kid => $vid) {
		$ratingData['bsn_rating'] = $vid;
		$table = new Fw_Db_Table('business');
		$table->setWhere('bsn_id = ' . $kid);
		$detail = $table->updateRow($ratingData);
	}
}


if ($keyword):
	$where .= "AND business.bsn_sub_status LIKE '%" . $keyword . "%'";

	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];

elseif ($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_sub_status LIKE '%" . $_SESSION['keyword'] . "%'";

	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;

if ($searchkey):

	$where .= " AND business.bsn_address LIKE '%" . $searchkey . "%'";

	$_SESSION['searchkey'] = $searchkey;
	$fwViewData['searchkey'] = $_SESSION['searchkey'];

elseif ($_SESSION['searchkey'] && $pagenum > 0):

	$where .= " AND business.bsn_address LIKE '%" . $_SESSION['searchkey'] . "%'";

	$fwViewData['searchkey'] = $_SESSION['searchkey'];
endif;

if ($clear) {
	unset($_SESSION['searchkey']);
	$_SESSION['searchkey'] = '';
	$searchkey = '';
	$fwViewData['searchkey'] = '';
	$where = "WHERE 1=1 ";
}




if (empty($pagenum)) {
	unset($_SESSION['last_tdsql']);
}


$sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address, business.bsn_advert_text, business.bsn_rating	from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  "
	. $where . " And business.bsn_sub_status IN ('Open','Hold') Order By business.bsn_status_sys_date DESC";


if ($sql) {
	$userData = $fwDb->query($sql);
}

$fwViewData['total2'] = sizeof($userData);


if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}

	$rows = count($userData);

	$page_rows = 300;
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

		$setdata = $fwDb->query($sql2);

		foreach ($setdata as $k => $v) {
			$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
			$data = $fwDb->queryOne($sqla);
			$link = "http://www.deckquotes.com.au/business.detail/bsn_id/" . $v['bsn_id'];
			$dayscount = '';

			// Uid 414 par delivery

			$sqluid414 = "Select business_tasks.* from business_tasks
				             where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 414";

			$pardel414 = $fwDb->queryOne($sqluid414);

			$pardel = changedate_y_m_d($pardel414['bt_completed_date']);


			$Statusdate = changedate_y_m_d($pardel414['bt_completed_date']);

			if (!empty($pardel)) {
				$curdate_y_m_d = date('Y-m-d');
				$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
			}


			// Uid 476 starts

			$sqlrm = "Select recorded_meeting.* from recorded_meeting
				          where recorded_meeting.rm_bus_id = " . $v['bsn_id'];
			$datarm = $fwDb->query($sqlrm);


			// Uid 476 ends


			// Uid 40 planning assessment report

			$sql44 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
			$data44 = $fwDb->queryOne($sql44);

			// Uid 40 ends


			// Phone follow ups

			$sqlalert = "Select count(*) as tot from  business_alert
		         where be_business_id = " . $v['bsn_id'] . " AND business_alert.be_alert_active = 'Yes' ";
			$alertData = $fwDb->queryOne($sqlalert);

			// Last follow up date

			$lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = " . $v['bsn_id'];
			$lfdData = $fwDb->queryOne($lfd);
			// Last follow up date ends

			$setdata2[$k]['bsn_id'] = $v['bsn_id'];
			$setdata2[$k]['bsn_address'] = $v['bsn_address'];
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['pardel'] = $pardel;
			$setdata2[$k]['dayscount'] = $dayscount;
			$setdata2[$k]['bsn_advert_text'] = $v['bsn_advert_text'];

			$setdata2[$k]['bsn_rating'] = $v['bsn_rating'];

			$setdata2[$k]['datarm'] = $datarm;

			$setdata2[$k]['dayscount'] = $dayscount;

			$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
			$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];

			$setdata2[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
			$setdata2[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
			$setdata2[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
			$setdata2[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
			$setdata2[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
		}


		foreach ($setdata2 as $key => $row) {
			// replace 0 with the field's index/key
			$dates[$key]  = $row['dayscount'];
		}
		array_multisort($dates, SORT_ASC, $setdata2);

		$fwViewData['list'] =  $setdata2;

		$report = new Fw_Db_Table('report_post_par');
		$report->setWhere("1=1");
		$report->deleteRows();

		foreach ($setdata2 as $rk => $rv) {
			if (!empty($rv['bsn_id'])) {
				$detailrp['re_bsn_id'] = $rv['bsn_id'];
				$this_id = $report->insertRow($detailrp);
			}
		}
	}
}

//$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Post Par Report";

$submitdownload = $fwRequest->getParam('download', '');
if ($submitdownload) {
	$pdfData = $fwRequest->getParam('pdf', []);
	// db($pdfData, 'pdfData');
	if ($pdfData) {
		$data = '(';
		foreach ($pdfData as $k1 => $v1) {
			$data .= $k1 . ",";
		}
		$data .= "0)";
	}

	// db($data, 'data');

	$html = '';

	/* $sql = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address, business.bsn_advert_text, business.bsn_rating	from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  "
	. $where . " And business.bsn_sub_status IN ('Open','Hold') Order By business.bsn_status_sys_date DESC"; */

	echo $sqlP = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business,
		bus_customers.bcust_misc_home,business.bsn_advert_text, business.bsn_id, business.bsn_name,  business.bsn_sub_status,
		business.bsn_status_sys_date, business.bsn_address, business.bsn_advert_text, business.bsn_rating	from business_sellers 		
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id  "
		. $where . " And business.bsn_sub_status IN ('Open','Hold') And business.bsn_id IN " . $data . " Order By business.bsn_status_sys_date DESC";

	if ($sqlP) {
		$userDataP = $fwDb->query($sqlP);
	}

	$setdataP = [];
	// db($userDataP, 'userDataP'); die();
	foreach ($userDataP as $k => $v) {
		$Statusdate = '';
		$dayscount = '';
		$sqla = "Select document_check_list.* from document_check_list
			      where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 64";
		$data = $fwDb->queryOne($sqla);
		$link = "https://www.deckquotes.com.au/business.detail/bsn_id/" . $v['bsn_id'];


		// Uid 414 par delivery

		$sqluid414 = "Select business_tasks.* from business_tasks
						 where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 414";

		$pardel414 = $fwDb->queryOne($sqluid414);

		$pardel = changedate_y_m_d($pardel414['bt_completed_date']);


		$Statusdate = changedate_y_m_d($pardel414['bt_completed_date']);

		if (!empty($pardel)) {
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}



		$sqluid476 = "Select business_tasks.* from business_tasks
			              where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 476";
		$data476 = $fwDb->queryOne($sqluid476);



		$sql44 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 44";
		$data44 = $fwDb->queryOne($sql44);


		$sqlalert = "Select count(*) as tot from  business_alert
		         where be_business_id = " . $v['bsn_id'] . " AND business_alert.be_alert_active = 'Yes' ";
		$alertData = $fwDb->queryOne($sqlalert);


		$lfd = "Select max(sf_date) as last_followup_date from  sales_followup where sf_pid = " . $v['bsn_id'];
		$lfdData = $fwDb->queryOne($lfd);

		$sql45 = "Select document_check_list.* from document_check_list
			          where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 45";
		$data45 = $fwDb->queryOne($sql45);


		$setdataP[$k]['bsn_id'] = $v['bsn_id'];
		$setdataP[$k]['bsn_address'] = $v['bsn_address'];

		$setdataP[$k]['link'] = $link;
		$setdataP[$k]['pardel'] = $pardel;
		$setdataP[$k]['bsn_advert_text'] = $v['bsn_advert_text'];

		$setdataP[$k]['dayscount'] = $dayscount;
		$setdataP[$k]['bsn_rating'] = $v['bsn_rating'];

		$setdataP[$k]['bcust_fname'] = $v['bcust_fname'];
		$setdataP[$k]['bcust_lname'] = $v['bcust_lname'];
		$setdataP[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
		$setdataP[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
		$setdataP[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
		$setdataP[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
		$setdataP[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
	}




	foreach ($setdataP as $key => $row) {
		// replace 0 with the field's index/key
		$dates[$key]  = $row['dayscount'];
	}
	array_multisort($dates, SORT_ASC, $setdataP);


	$html .= '<table class="first" cellpadding="5" border="1" style="border:1px solid #CCC">';
	$html .= "<tr>";
	$html .= "<th>Address</th><th>Customer</th> <th>Appointment<br>Date</th><th>Day Count</th><th>Star Rating</th><th>Budget</th>";
	$html .= "</tr>";

	foreach ($setdataP as $k => $v) {
		$html .= "<tr>";
		$html .= "<td>" . $v['bsn_address'] . "</td>";
		$html .= "<td>" . $v['bcust_fname'] . " " . $v['bcust_lname'] . "</td>";
		$html .= "<td>" .  $v['pardel'] . "</td>";
		$html .= "<td>" .  $v['dayscount'] . "</td>";
		$html .= "<td>" . $v['bsn_rating'] . "</td>";
		$html .= "<td>" . $v['bsn_advert_text'] . "</td>";

		$html .= "</tr>";
	}
	$html .= "</table>";

	$heading = "Post Par Report";
	$fname = "";


	create_par_report($heading, $html, $fname);
}
