<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$keyword = $fwRequest->getParam('keyword', '');
$table = new Fw_Db_Table('incl_tracker_docs');
$submit = $fwRequest->getParam('weeklydoc', '');
$tableBusiness = new Fw_Db_Table('business');
$table = new Fw_Db_Table('business_sellers');
$tableBus_task = new Fw_Db_Table('business_tasks');

// Add Task Starts
$add_task = $fwRequest->getParam('add_task', '');
if (!empty($add_task)) {

	$sqlta =  "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, business.bsn_id
			  from business_sellers 		
			  Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			  Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
			  Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
			  person_responsible_detail.prd_prm_id = 10 
			  left join incl_tracker_docs ON business_sellers.bs_business_id = incl_tracker_docs.it_bsn_id
			  WHERE  business.bsn_status like '%|5|%' 
			  Group By business.bsn_id 
			  Order By business.bsn_status_sys_date DESC";

	$bsndata = $fwDb->query($sqlta);


	$sql_gettasks = "SELECT  st.st_id, st.st_name, bst.bst_id, bst.bst_business_types, bst.bst_task_name 
					FROM busness_status as st
					LEFT JOIN busness_status_task as bst
					ON st.st_id = bst.bst_business_status_id
					WHERE st.st_id = 5";

	$tasksOfstatus = $fwDb->query($sql_gettasks);


	foreach ($bsndata as $k => $v) {
		foreach ($tasksOfstatus as $k2 => $v2) {
			$tableBus_task->setWhere("bt_bsn_id = " . $v['bsn_id'] . " and bt_task_status_id = 5 and bt_task_id = " . $v2['bst_id']);

			if (!$tableBus_task->rowExists()) {
				$detail['bt_bsn_id'] = $v['bsn_id'];
				$detail['bt_task_status_id'] = 5;
				$detail['bt_task_id'] = $v2['bst_id'];

				$tableBus_task->insertRow($detail);
			}
		}
	}
}

// Add Tasks Ends



$savedata = $fwRequest->getParam('savedata', '');
if ($savedata) {

	if ($_FILES['in_letter']) {

		$bsn_id = $fwRequest->getParam('bsn_id', '');

		$doc1 = $_FILES['in_letter']['name'];
		$file_type = $_FILES['in_letter']['type'];


		$datetime = trim(date('d_m_Y_H_i_'), '0');
		$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
		$src =  $_FILES['in_letter']['tmp_name'];


		upload($doc1, $src);
		$letterData['bc_incl_letter'] = $doc1;


		$table->setWhere('bs_business_id = ' . $bsn_id);
		if ($table->rowExists()) {

			$detail = $table->updateRow($letterData);
		}
	}
}



// Save commencement_date
$ccd = $fwRequest->getParam('bsn_incl_cc_date', '');
if (!empty($ccd)) {
	$cc_date = $fwRequest->getParam('bsn_incl_cc_date', '');

	foreach ($cc_date as $kc => $vc) {
		$ccdDetail['bsn_incl_cc_date'] = $vc;

		$tableBusiness->setWhere('bsn_id = ' . $kc);
		$detail = $tableBusiness->updateRow($ccdDetail);
	}
}
//End commencement_date

if ($submit) {

	if ($_FILES['weekly']) {
		foreach ($_FILES['weekly']['name'] as $km => $vm) {
			if ($vm) {
				$weeklyData['it_bsn_id'] = $km;

				$doc1 = $vm;
				$file_type = $_FILES['weekly']['type'][$km];


				$datetime = trim(date('d_m_Y_H_i_'), '0');
				$doc1 = preg_replace('/[^A-Z0-9._]/i', '_', $doc1);
				$src =  $_FILES['weekly']['tmp_name'][$km];
				$destination = BASE_DIR . 'files/cma/' . $doc1;

				if (!move_uploaded_file($src, $destination)) {
					//echo "Possible file upload attack";
				} else {
					$weeklyData['it_weekly_doc'] = $doc1;
					chmod($destination, 0664);
				}

				$table->setWhere('it_bsn_id = ' . $km);
				if (!$table->rowExists()) {
					$table->insertRow($weeklyData);
				} else {
					$detail = $table->updateRow($weeklyData);
				}
			}
		}
	}
}

$sqlH = "Select distinct bst_task_id, bst_ptt_summary from busness_status_task
	where bst_business_status_id = 5 order by bst_order";
$colhead = $fwDb->query($sqlH);

$tottask = count($colhead);

$fwViewData['colhead'] = $colhead;

$searchaddr = $fwRequest->getParam('searchaddr', '');
$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000, 999999);

$search_project = $fwRequest->getParam('search_project', '');
$filter_project = $fwRequest->getParam('filter_project', '');
if($search_project && $filter_project) {
	$_SESSION['filter_project'] = $filter_project;
	$where .= ' AND business.bsn_name = "' . $filter_project . '"';
}
elseif(isset($_SESSION['filter_project']) && $_SESSION['filter_project'] != '') {
	$where .= ' AND business.bsn_name = "' . $_SESSION['filter_project'] . '"';
	$filter_project = $_SESSION['filter_project'];
}

$search_person_responsible_detail = $fwRequest->getParam('search_person_responsible_detail', '');
$filter_person_responsible_detail = $fwRequest->getParam('filter_person_responsible_detail', []);
if($search_person_responsible_detail && !empty($filter_person_responsible_detail)) {
	// db($filter_person_responsible_detail);
	$_SESSION['filter_person_responsible_detail'] = $filter_person_responsible_detail;
	$where .= ' AND person_responsible_detail.prd_name IN ("' . implode('","', $filter_person_responsible_detail) . '")';
}
elseif(isset($_SESSION['filter_person_responsible_detail']) && $_SESSION['filter_person_responsible_detail'] != '') {
	$where .= ' AND person_responsible_detail.prd_name IN ("' . implode('","', $_SESSION['filter_person_responsible_detail']) . '")';
	$filter_person_responsible_detail = $_SESSION['filter_person_responsible_detail'];
}

$clear_search = $fwRequest->getParam('clear_search', '');
if($clear_search) {
	$where = "WHERE 1=1";
	unset($_SESSION['filter_project']);
	unset($_SESSION['filter_person_responsible_detail']);
	$filter_project = '';
	$filter_person_responsible_detail = [];
}
$fwViewData['filter_project'] = $filter_project;
$fwViewData['filter_person_responsible_detail'] = $filter_person_responsible_detail;


if (!empty($searchaddr)) {
	$searchkey = $fwRequest->getParam('searchkey', '');
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

$bs_traffic_light_incl_red = $fwRequest->getParam('bs_traffic_light_incl_red', '');
if (!empty($bs_traffic_light_incl_red)) {
	$where .= " AND business_sellers.bs_traffic_light_incl = 3";
}

$bs_traffic_light_incl_amber = $fwRequest->getParam('bs_traffic_light_incl_amber', '');
if (!empty($bs_traffic_light_incl_amber)) {
	$where .= " AND business_sellers.bs_traffic_light_incl = 2";
}

$bs_traffic_light_incl_green = $fwRequest->getParam('bs_traffic_light_incl_green', '');
if (!empty($bs_traffic_light_incl_green)) {
	$where .= " AND business_sellers.bs_traffic_light_incl = 1";
}

if (empty($pagenum)) {
	unset($_SESSION['last_tdsql']);
}

$query = 'SELECT * FROM inclusions_task_tracker';
$result = $fwDb->query($query);
$inclusions_task_tracker = [];
foreach($result as $row) {
	$inclusions_task_tracker[$row['itt_bsn_id']] = $row;
}

$query = 'SELECT DISTINCT prd_name FROM person_responsible_detail WHERE prd_prm_id = 10 AND prd_name != "" ORDER BY prd_name ASC;';
$result = $fwDb->query($query);
$person_responsible_detail = [];
foreach($result as $row) {
	$row['checked'] = '';
	if(in_array($row['prd_name'], $filter_person_responsible_detail)) {
		$row['checked'] = 'checked';
	}
	$person_responsible_detail[] = $row;
}
$fwViewData['person_responsible_detail'] = $person_responsible_detail;

$sql = "SELECT business.bsn_inclusions_task_tracker_notes, business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business, bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name,  business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address, person_responsible_detail.prd_name, business.bsn_cp_incl_choices, 	business.bsn_per_complete, incl_tracker_docs.it_weekly_doc, incl_tracker_docs.it_uploaded_date, business.bsn_incl_cc_date, business_sellers.bc_incl_letter, business_sellers.bs_traffic_light_incl, bus_customers.bcust_itt_letter_text, bus_customers.bcust_itt_letter_text_by, bus_customers.bcust_itt_letter_text_at, business_sellers.bs_tl_user_incl, business_sellers.bs_tl_date_incl FROM business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
	Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
	person_responsible_detail.prd_prm_id = 10 
	left join incl_tracker_docs ON business_sellers.bs_business_id = incl_tracker_docs.it_bsn_id
	WHERE business.bsn_status like '%|5|%' 
	Group By business.bsn_id 
	Order By business.bsn_status_sys_date DESC";


if ($sql) {
	$userData = $fwDb->query($sql);
}

$bs_traffic_light_incl_red_data = 0;
$bs_traffic_light_incl_amber_data = 0;
$bs_traffic_light_incl_green_data = 0;
foreach($userData as $row) {
	if($row['bs_traffic_light_incl'] == 1) {
		$bs_traffic_light_incl_green_data++;
	}
	elseif($row['bs_traffic_light_incl'] == 2) {
		$bs_traffic_light_incl_amber_data++;
	}
	elseif($row['bs_traffic_light_incl'] == 3) {
		$bs_traffic_light_incl_red_data++;
	}
}
$fwViewData['bs_traffic_light_incl_red_data'] = $bs_traffic_light_incl_red_data;
$fwViewData['bs_traffic_light_incl_amber_data'] = $bs_traffic_light_incl_amber_data;
$fwViewData['bs_traffic_light_incl_green_data'] = $bs_traffic_light_incl_green_data;


$sql = "SELECT business.bsn_inclusions_task_tracker_notes, business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble,bus_customers.bcust_misc_business, bus_customers.bcust_misc_home,business.bsn_advert_text,  business.bsn_id, business.bsn_name,  business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address, person_responsible_detail.prd_name, business.bsn_cp_incl_choices, 	business.bsn_per_complete, incl_tracker_docs.it_weekly_doc, incl_tracker_docs.it_uploaded_date, business.bsn_incl_cc_date, business_sellers.bc_incl_letter, business_sellers.bs_traffic_light_incl, bus_customers.bcust_itt_letter_text, bus_customers.bcust_itt_letter_text_by, bus_customers.bcust_itt_letter_text_at, business_sellers.bs_tl_user_incl, business_sellers.bs_tl_date_incl
	from business_sellers 		
	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	Inner Join business ON business_sellers.bs_business_id = business.bsn_id  
	Right JOIN person_responsible_detail ON  business_sellers.bs_business_id = person_responsible_detail.prd_bsn_id And 
	person_responsible_detail.prd_prm_id = 10 
	left join incl_tracker_docs ON business_sellers.bs_business_id = incl_tracker_docs.it_bsn_id
	"
	. $where . " And  business.bsn_status like '%|5|%' 
	 Group By business.bsn_id 
	Order By business.bsn_status_sys_date DESC";


if ($sql) {
	$userData = $fwDb->query($sql);
}

$project_list = [];
$bsnIDs = [];
foreach($userData as $row) {
	$project_list[] = $row['bsn_name'];
	$bsnIDs[] = $row['bsn_id'];
}
sort($project_list);
$fwViewData['project_list'] = $project_list;

$query = 'SELECT * FROM tracker_choices_changed_log WHERE tccl_bsn_id IN (' . implode($bsnIDs, ',') . ') ORDER BY tccl_id DESC;';
$result = $fwDb->query($query);
$tracker_choices_changed_log = [];
foreach($result as $row) {
	if(!isset($tracker_choices_changed_log[$row['tccl_bsn_id']])) {
		$tracker_choices_changed_log[$row['tccl_bsn_id']] = [];
	}
	$tracker_choices_changed_log[$row['tccl_bsn_id']][] = $row;
}

$query = 'SELECT user_id, user_username FROM users';
$result = $fwDb->query($query);
$users_list = [];
foreach($result as $row) {
	$users_list[$row['user_id']] = $row['user_username'];
}

$changed_per_list = [];
foreach($userData as $row) {
	$temp_rows = $tracker_choices_changed_log[$row['bsn_id']];
	$difference_per = '';
	$color = '';
	$date = '';
	$user = '';
	if (!empty($temp_rows)) {
        $last_week_per = '';
        $this_week_per = $temp_rows[0]['tccl_changed_per'];
        $difference_per = '';
        if(isset($temp_rows[1])) {
            $last_week_per = $temp_rows[1]['tccl_changed_per'];
            $difference_per = $this_week_per - $last_week_per;
        }
		$date = date('d-M-Y', strtotime($temp_rows[0]['tccl_changed_at']));
		$user = $users_list[$temp_rows[0]['tccl_changed_by']] ?? '';
    }
	if($difference_per != '') {
		if($difference_per < 0) {
			$color = 'red';
		}
		elseif($difference_per >= 0 && $difference_per <= 4) {
			$color = 'yellow';
		}
		else {
			$color = 'green';
		}
	}

	$changed_per_list[$row['bsn_id']]['color'] = $color;
	$changed_per_list[$row['bsn_id']]['date'] = $date;
	$changed_per_list[$row['bsn_id']]['user'] = $user;
}

$fwViewData['total'] = sizeof($userData);

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
			$link  = "http://www.deckquotes.com.au/business.detail/bsn_id/" . $v['bsn_id'];
			$link2 = "http://www.documentclick.com.au/site.documents/bsn_id/" . $v['bsn_id'];


			if (!empty($data['doc_file_name'])) {
				$ccdate = $data['doc_date_uploaded'];
				$Statusdate = changedate_y_m_d($ccdate);
				$curdate_y_m_d = date('Y-m-d');
				$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
			} else {
				$ccdate = '';
				$dayscount = '';
			}

			//$ccdate = $v['bsn_status_sys_date'];
			//$Statusdate = changedate_y_m_d($ccdate);
			//$curdate_y_m_d = date('Y-m-d');
			//$dayscount = daysDifference($curdate_y_m_d, $Statusdate);


			$setdata2[$k]['bsn_id'] = $v['bsn_id'];
			$setdata2[$k]['bsn_address'] = $v['bsn_address'];
			$setdata2[$k]['bs_customers_id'] = $v['bs_customers_id'];

			$setdata2[$k]['bcust_fname'] = $v['bcust_fname'];
			$setdata2[$k]['bcust_lname'] = $v['bcust_lname'];
			$setdata2[$k]['bcust_misc_email1'] = $v['bcust_misc_email1'];
			$setdata2[$k]['bcust_misc_email2'] = $v['bcust_misc_email2'];
			$setdata2[$k]['bcust_misc_moble'] = $v['bcust_misc_moble'];
			$setdata2[$k]['bcust_misc_business'] = $v['bcust_misc_business'];
			$setdata2[$k]['bcust_misc_home'] = $v['bcust_misc_home'];
			$setdata2[$k]['prd_name'] = $v['prd_name'];
			$setdata2[$k]['link'] = $link;
			$setdata2[$k]['link2'] = $link2;
			$setdata2[$k]['dayscount'] = $dayscount;
			$setdata2[$k]['bsn_per_complete'] = $v['bsn_per_complete'];
			$setdata2[$k]['it_weekly_doc'] = $v['it_weekly_doc'];
			$setdata2[$k]['it_uploaded_date'] = $v['it_uploaded_date'];
			$setdata2[$k]['bsn_incl_cc_date'] = $v['bsn_incl_cc_date'];
			$setdata2[$k]['bc_incl_letter'] = $v['bc_incl_letter'];
			$setdata2[$k]['bs_traffic_light_incl'] = $v['bs_traffic_light_incl'];

			$setdata2[$k]['bs_tl_user_incl'] = $v['bs_tl_user_incl'];
			$setdata2[$k]['bs_tl_date_incl'] = $v['bs_tl_date_incl'];
			$setdata2[$k]['changed_per_list_color'] = $changed_per_list[$v['bsn_id']]['color'];
			$setdata2[$k]['changed_per_list_date'] = $changed_per_list[$v['bsn_id']]['date'];
			$setdata2[$k]['changed_per_list_user'] = $changed_per_list[$v['bsn_id']]['user'];

			// inserting records if not present in inclusions_task_tracker
			if(!isset($inclusions_task_tracker[$v['bsn_id']])) {
				$inclusions_task_tracker[$v['bsn_id']]['itt_letter_text'] = $v['bcust_itt_letter_text'];
				$inclusions_task_tracker[$v['bsn_id']]['itt_letter_text_at'] = $v['bcust_itt_letter_text_at'];
				$inclusions_task_tracker[$v['bsn_id']]['itt_letter_text_by'] = $v['bcust_itt_letter_text_by'];
				$temp = [
					'itt_bsn_id' => $v['bsn_id'],
					'itt_letter_text' => $v['bcust_itt_letter_text'],
					'itt_letter_text_at' => $v['bcust_itt_letter_text_at'],
					'itt_letter_text_by' => $v['bcust_itt_letter_text_by'],
				];
				$this_table = new Fw_Db_Table('inclusions_task_tracker');
				$this_table->insertRow($temp);
			}

			$setdata2[$k]['bcust_itt_letter_text'] = $inclusions_task_tracker[$v['bsn_id']]['itt_letter_text'];
			$setdata2[$k]['bcust_itt_letter_text_user'] = $users_list[$inclusions_task_tracker[$v['bsn_id']]['itt_letter_text_by']] ?? '';
			$setdata2[$k]['bcust_itt_letter_text_date'] = strtotime($inclusions_task_tracker[$v['bsn_id']]['itt_letter_text_at']) > 0 ? date('d-M-Y', strtotime($inclusions_task_tracker[$v['bsn_id']]['itt_letter_text_at'])) : '';

			$calculator = '';
			if($inclusions_task_tracker[$v['bsn_id']]['itt_calculator_link'] != '') {
				$calculator = '<a href="' . $inclusions_task_tracker[$v['bsn_id']]['itt_calculator_link'] . '" target="_blank">View</a><br><br>';
			}
			$calculator .= '<a href="' . BASE_URL . 'inclusions_task_tracker.update_calculator_link/bsn_id/' . $v['bsn_id'] . '" class="various">Edit</a>';
			$setdata2[$k]['calculator'] = $calculator;


			foreach ($colhead as $kh => $kv) {

				$taskid = $kv['bst_task_id'];

				$sql2 = "Select business_tasks.* from business_tasks
			     where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = " . $kv['bst_task_id'];

				$data2 = $fwDb->queryOne($sql2);

				if ($data2['bt_task_not_required'] == 1) {
					$taskdata[$taskid] = 'N / R';
				} else {
					$taskdata[$taskid] = changedate_d_m_y($data2['bt_completed_date']);
				}
			}

			$setdata2[$k]['task'] = $taskdata;


			$sql3 = "Select count(*) as cnt_1 from business_tasks
			 inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
			where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And bt_complete = 1 And business_tasks.bt_task_status_id = 5";

			$data3 = $fwDb->queryOne($sql3);

			$percomp = round($data3['cnt_1'] / $tottask * 100);
			$setdata2[$k]['completed'] = $percomp;

			$sql4 = "Select count(*) as cnt_2 from business_tasks
			  inner join busness_status_task On business_tasks.bt_task_id = busness_status_task.bst_task_id
			  where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And bt_task_not_required = 1 
			  And business_tasks.bt_task_status_id = 5";

			$data4 = $fwDb->queryOne($sql4);
			$nr = round($data4['cnt_2'] / $tottask * 100, 2);
			$setdata2[$k]['notreq'] = $nr;
		}

		$fwViewData['list'] =  $setdata2;

		$report = new Fw_Db_Table('report_inclusion_task_tracker');
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
$fwViewData['title'] = "Inclusion Task Tracker";


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if ($export > 0) {

	for ($char = 'A'; $char <= 'Z'; $char++) {
		$col[] = $char . '1';
	}
	for ($char = 'A'; $char <= 'Z'; $char++) {
		$col2[] = $char;
	}

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";


	// Create new PHPExcel object
	$objPHPExcel = new PHPExcel();

	// Set document properties
	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Test Document")
		->setSubject("Office 2007 XLSX Test Document")
		->setDescription("Design report exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Inclusion Task Tracker");


	//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(55);
	$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(15);
	$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(15);
	$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(20);

	$objPHPExcel->getActiveSheet()->getStyle('A:H')->getAlignment()->setWrapText(true);

	$j = 8;
	foreach ($colhead as $ke => $ve) {
		$objPHPExcel->getActiveSheet()->getColumnDimension($col2[$j])->setWidth(14);
		$j++;
	}


	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Address')
		->setCellValue('B1', 'Customer Name')
		->setCellValue('C1', 'Inclusion Coordinator')
		->setCellValue('D1', 'Link')
		->setCellValue('E1', 'Letter Text')
		->setCellValue('F1', "% Of Choices Made")
		->setCellValue('G1', "Task Completed %")
		->setCellValue('H1', "Likely to Commence Construction Date");


	$i = 8;
	foreach ($colhead as $ke => $ve) {
		$objPHPExcel->setActiveSheetIndex(0)->setCellValue($col[$i], $ve['bst_task_id']);
		$i++;
	};

	$from = "A1"; // or any value
	$to = "AZ1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);


	$row = 2;
	$sr = 1;
	foreach ($setdata2 as $k => $v) {
		$cno = 8;
		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $v['bsn_address'])
			->setCellValue('B' . $row, $v['bcust_fname'] . ' ' . $v['bcust_lname'])
			->setCellValue('C' . $row, $v['prd_name'])
			->setCellValue('D' . $row, $v['link'])
			->setCellValue('E' . $row, $v['bcust_itt_letter_text'])
			->setCellValue('F' . $row, $v['bsn_per_complete'])
			->setCellValue('G' . $row, $v['completed'])
			->setCellValue('H' . $row, $v['bsn_incl_cc_date']);

		foreach ($setdata2[$k]['task'] as $kc => $vc) {

			//db($vc);	
			$objPHPExcel->getActiveSheet()->setCellValue($col2[$cno] . $row, $vc);
			$cno++;
		}



		$row = $row + 1;
		$sr = $sr + 1;
	}

	// Rename worksheet
	$objPHPExcel->getActiveSheet()->setTitle('Inclusion Task Tracker');

	// Set active sheet index to the first sheet, so Excel opens this as the first sheet
	$objPHPExcel->setActiveSheetIndex(0);

	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="inclusion_task_tracker.xls"');
	header('Cache-Control: max-age=0');
	// If you're serving to IE 9, then the following may be needed
	header('Cache-Control: max-age=1');

	// If you're serving to IE over SSL, then the following may be needed
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
	header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header('Pragma: public'); // HTTP/1.0

	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;
}

// Print Task

$bus_id = $fwRequest->getParam('print', 0);

if ($bus_id > 0) {
	$sql1 = "select business.bsn_name from business where bsn_id = " . $bus_id;
	$busdata = $fwDb->queryOne($sql1);

	$sqlT = "select * from busness_status_task where bst_business_status_id = 5 order by  bst_order";
	$taskdata = $fwDb->query($sqlT);

	foreach ($taskdata as $tk => $tv) {

		$sqlbt = "select business_tasks.*, users.user_name from business_tasks 
		Inner join users on business_tasks.bt_completed_by = users.user_id
		where bt_task_id = " . $tv['bst_task_id'] . " And bt_bsn_id = " . $bus_id;

		$taskdetail = $fwDb->queryOne($sqlbt);

		$setdata3[$tk]['bst_task_id'] = $tv['bst_task_id'];
		$setdata3[$tk]['bst_task_name'] = $tv['bst_task_name'];

		if ($taskdetail['bt_complete'] == 1) {
			$comp = 'Yes';
		} else {
			$comp = 'No';
		}
		$setdata3[$tk]['bt_complete'] = $comp;

		if ($taskdetail['bt_complete'] == 1) {
			$setdata3[$tk]['bt_completed_date'] = $taskdetail['bt_completed_date'];
		} else {

			$setdata3[$tk]['bt_completed_date'] =  '';
		}
		$setdata3[$tk]['user_name'] = $taskdetail['user_name'];
	}


	$html = "<html><body><h1>" . $busdata['bsn_name'] . "</h1><br>";
	$html .= '<table border="1" cellpadding="5">
		  <tr><th style="width:6%;"><strong>UID</strong></th><th style="width:58%;"><strong>Task Name</strong></th>
	          <th style="width:8%;"><strong>Complete</strong></th><th style="width:14%;"><strong>Complete Date</strong></th>
		  <th style="width:14%;"><strong>Completed By</strong></th></tr>';

	foreach ($setdata3 as $k2 => $v2) {
		$html .= '<tr>';
		$html .= '<td>' . $v2['bst_task_id'] . '</td>';
		$html .= '<td>' . $v2['bst_task_name'] . '</td>';
		$html .= '<td>' . $v2['bt_complete'] . '</td>';
		$html .= '<td>' . $v2['bt_completed_date'] . '</td>';
		$html .= '<td>' . $v2['user_name'] . '</td>';
		$html .= '</tr>';
	}

	$html .= '</table></body></html>';

	$heading = "Inclusion Task Tracker";
	$fname = "Manoj";

	create_inclusion_report($heading, $html, $fname);
}


// Print All Task

$printall = $fwRequest->getParam('printall', 0);

if ($printall) {

	$sqlBus = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, bus_customers.bcust_misc_home, business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status_sys_date, business.bsn_address, business.bsn_cp_incl_choices
FROM business_sellers
INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id
WHERE business.bsn_status LIKE '%|5|%'
GROUP BY business.bsn_id
ORDER BY business.bsn_status_sys_date DESC";

	if ($sqlBus) {
		$businessDetail = $fwDb->query($sqlBus);
	}

	$html = "<html><body>";
	foreach ($businessDetail as $bk => $bv) {

		$sqlT = "select * from busness_status_task where bst_business_status_id = 5 order by  bst_order";
		$taskdata = $fwDb->query($sqlT);

		foreach ($taskdata as $tk => $tv) {

			$sqlbt = "select business_tasks.*, users.user_name from business_tasks 
		Inner join users on business_tasks.bt_completed_by = users.user_id
		where bt_task_id = " . $tv['bst_task_id'] . " And bt_bsn_id = " . $bv['bsn_id'];

			$taskdetail = $fwDb->queryOne($sqlbt);

			$setdata3[$tk]['bst_task_id'] = $tv['bst_task_id'];
			$setdata3[$tk]['bst_task_name'] = $tv['bst_task_name'];

			if ($taskdetail['bt_complete'] == 1) {
				$comp = 'Yes';
			} else {
				$comp = 'No';
			}
			$setdata3[$tk]['bt_complete'] = $comp;

			if ($taskdetail['bt_complete'] == 1) {
				$setdata3[$tk]['bt_completed_date'] = $taskdetail['bt_completed_date'];
			} else {

				$setdata3[$tk]['bt_completed_date'] =  '';
			}
			$setdata3[$tk]['user_name'] = $taskdetail['user_name'];
		}


		$html .= '<table border="1" cellpadding="5">
		<tr><th colspan="5" style="text-align:center; color:#25b4e5;"><h1>' . $bv['bsn_name'] . '</h1></th></tr>
		  <tr><th style="width:6%;"><strong>UID</strong></th><th style="width:58%;"><strong>Task Name</strong></th>
	          <th style="width:8%;"><strong>Complete</strong></th><th style="width:14%;"><strong>Complete Date</strong></th>
		  <th style="width:14%;"><strong>Completed By</strong></th></tr>';

		foreach ($setdata3 as $k2 => $v2) {
			$html .= '<tr>';
			$html .= '<td>' . $v2['bst_task_id'] . '</td>';
			$html .= '<td>' . $v2['bst_task_name'] . '</td>';
			$html .= '<td>' . $v2['bt_complete'] . '</td>';
			$html .= '<td>' . $v2['bt_completed_date'] . '</td>';
			$html .= '<td>' . $v2['user_name'] . '</td>';
			$html .= '</tr>';
		}

		$html .= '</table><br><br>';
		$html .= '<div style="page-break-before:always">&nbsp;</div>';
	}
	$html .= '</body></html><br><br>';
	$heading = "Inclusion Task Tracker";
	$fname = "Manoj";
	create_inclusion_report($heading, $html, $fname);
}


$sql_l = "Select * from letter_text_inclusions order by lt_code";
$fwViewData['letterData'] = $fwDb->query($sql_l);
