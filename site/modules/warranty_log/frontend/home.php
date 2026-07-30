<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
//ini_set("memory_limit", "1024M");
// ini_set("memory_limit", "2048M");
ini_set('max_execution_time', 0);
$startTime = microtime(true);

$pagenum = $fwRequest->getparamget('pagenum', 0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('warranty_log');
$serviceClass = new ServiceClass;

$photos = $serviceClass->setLogPhotosIdWise();
$fwViewData['photos'] = $photos;
$videos = $serviceClass->setLogVideosIdWise();
$fwViewData['videos'] = $videos;
$inspection_photos = $serviceClass->setLogInspectionPhotoIdWise();
$fwViewData['inspection_photos'] = $inspection_photos;

$savedata = $fwRequest->getParam('savedata', '');
if ($savedata) {
	if ($_FILES['pr_letter']['name']) {
		$wa_id = $fwRequest->getParam('wa_id', '');

		$docfile_1 = $_FILES['pr_letter']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['pr_letter']['tmp_name'];
		$detail['wa_com_close_letter'] = $docfile_1;
		upload($docfile_1, $temp_name_1);

		$table->setWhere('wa_id = ' . $wa_id);
		if ($table->rowExists()) {
			$detail = $table->updateRow($detail);
		}
	}
}

$where = " WHERE ( wa_status = 'Open' Or wa_status = 'Pending' )";

$warranty_status = $fwRequest->getParam('warranty_status', '');
if (!empty($warranty_status)) {
	$where = " WHERE 1 = 1 ";
}

$submit = $fwRequest->getParam('openclose', '');
if (!empty($submit)) {
	$where = "WHERE 1=1";
	$_SESSION['openclose'] = 0;
	$_SESSION['where'] =  $where;
}
$ord = '';
$submitclosed = $fwRequest->getParam('closedonly', '');
if (!empty($submitclosed)) {
	$where = "WHERE wa_status = 'Closed'";
	$_SESSION['closedonly'] = 0;
	$_SESSION['where'] =  $where;

	$ord =  " ORDER BY if(  warranty_log.wa_status_date = ' '
                OR warranty_log.wa_status_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log.wa_status_date, '%d-%m-%Y' ) DESC";
}


$sort_date = $fwRequest->getParam('sort_date', '');
if (!empty($sort_date)) {
	$ord =  " ORDER BY if(  warranty_log.wa_date = ' '
         OR warranty_log.wa_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log.wa_date, '%d-%m-%Y' ) DESC";

	$_SESSION['ord'] = $ord;
}


$sort_proj = $fwRequest->getParam('sort_proj', '');
if (!empty($sort_proj)) {
	$ord =  " ORDER BY  warranty_log.wa_project ";
	$_SESSION['ord'] = $ord;
}

$sort_priority = $fwRequest->getParam('sort_priority', '');
if (!empty($sort_priority)) {
	$ord =  " ORDER BY  warranty_log.wa_priority";
	$_SESSION['ord'] = $ord;
}



$search_project = $fwRequest->getParam('project_name', '');

if ($search_project):

	$where .= " AND wa_project  LIKE '%" . $search_project . "%'  ";
	$_SESSION['search_project'] = $search_project;
	$fwViewData['search_project'] = $_SESSION['search_project'];

elseif ($_SESSION['search_project'] && $pagenum > 0):

	$where .= " AND wa_project LIKE  '%" . $_SESSION['search_project'] . "%' ";
	$fwViewData['search_project'] = $_SESSION['search_project'];

endif;


$search_variation = $fwRequest->getParam('filter_variation', '');

if ($search_variation):

	$where .= " AND wa_variation  = 1  ";
	$_SESSION['search_variation'] = 1;
	$fwViewData['search_variation'] = $_SESSION['search_variation'];

elseif ($_SESSION['search_variation']):

	$where .= " AND wa_variation =  " . $_SESSION['search_variation'];
	$fwViewData['search_variation'] = $_SESSION['search_variation'];

endif;

$_SESSION['where'] = $where;



// supplier search starts

$supplier_name = $fwRequest->getParam('supp_name', '');

if ($supplier_name):

	$where .= " AND wa_include_supplier  LIKE '%" . $supplier_name . "%'  ";
	$_SESSION['supplier_name'] = $supplier_name;
	$fwViewData['supplier_name'] = $_SESSION['supplier_name'];

elseif ($_SESSION['supplier_name']):

	$where .= " AND wa_include_supplier LIKE  '%" . $_SESSION['supplier_name'] . "%' ";
	$fwViewData['supplier_name'] = $_SESSION['supplier_name'];

endif;

$_SESSION['where'] = $where;

// supplier search ends


// Type search starts

$warranty_type = $fwRequest->getParam('warranty_type', '');

if ($warranty_type):

	$where .= " AND wa_type  LIKE '%" . $warranty_type . "%'  ";
	$_SESSION['warranty_type'] = $warranty_type;
	$fwViewData['warranty_type'] = $_SESSION['warranty_type'];

elseif ($_SESSION['warranty_type']):

	$where .= " AND wa_type LIKE  '%" . $_SESSION['warranty_type'] . "%' ";
	$fwViewData['warranty_type'] = $_SESSION['warranty_type'];

endif;

$_SESSION['where'] = $where;

// Type search ends




// Status search starts

$warranty_status = $fwRequest->getParam('warranty_status', '');

if ($warranty_status):

	$where .= " And wa_status  LIKE '%" . $warranty_status . "%'  ";
	$_SESSION['warranty_status'] = $warranty_status;
	$fwViewData['warranty_status'] = $_SESSION['warranty_status'];

elseif ($_SESSION['warranty_status']):

	$where .= " And wa_status LIKE  '%" . $_SESSION['warranty_status'] . "%' ";
	$fwViewData['warranty_status'] = $_SESSION['warranty_status'];

endif;

$_SESSION['where'] = $where;

// Status search ends

//Search by CGFB Responsible
$cgfb_responsible = $fwRequest->getParam('search_by_cgfb_responsible', '');
if ($cgfb_responsible):

	if ($cgfb_responsible == 'NIL') {
		//$where .= " And wa_cgfb_resp = 0";
	} else {
		$where .= " And wa_cgfb_resp = " . $cgfb_responsible;
	}
	$_SESSION['cgfb_responsible'] = $cgfb_responsible;
	$fwViewData['cgfb_responsible'] = $_SESSION['cgfb_responsible'];
	$_SESSION['where'] = $where;

elseif ($_SESSION['cgfb_responsible']):

	$where .= " And wa_cgfb_resp = " . $_SESSION['cgfb_responsible'];
	$fwViewData['cgfb_responsible'] = $_SESSION['cgfb_responsible'];
	$_SESSION['where'] = $where;

endif;

//Start Sort by Notes Due Date 
$sortNotesDueDate = $fwRequest->getParam('sortNotesDueDate', '');
if ($sortNotesDueDate):
	$_SESSION['sortNotesDueDate'] = $sortNotesDueDate;
	$fwViewData['sortNotesDueDate'] = $_SESSION['sortNotesDueDate'];

elseif ($_SESSION['sortNotesDueDate']):
	$fwViewData['sortNotesDueDate'] = $_SESSION['sortNotesDueDate'];
endif;

//End Sort by Notes Due Date

// Priority search starts

$search_by_priority = $fwRequest->getParam('priority', '');

if ($search_by_priority):

	$where .= " AND wa_priority  = " . $search_by_priority;
	$_SESSION['search_by_priority'] = $search_by_priority;
	$fwViewData['search_by_priority'] = $_SESSION['search_by_priority'];

elseif ($_SESSION['search_by_priority']):

	$where .= " AND wa_priority   = " . $_SESSION['search_by_priority'];
	$fwViewData['search_by_priority'] = $_SESSION['search_by_priority'];

endif;

$_SESSION['where'] = $where;

// Priority search ends



// Filter By PRIORITY starts

$filter_by_priority = $fwRequest->getParam('filter_by_priority', '');

if ($filter_by_priority):

	$where .= " AND wa_priority  = " . $filter_by_priority;
	$_SESSION['filter_by_priority'] = $filter_by_priority;
	$fwViewData['filter_by_priority'] = $_SESSION['filter_by_priority'];

elseif ($_SESSION['filter_by_priority']):

	$where .= " AND wa_priority   = " . $_SESSION['filter_by_priority'];
	$fwViewData['filter_by_priority'] = $_SESSION['filter_by_priority'];

endif;

$_SESSION['where'] = $where;

// Filter By PRIORITY ends




// Record No search starts

$recno = $fwRequest->getParam('recno', '');

if ($recno):

	$where = " where 1 = 1";
	$where .= " and  wa_id  = " . $recno;
	$_SESSION['recno'] = $recno;
	$fwViewData['recno'] = $_SESSION['recno'];
	$_SESSION['where'] = $where;

elseif ($_SESSION['recno']):
	$where = " where 1 = 1";
	$where .= " AND wa_id  = " . $_SESSION['recno'];
	$fwViewData['recno'] = $_SESSION['recno'];
	$_SESSION['where'] = $where;

endif;
// Record No search starts  


// Responsible Staff search starts

$res_staff = $fwRequest->getParam('search_by_rs', '');

if ($res_staff):

	$where .= " AND wa_resp_staff   LIKE '%" . $res_staff . "%'  ";
	$_SESSION['res_staff'] = $res_staff;
	$fwViewData['res_staff'] = $_SESSION['res_staff'];

elseif ($_SESSION['res_staff']):

	$where .= " AND wa_resp_staff  LIKE  '%" . $_SESSION['res_staff'] . "%' ";
	$fwViewData['res_staff'] = $_SESSION['res_staff'];

endif;

// Unallocated Logs
$unallocated_logs = $fwRequest->getParam('filter_unallocated_logs', '');
if ($unallocated_logs):

	//$where .= " AND ((wa_include_supplier IS NULL OR wa_include_supplier = '') AND ( wa_status = 'Open' )) ";
	$_SESSION['unallocated_logs'] = $unallocated_logs;
	$fwViewData['unallocated_logs'] = $_SESSION['unallocated_logs'];

elseif ($_SESSION['unallocated_logs']):

	//$where .= " AND ((wa_include_supplier IS NULL OR wa_include_supplier = '') AND ( wa_status = 'Open' )) ";
	$fwViewData['unallocated_logs'] = $_SESSION['unallocated_logs'];

endif;

if (!$unallocated_logs):
	unset($_SESSION['unallocated_logs']);
	$fwViewData['unallocated_logs'] = '';
endif;

$_SESSION['where'] = $where;

// Responsible Staff search ends


$ren = $fwRequest->getParam('wa_id', '');
if (!empty($ren)) {
	$where = " where 1 = 1";
	$where .= " and  wa_id  = " . $ren;
}

/*Function to clear/remove all filter
function clearAllFilterSearch(){
	$fwViewData['search_project'] = '';
	$where = "WHERE wa_status = 'Open' OR wa_status = 'Pending'";
	$fwViewData['oc'] = 1;
	$fwViewData['pr'] = '';
	unset($_SESSION['search_project']);
	unset($_SESSION['where']);
	unset($_SESSION['recno']);
	unset($_SESSION['supplier_name']);
	unset($_SESSION['warranty_status']);
	unset($_SESSION['warranty_type']);
	unset($_SESSION['search_by_priority']);
	unset($_SESSION['filter_by_priority']);
	unset($_SESSION['res_staff']);
	unset($supplier_name);
	
	unset($_SESSION['unallocated_logs']);
	$fwViewData['unallocated_logs'] = '';

	unset($warranty_status);
	unset($search_by_priority);
	$fwViewData['warranty_status'] = '';
	$fwViewData['search_by_priority'] = '';
	$fwViewData['res_staff'] = '';
	unset($_SESSION['search_variation']);
}*/

$clear = $fwRequest->getParam('clear', '');
if ($clear) {
	//clearAllFilterSearch();
	$fwViewData['search_project'] = '';
	$where = "WHERE wa_status = 'Open' OR wa_status = 'Pending'";
	$fwViewData['oc'] = 1;
	$fwViewData['pr'] = '';
	unset($_SESSION['search_project']);
	unset($_SESSION['where']);
	unset($_SESSION['recno']);
	$fwViewData['recno'] = '';
	unset($_SESSION['supplier_name']);
	unset($_SESSION['warranty_status']);
	unset($_SESSION['warranty_type']);
	unset($_SESSION['search_by_priority']);
	unset($_SESSION['filter_by_priority']);
	unset($_SESSION['res_staff']);
	unset($supplier_name);

	unset($_SESSION['unallocated_logs']);
	$fwViewData['unallocated_logs'] = '';

	unset($warranty_status);
	unset($search_by_priority);
	$fwViewData['warranty_status'] = '';
	$fwViewData['search_by_priority'] = '';
	$fwViewData['res_staff'] = '';
	unset($_SESSION['search_variation']);
	unset($_SESSION['cgfb_responsible']);
	$fwViewData['cgfb_responsible'] = '';
	unset($_SESSION['sortNotesDueDate']);
}


//  Merge Print OPEN and CLOSED starts here

$submit = $fwRequest->getParam('print', '');
if (!empty($submit)) {
	$path = [];
	$search_project = $fwRequest->getParam('project_name', '');
	$supplier_name = $fwRequest->getParam('supp_name', '');
	$warranty_type = $fwRequest->getParam('warranty_type', '');
	$recno = $fwRequest->getParam('recno', '');
	$warranty_status = $fwRequest->getParam('warranty_status', '');
	$search_by_priority = $fwRequest->getParam('priority', '');
	$res_staff = $fwRequest->getParam('search_by_rs', '');

	$where = " WHERE 1=1";

	if (!empty($search_project)) {
		$where .= " AND wa_project like '%" . $search_project . "%'  ";
	}

	if (!empty($supp_name)) {
		$where .= " AND wa_include_supplier like '%" . $supp_name . "%'  ";
	}


	if (!empty($warranty_type)) {
		$where .= " AND wa_type like '%" . $warranty_type . "%'  ";
	}

	if (!empty($recno)) {
		$where .= " AND wa_id = " . $recno . " ";
	}

	if (!empty($warranty_status)) {
		$where .= " AND wa_status like '%" . $warranty_status . "%'  ";
	}

	if (!empty($search_by_priority)) {
		$where .= " AND wa_priority like '%" . $search_by_priority . "%'  ";
	}

	if (!empty($res_staff)) {
		$where .= " AND wa_resp_staff like '%" . $res_staff . "%'  ";
	}


	$heading = "Warranty Log Report";

	$wasql = "SELECT * from warranty_log " . $where . " order by wa_status DESC";
	if ($wasql) {
		$waData = $fwDb->query($wasql);
	}

	$html = '';
	$html .= '<table border="1" width="100%" cellpadding="7">';

	$last_key = end(array_keys($waData));

	$nop = 0;

	$qry = "SELECT pr_id, pr_priority from warranty_log_priority";
	$res = $fwDb->query($qry);
	$prData = [];
	foreach ($res as $row) {
		$prData[$row['pr_id']] = $row;
	}

	$qry = "SELECT business.bsn_name, business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble from business_sellers
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id";
	$res = $fwDb->query($qry);
	$data = [];
	foreach ($res as $row) {
		$data[$row['bsn_name']] = $row;
	}

	$qry = "SELECT wc_id, wc_cgfb_option from warranty_log_cgfb";
	$res = $fwDb->query($qry);
	$cgfbdata = [];
	foreach ($res as $row) {
		$cgfbdata[$row['wc_id']] = $row;
	}

	$qry = "SELECT ww_id, ww_option from warranty_log_why_not";
	$res = $fwDb->query($qry);
	$whybdata = [];
	foreach ($res as $row) {
		$whybdata[$row['ww_id']] = $row;
	}

	$qry = "SELECT wl_id, wl_liability_option from warranty_log_liability";
	$res = $fwDb->query($qry);
	$labdata = [];
	foreach ($res as $row) {
		$labdata[$row['wl_id']] = $row;
	}

	//$qry = "SELECT * from warranty_log_notes";
	$qry = "SELECT wln.*, MAX(CASE WHEN a.row_num = 1 THEN a.wna_attachment END) AS attachment1, MAX(CASE WHEN a.row_num = 2 THEN a.wna_attachment END) AS attachment2, MAX(CASE WHEN a.row_num = 3 THEN a.wna_attachment END) AS attachment3, MAX(CASE WHEN a.row_num = 4 THEN a.wna_attachment END) AS attachment4, MAX(CASE WHEN a.row_num = 5 THEN a.wna_attachment END) AS attachment5 FROM warranty_log_notes wln LEFT JOIN ( SELECT wna_wn_id, wna_attachment, ROW_NUMBER() OVER (PARTITION BY wna_wn_id ORDER BY wna_id) AS row_num FROM warranty_log_note_attachments ) a ON wln.wn_id = a.wna_wn_id GROUP BY wln.wn_id ORDER BY STR_TO_DATE(wln.wn_date, '%d-%m-%Y') DESC";
	$res = $fwDb->query($qry);
	$notesData = [];
	foreach ($res as $row) {
		if (!isset($notesData[$row['wn_wa_id']])) {
			$notesData[$row['wn_wa_id']] = [];
		}
		$notesData[$row['wn_wa_id']][] = $row;
	}

	//$qry = "SELECT ws_wa_id, ws_supplier_name, ws_update_text, ws_attachment, ws_date, ws_wr from warranty_supplier_update";
	$qry = "SELECT ws_wa_id, ws_supplier_name, ws_update_text, ws_attachment, ws_attachment_2, ws_attachment_3, ws_attachment_4, ws_attachment_5, ws_date, ws_wr from warranty_supplier_update";
	$res = $fwDb->query($qry);
	$suData = [];
	foreach ($res as $row) {
		if (!isset($suData[$row['ws_wa_id']])) {
			$suData[$row['ws_wa_id']] = [];
		}
		$suData[$row['ws_wa_id']][] = $row;
	}

	$qry = "SELECT bt_bsn_id, bt_completed_date from business_tasks where bt_task_id = 254";
	$res = $fwDb->query($qry);
	$data2 = [];
	foreach ($res as $row) {
		$data2[$row['bt_bsn_id']] = $row;
	}

	foreach ($waData as $k => $m) {
		// $endTime = microtime(true);
		// $executionTime = $endTime - $startTime;
		// echo "START LOOP: " . $k;
		// db($executionTime); // 4064 - 86.86 to 0.18
		// $sql_p = "Select pr_priority from warranty_log_priority where pr_id = " . $m["wa_priority"];
		// $prData = $fwDb->queryOne($sql_p);

		// $sq12 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
		//  		bus_customers.bcust_misc_moble from business_sellers 		
		// 	Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		// 	Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '" . $m['wa_project'] . "'";

		// $data = $fwDb->queryOne($sq12);

		if ($m["wa_qicc"] == 1) {
			$qicc = 'Yes';
		} else {
			$qicc = 'No';
		}

		$link = '';
		$files = $photos[$m['wa_id']] ?? [];
		foreach($files as $index => $row) {
			$link .= ('<a target="_blank" href="' . $row['url'] . '">Link of Image ' . ($index + 1) . '</a><br>');
		}


		// $sql_cg = "select wc_cgfb_option from warranty_log_cgfb where wc_id = " . $m['wa_cgfb_resp'];
		// $cgfbdata = $fwDb->queryOne($sql_cg);

		// $sql_why = "select ww_option from warranty_log_why_not where ww_id = " . $m['wa_why_not'];
		// $whybdata = $fwDb->queryOne($sql_why);

		// $sql_la = "select wl_liability_option  from warranty_log_liability where wl_id = " . $m['wa_lia_acc'];
		// $labdata = $fwDb->queryOne($sql_la);

		if ($m['wa_tl'] == 1) {
			$backcol = 'style="background-color:#00CC33"';
		} elseif ($m['wa_tl'] == 2) {
			$backcol = 'style="background-color:#ff7f27"';
		} elseif ($m['wa_tl'] == 3) {
			$backcol = 'style="background-color:#F00"';
		} else {
			$backcol = '';
		}
		if ($m['wa_variation'] == 1) {
			$variation = 'Yes';
		} else {
			$variation = 'No';
		}


		// $sqlnotes = "select * from warranty_log_notes where wn_wa_id = " . $m['wa_id'];
		// $notesData = $fwDb->query($sqlnotes);

		// $sql_2 = "Select ws_supplier_name, ws_update_text, ws_attachment, ws_date,ws_wr from warranty_supplier_update where  ws_wa_id = " . $m['wa_id'];
		// $suData = $fwDb->query($sql_2);

		$notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
		$notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Attachment</td></tr>';

		if (!empty($notesData[$m['wa_id']])) {
			foreach ($notesData[$m['wa_id']] as $kn => $vn) {
				$notes .= '<tr>';
				$notes .= '<td>' . stripslashes($vn['wn_notes']) . '</td>';
				$notes .= '<td>' . $vn['wn_added_by'] . '</td>';
				$notes .= '<td>' . $vn['wn_date'] . '</td>';
				$notes .= '<td>';
				/* if (!empty($vn['wn_attachment'])) {
					$notes .= '<a target="_blank" href="' . BASE_URL . "files/uploads/" . $vn['wn_attachment'] . '">Link</a>';
				} */
				$attachmentFields = ['wn_attachment', 'attachment1', 'attachment2', 'attachment3', 'attachment4', 'attachment5'];
				$counter = 1;
				foreach ($attachmentFields as $field) {
					if (!empty($vn[$field])) {
						$imageUrl = '/warranty_log.download_content?file_name='.$vn[$field].'&module_name=warranty_log.notes';
						$notes .= '<a target="_blank" href="' . $imageUrl . '">Download Attachment ' . $counter . '</a><br/>';
						$counter++;
					}
				}
				
				$notes .= '</td>';
				$notes .= '</tr>';
			}
		}

		if (!empty($suData[$m['wa_id']])) {
			foreach ($suData[$m['wa_id']] as $kn2 => $vn2) {

				$notes .= '<tr>';
				$notes .= '<td>' . stripslashes($vn2['ws_update_text']) . '</td>';
				$notes .= '<td>' . $vn2['ws_supplier_name'] . '</td>';
				$notes .= '<td>' . changedate_d_m_y($vn2['ws_date']) . '</td>';
				$notes .= '<td>';
				/* if (!empty($vn2['ws_attachment'])) {
					$notes .= '<a target="_blank" href="https://warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/' . $vn2['ws_attachment'] . '">Link</a>';
				} */
				$attachmentFields = ['ws_attachment', 'ws_attachment_2', 'ws_attachment_3', 'ws_attachment_4', 'ws_attachment_5'];
				$counter = 1;
				foreach ($attachmentFields as $field) {
					if (!empty($vn2[$field])) {
						$imageUrl = '/warranty_log.download_content?file_name='.$vn2[$field].'&module_name=warranty_log.notes';
						$notes .= '<a target="_blank" href="' . $imageUrl . '">Download Attachment ' . $counter . '</a><br/>';
						$counter++;
					}
				}
				$notes .= '</td>';
				$notes .= '</tr>';
			}
		}

		$notes .= '</table>';

		if (empty($notesData[$m['wa_id']]) && empty($suData[$m['wa_id']])) {
			$notes = "";
		}


		// $sql5678 = "Select business_tasks.bt_completed_date from business_tasks
		// 	         where business_tasks.bt_bsn_id = " . $data['bs_business_id'] . " And business_tasks.bt_task_id = 254 ";
		// $data2 = $fwDb->queryOne($sql5678);


		$m["wa_problem"] = str_replace("’", "'", $m["wa_problem"]);

		$dayscount = '';
		$ccdate = $m['wa_date'];
		if (!empty($ccdate)) {
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}

		$html .= '<tr style="background-color:#FF0; text-align:center">';
		$html .= '<th  colspan="2">Rec. No. ' . $m["wa_id"] . ' </th>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Project</td>';
		$html .= '<td width="85%">' . $m["wa_project"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Contact Info</td>';
		$html .= '<td width="85%">' . $data[$m['wa_project']]['bcust_fname'] . ' ' . $data[$m['wa_project']]['bcust_lname'] . ' - Mobile No :' . $data[$m['wa_project']]['bcust_misc_moble'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Responsible</td>';
		$html .= '<td width="85%">' . $cgfbdata[$m['wa_cgfb_resp']]["wc_cgfb_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Why Not Responsible</td>';
		$html .= '<td width="85%">' . $whybdata[$m['wa_why_not']]["ww_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Liability Accepted</td>';
		$html .= '<td width="85%">' . $labdata[$m['wa_lia_acc']]["wl_liability_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Status</td>';
		$html .= '<td width="85%">' . $m["wa_status"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Traffic Light</td>';
		$html .= '<td width="85%"' . $backcol . '></td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Variation Required</td>';
		$html .= '<td width="85%">' . $variation . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Priority</td>';
		$html .= '<td width="85%">' . $prData[$m["wa_priority"]]['pr_priority'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Problem</td>';
		$html .= '<td width="85%">' . $m["wa_problem"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Notes</td>';
		$html .= '<td width="85%">' . $notes . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date</td>';
		$html .= '<td width="85%">' . trim($m["wa_date"]) . '</td>';
		$html .= '</tr>';

		$data2_bt_completed_date = $data2[$data[$m['wa_project']]['bs_business_id']]['bt_completed_date'];
		$html .= '<tr>';
		$html .= '<td width="15%">Walkthrough Date</td>';
		$html .= '<td width="85%">' . changedate_d_m_y($data2_bt_completed_date) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Days Count</td>';
		$html .= '<td width="85%">' . $dayscount . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Type</td>';
		$html .= '<td width="85%">' . $m["wa_type"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Tenated</td>';
		$html .= '<td width="85%">' . $m["wa_tenanted"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
		$html .= '<td width="85%">' . trim($qicc) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date Inspected</td>';
		$html .= '<td width="85%">' . trim($m["wa_date_inspected"]) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Person</td>';
		$html .= '<td width="85%">' . $m["wa_cgfb_person"] . '</td>';
		$html .= '</tr>';

		$x = explode("<br>", $m['wa_include_supplier']);
		$incsup = [];
		foreach ($x as $k3 => $v3) {
			preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
			$incsup[] = $str[0];
		}

		$html .= '<tr>';
		$html .= '<td width="15%">Supplier or Contact</td>';
		if ($m['wa_include_supplier']) {
			$html .= '<td width="85%">' . implode("<br>", $incsup) . '</td>';
		} else {
			$html .= '<td width="85%">N/A</td>';
		}
		$html .= '</tr>';


		//$html .= '<td colspan="2">'.$img1.'&nbsp;'.$img2.'&nbsp;'.$img3.'&nbsp;'.$img4.'&nbsp;'.$img5.'</td>';
		if ($link) {
			$html .= '<tr>';
			//$html .= '<tr><td>Attachments</td><td>'.$link.'</td></tr>';
			$html .= '<td width="15%">Attachments</td>';
			$html .= '<td width="85%">' . $link . '</td>';
			$html .= '</tr>';
		}


		if ($k <> $last_key) {
			$html .= '<br pagebreak="true" />';
		}

		/* new code split */
		$nop++;
		$fname = "_";
		if ($nop == 100) {
			$html .= '</table>';
			$html = utf8_encode($html);
			$path[] = create_warranty_PDF($heading, $html, $fname);
			unset($html);
			$html = '<table border="1" width="100%" cellpadding="7">';
			$nop = 0;
		}
		/* new code ends */
	}


	$html .= '</table>';
	// echo $html;
	// exit;
	$html = utf8_encode($html);
	$path[] = create_warranty_PDF($heading, $html, $fname);
	$fwViewData['filepath'] = $path;
	// create_warranty_PDF($heading, $html, $fname);
	unset($html);
}

// Merge Print open and Closed Ends here 

//Merge Print All with Image Thumbnail starts here
$submit = $fwRequest->getParam('printallimgthumb', '');
if (!empty($submit)) {
	$path = [];
	$search_project = $fwRequest->getParam('project_name', '');
	$supplier_name = $fwRequest->getParam('supp_name', '');
	$warranty_type = $fwRequest->getParam('warranty_type', '');
	$recno = $fwRequest->getParam('recno', '');
	$warranty_status = $fwRequest->getParam('warranty_status', '');
	$search_by_priority = $fwRequest->getParam('priority', '');
	$res_staff = $fwRequest->getParam('search_by_rs', '');

	$where = " WHERE 1=1";

	if (!empty($search_project)) {
		$where .= " AND wa_project like '%" . $search_project . "%'  ";
	}

	if (!empty($supp_name)) {
		$where .= " AND wa_include_supplier like '%" . $supp_name . "%'  ";
	}

	if (!empty($warranty_type)) {
		$where .= " AND wa_type like '%" . $warranty_type . "%'  ";
	}

	if (!empty($recno)) {
		$where .= " AND wa_id = " . $recno . " ";
	}

	if (!empty($warranty_status)) {
		$where .= " AND wa_status like '%" . $warranty_status . "%'  ";
	}

	if (!empty($search_by_priority)) {
		$where .= " AND wa_priority like '%" . $search_by_priority . "%'  ";
	}

	if (!empty($res_staff)) {
		$where .= " AND wa_resp_staff like '%" . $res_staff . "%'  ";
	}

	$heading = "Warranty Log Report";

	$wasql = "SELECT * from warranty_log " . $where . " order by wa_status DESC";

	if ($wasql) {
		$waData = $fwDb->query($wasql);
	}

	$html = '';
	$html .= '<table border="1" width="100%" cellpadding="7">';

	$last_key = end(array_keys($waData));

	$nop = 0;

	$qry = "SELECT pr_id, pr_priority from warranty_log_priority";
	$res = $fwDb->query($qry);
	$prData = [];
	foreach ($res as $row) {
		$prData[$row['pr_id']] = $row;
	}

	$qry = "SELECT business.bsn_name, business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble from business_sellers
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id";
	$res = $fwDb->query($qry);
	$data = [];
	foreach ($res as $row) {
		$data[$row['bsn_name']] = $row;
	}

	$qry = "SELECT wc_id, wc_cgfb_option from warranty_log_cgfb";
	$res = $fwDb->query($qry);
	$cgfbdata = [];
	foreach ($res as $row) {
		$cgfbdata[$row['wc_id']] = $row;
	}

	$qry = "SELECT ww_id, ww_option from warranty_log_why_not";
	$res = $fwDb->query($qry);
	$whybdata = [];
	foreach ($res as $row) {
		$whybdata[$row['ww_id']] = $row;
	}

	$qry = "SELECT wl_id, wl_liability_option from warranty_log_liability";
	$res = $fwDb->query($qry);
	$labdata = [];
	foreach ($res as $row) {
		$labdata[$row['wl_id']] = $row;
	}

	//$qry = "SELECT * from warranty_log_notes";
	$qry = "SELECT wln.*, MAX(CASE WHEN a.row_num = 1 THEN a.wna_attachment END) AS attachment1, MAX(CASE WHEN a.row_num = 2 THEN a.wna_attachment END) AS attachment2, MAX(CASE WHEN a.row_num = 3 THEN a.wna_attachment END) AS attachment3, MAX(CASE WHEN a.row_num = 4 THEN a.wna_attachment END) AS attachment4, MAX(CASE WHEN a.row_num = 5 THEN a.wna_attachment END) AS attachment5 FROM warranty_log_notes wln LEFT JOIN ( SELECT wna_wn_id, wna_attachment, ROW_NUMBER() OVER (PARTITION BY wna_wn_id ORDER BY wna_id) AS row_num FROM warranty_log_note_attachments ) a ON wln.wn_id = a.wna_wn_id GROUP BY wln.wn_id ORDER BY STR_TO_DATE(wln.wn_date, '%d-%m-%Y') DESC";
	$res = $fwDb->query($qry);
	$notesData = [];
	foreach ($res as $row) {
		if (!isset($notesData[$row['wn_wa_id']])) {
			$notesData[$row['wn_wa_id']] = [];
		}
		$notesData[$row['wn_wa_id']][] = $row;
	}

	//$qry = "SELECT ws_wa_id, ws_supplier_name, ws_update_text, ws_attachment, ws_date, ws_wr from warranty_supplier_update";
	$qry = "SELECT ws_wa_id, ws_supplier_name, ws_update_text, ws_attachment, ws_attachment_2, ws_attachment_3, ws_attachment_4, ws_attachment_5, ws_date, ws_wr from warranty_supplier_update";
	$res = $fwDb->query($qry);
	$suData = [];
	foreach ($res as $row) {
		if (!isset($suData[$row['ws_wa_id']])) {
			$suData[$row['ws_wa_id']] = [];
		}
		$suData[$row['ws_wa_id']][] = $row;
	}

	$qry = "SELECT bt_bsn_id, bt_completed_date from business_tasks where bt_task_id = 254";
	$res = $fwDb->query($qry);
	$data2 = [];
	foreach ($res as $row) {
		$data2[$row['bt_bsn_id']] = $row;
	}

	foreach ($waData as $k => $m) {
		if ($m["wa_qicc"] == 1) {
			$qicc = 'Yes';
		} else {
			$qicc = 'No';
		}

		$link = '';
		$files = $photos[$m['wa_id']] ?? [];
		foreach($files as $index => $row) {
			$folder_path = "files/warranty_log/";
			$object_name = $row['file'];
			$file = get_file_raw_data($folder_path, $object_name);
			if ($file !== false) {
				$link .= '<img src="' . $file . '" alt="Image ' . ($index + 1) . '" style="height: 150px; margin: 5px;"><br/>';
			} else {
				$link .= '';
			}
		}

		if ($m['wa_tl'] == 1) {
			$backcol = 'style="background-color:#00CC33"';
		} elseif ($m['wa_tl'] == 2) {
			$backcol = 'style="background-color:#ff7f27"';
		} elseif ($m['wa_tl'] == 3) {
			$backcol = 'style="background-color:#F00"';
		} else {
			$backcol = '';
		}
		if ($m['wa_variation'] == 1) {
			$variation = 'Yes';
		} else {
			$variation = 'No';
		}

		$notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
		$notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Attachment</td></tr>';

		if (!empty($notesData[$m['wa_id']])) {
			foreach ($notesData[$m['wa_id']] as $kn => $vn) {
				$notes .= '<tr>';
				$notes .= '<td>' . stripslashes($vn['wn_notes']) . '</td>';
				$notes .= '<td>' . $vn['wn_added_by'] . '</td>';
				$notes .= '<td>' . $vn['wn_date'] . '</td>';
				$notes .= '<td>';
				$attachmentFields = ['wn_attachment', 'attachment1', 'attachment2', 'attachment3', 'attachment4', 'attachment5'];

				$allowedImageTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/webp', 'image/gif'];
				$allowedImageExtensions = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

				$counter = 1;
				foreach ($attachmentFields as $field) {
					if (!empty($vn[$field])) {
													
						/* $folder_path = "files/warranty_log/notes/";
						//$object_name = rawurlencode($vn[$field]);
						$object_name = $vn[$field];
						$file = get_file_raw_data($folder_path, $object_name);
						
						if ($file !== false) {
							$notes .= '<img src="' . $file . '" alt="Image ' . ($index + 1) . '" style="max-width:150px; max-height:150px; margin:5px;" /><br>';
						} else {
							$notes .= '';
						} */
						
						$imageUrl = '/warranty_log.download_content?file_name='.$vn[$field].'&module_name=warranty_log.notes';
						$ext = strtolower(pathinfo($imageUrl, PATHINFO_EXTENSION));

						if (in_array($ext, $allowedImageExtensions)) {
							$notes .= '<img src="' . $imageUrl . '" alt="Attachment" style="max-width:150px; max-height:150px; margin:5px;" /><br/>';
						} else {
							$notes .= '<a target="_blank" href="' . $imageUrl . '">Download Attachment ' . $counter . '</a><br/>';
							$counter++;
						}
					}
					
				}
				
				$notes .= '</td>';
				$notes .= '</tr>';
			}
		}

		if (!empty($suData[$m['wa_id']])) {
			foreach ($suData[$m['wa_id']] as $kn2 => $vn2) {

				$notes .= '<tr>';
				$notes .= '<td>' . stripslashes($vn2['ws_update_text']) . '</td>';
				$notes .= '<td>' . $vn2['ws_supplier_name'] . '</td>';
				$notes .= '<td>' . changedate_d_m_y($vn2['ws_date']) . '</td>';
				$notes .= '<td>';
				$attachmentFields = ['ws_attachment', 'ws_attachment_2', 'ws_attachment_3', 'ws_attachment_4', 'ws_attachment_5'];
				
				$allowedImageTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/webp', 'image/gif'];
				$allowedImageExtensions = ['jpg', 'jpeg', 'png', 'webp', 'gif'];
				
				$counter = 1;
				foreach ($attachmentFields as $field) {
					if (!empty($vn2[$field])) {
						
						/* //echo $vn2[$field]; echo "<br/>";
						$folder_path = "files/warranty_log/notes/";
						//$object_name = rawurlencode($vn2[$field]);
						$object_name = $vn2[$field];
						$file = get_file_raw_data($folder_path, $object_name);
						
						if ($file !== false) {
							$notes .= '<img src="' . $file . '" alt="Image ' . ($index + 1) . '" style="max-width:150px; max-height:150px; margin:5px;" /><br>';
						} else {
							$notes .= '';
						} */
						
						$imageUrl = '/warranty_log.download_content?file_name='.$vn2[$field].'&module_name=warranty_log.notes';
						$ext = strtolower(pathinfo($imageUrl, PATHINFO_EXTENSION));

						if (in_array($ext, $allowedImageExtensions)) {
							$notes .= '<img src="' . $imageUrl . '" alt="Attachment" style="max-width:150px; max-height:150px; margin:5px;" /><br/>';
						} else {
							$notes .= '<a target="_blank" href="' . $imageUrl . '">Download Attachment ' . $counter . '</a><br/>';
							$counter++;
						}
					}
				}
				$notes .= '</td>';
				$notes .= '</tr>';
			}
		}

		$notes .= '</table>';

		if (empty($notesData[$m['wa_id']]) && empty($suData[$m['wa_id']])) {
			$notes = "";
		}

		$m["wa_problem"] = str_replace("’", "'", $m["wa_problem"]);

		$dayscount = '';
		$ccdate = $m['wa_date'];
		if (!empty($ccdate)) {
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}

		$html .= '<tr style="background-color:#FF0; text-align:center">';
		$html .= '<th  colspan="2">Rec. No. ' . $m["wa_id"] . ' </th>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Project</td>';
		$html .= '<td width="85%">' . $m["wa_project"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Contact Info</td>';
		$html .= '<td width="85%">' . $data[$m['wa_project']]['bcust_fname'] . ' ' . $data[$m['wa_project']]['bcust_lname'] . ' - Mobile No :' . $data[$m['wa_project']]['bcust_misc_moble'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Responsible</td>';
		$html .= '<td width="85%">' . $cgfbdata[$m['wa_cgfb_resp']]["wc_cgfb_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Why Not Responsible</td>';
		$html .= '<td width="85%">' . $whybdata[$m['wa_why_not']]["ww_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Liability Accepted</td>';
		$html .= '<td width="85%">' . $labdata[$m['wa_lia_acc']]["wl_liability_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Status</td>';
		$html .= '<td width="85%">' . $m["wa_status"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Traffic Light</td>';
		$html .= '<td width="85%"' . $backcol . '></td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Variation Required</td>';
		$html .= '<td width="85%">' . $variation . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Priority</td>';
		$html .= '<td width="85%">' . $prData[$m["wa_priority"]]['pr_priority'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Problem</td>';
		$html .= '<td width="85%">' . $m["wa_problem"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Notes</td>';
		$html .= '<td width="85%">' . $notes . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date</td>';
		$html .= '<td width="85%">' . trim($m["wa_date"]) . '</td>';
		$html .= '</tr>';

		$data2_bt_completed_date = $data2[$data[$m['wa_project']]['bs_business_id']]['bt_completed_date'];
		$html .= '<tr>';
		$html .= '<td width="15%">Walkthrough Date</td>';
		$html .= '<td width="85%">' . changedate_d_m_y($data2_bt_completed_date) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Days Count</td>';
		$html .= '<td width="85%">' . $dayscount . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Type</td>';
		$html .= '<td width="85%">' . $m["wa_type"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Tenated</td>';
		$html .= '<td width="85%">' . $m["wa_tenanted"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
		$html .= '<td width="85%">' . trim($qicc) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date Inspected</td>';
		$html .= '<td width="85%">' . trim($m["wa_date_inspected"]) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Person</td>';
		$html .= '<td width="85%">' . $m["wa_cgfb_person"] . '</td>';
		$html .= '</tr>';

		$x = explode("<br>", $m['wa_include_supplier']);
		$incsup = [];
		foreach ($x as $k3 => $v3) {
			preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
			$incsup[] = $str[0];
		}

		$html .= '<tr>';
		$html .= '<td width="15%">Supplier or Contact</td>';
		if ($m['wa_include_supplier']) {
			$html .= '<td width="85%">' . implode("<br>", $incsup) . '</td>';
		} else {
			$html .= '<td width="85%">N/A</td>';
		}
		$html .= '</tr>';


		if ($link) {
			$html .= '<tr>';
			//$html .= '<tr><td>Attachments</td><td>'.$link.'</td></tr>';
			$html .= '<td width="15%">Attachments</td>';
			$html .= '<td width="85%">' . $link . '</td>';
			$html .= '</tr>';
		}


		if ($k <> $last_key) {
			$html .= '<br pagebreak="true" />';
		}

		/* new code split */
		$nop++;
		$fname = "_";
		if ($nop == 100) {
			$html .= '</table>';
			$html = utf8_encode($html);
			$path[] = create_warranty_PDF($heading, $html, $fname);
			unset($html);
			$html = '<table border="1" width="100%" cellpadding="7">';
			$nop = 0;
		}
		/* new code ends */
	}


	$html .= '</table>';
	//echo $html; exit;
	$html = utf8_encode($html);
	$path[] = create_warranty_PDF($heading, $html, $fname);
	$fwViewData['filepath'] = $path;
	unset($html);
}
//Merge Print All with Image Thumbnail starts here

// Merge Print OPEN and CLOSED starts here
$submit = $fwRequest->getParam('printOP', '');
if (!empty($submit)) {
	$path = [];
	$search_project = $fwRequest->getParam('project_name', '');
	$supplier_name = $fwRequest->getParam('supp_name', '');
	$warranty_type = $fwRequest->getParam('warranty_type', '');
	$recno = $fwRequest->getParam('recno', '');
	//$warranty_status = $fwRequest->getParam('warranty_status', '');
	$search_by_priority = $fwRequest->getParam('priority', '');
	$res_staff = $fwRequest->getParam('search_by_rs', '');

	$where = " WHERE (wa_status like '%Open%' OR wa_status like '%Pending%')";

	if (!empty($search_project)) {
		$where .= " AND wa_project like '%" . $search_project . "%'  ";
	}

	if (!empty($supp_name)) {
		$where .= " AND wa_include_supplier like '%" . $supp_name . "%'  ";
	}


	if (!empty($warranty_type)) {
		$where .= " AND wa_type like '%" . $warranty_type . "%'  ";
	}

	if (!empty($recno)) {
		$where .= " AND wa_id = " . $recno . "  ";
	}

	// if(!empty($warranty_status)) {
	//	 $where .= " AND wa_status like '%".$warranty_status."%'  "; 
	// }

	if (!empty($search_by_priority)) {
		$where .= " AND wa_priority like '%" . $search_by_priority . "%'  ";
	}

	if (!empty($res_staff)) {
		$where .= " AND wa_resp_staff like '%" . $res_staff . "%'  ";
	}


	$heading = "Warranty Log Report";

	$wasql = "SELECT * from warranty_log " . $where . " order by wa_status DESC";

	if ($wasql) {
		$waData = $fwDb->query($wasql);
	}



	$html = '';
	$html .= '<table border="1" width="100%" cellpadding="7">';

	$last_key = end(array_keys($waData));

	$nop = 0;
	$path = [];

	$qry = "SELECT pr_id, pr_priority from warranty_log_priority";
	$res = $fwDb->query($qry);
	$prData = [];
	foreach ($res as $row) {
		$prData[$row['pr_id']] = $row;
	}

	$qry = "SELECT business.bsn_name, business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble from business_sellers
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id";
	$res = $fwDb->query($qry);
	$data = [];
	foreach ($res as $row) {
		$data[$row['bsn_name']] = $row;
	}

	$qry = "SELECT wc_id, wc_cgfb_option from warranty_log_cgfb";
	$res = $fwDb->query($qry);
	$cgfbdata = [];
	foreach ($res as $row) {
		$cgfbdata[$row['wc_id']] = $row;
	}

	$qry = "SELECT ww_id, ww_option from warranty_log_why_not";
	$res = $fwDb->query($qry);
	$whybdata = [];
	foreach ($res as $row) {
		$whybdata[$row['ww_id']] = $row;
	}

	$qry = "SELECT wl_id, wl_liability_option from warranty_log_liability";
	$res = $fwDb->query($qry);
	$labdata = [];
	foreach ($res as $row) {
		$labdata[$row['wl_id']] = $row;
	}

	//$qry = "SELECT * from warranty_log_notes ORDER BY wn_wa_id";
	$qry = "SELECT wln.*, MAX(CASE WHEN a.row_num = 1 THEN a.wna_attachment END) AS attachment1, MAX(CASE WHEN a.row_num = 2 THEN a.wna_attachment END) AS attachment2, MAX(CASE WHEN a.row_num = 3 THEN a.wna_attachment END) AS attachment3, MAX(CASE WHEN a.row_num = 4 THEN a.wna_attachment END) AS attachment4, MAX(CASE WHEN a.row_num = 5 THEN a.wna_attachment END) AS attachment5 FROM warranty_log_notes wln LEFT JOIN ( SELECT wna_wn_id, wna_attachment, ROW_NUMBER() OVER (PARTITION BY wna_wn_id ORDER BY wna_id) AS row_num FROM warranty_log_note_attachments ) a ON wln.wn_id = a.wna_wn_id GROUP BY wln.wn_id ORDER BY STR_TO_DATE(wln.wn_date, '%d-%m-%Y') DESC";
	$res = $fwDb->query($qry);
	//echo "<pre>"; print_r($res); exit();
	$notesData = [];
	foreach ($res as $row) {
		if (!isset($notesData[$row['wn_wa_id']])) {
			$notesData[$row['wn_wa_id']] = [];
		}
		$notesData[$row['wn_wa_id']][] = $row;
	}

	$qry = "SELECT ws_wa_id, ws_supplier_name, ws_update_text, ws_attachment, ws_attachment_2, ws_attachment_3, ws_attachment_4, ws_attachment_5, ws_date, ws_wr from warranty_supplier_update";
	$res = $fwDb->query($qry);
	$suData = [];
	foreach ($res as $row) {
		if (!isset($suData[$row['ws_wa_id']])) {
			$suData[$row['ws_wa_id']] = [];
		}
		$suData[$row['ws_wa_id']][] = $row;
		$notesData[$row['ws_wa_id']][] = $row;
	}

	// Loop through each main key (like 2048)
	foreach ($notesData as $wa_id => &$items) {
		usort($items, function ($a, $b) {
			// Get timestamp for each item, handling both wn_date and ws_date
			$dateA = isset($a['wn_date']) ? DateTime::createFromFormat('d-m-Y', $a['wn_date']) : new DateTime($a['ws_date']);
			$dateB = isset($b['wn_date']) ? DateTime::createFromFormat('d-m-Y', $b['wn_date']) : new DateTime($b['ws_date']);

			// Descending order: latest date first
			return $dateB <=> $dateA;
		});
	}

	$qry = "SELECT bt_bsn_id, bt_completed_date from business_tasks where bt_task_id = 254";
	$res = $fwDb->query($qry);
	$data2 = [];
	foreach ($res as $row) {
		$data2[$row['bt_bsn_id']] = $row;
	}

	foreach ($waData as $k => $m) {
		// $endTime = microtime(true);
		// $executionTime = $endTime - $startTime;
		// echo "START LOOP: " . $k;
		// db($executionTime); // 332 - 40 to 0.06

		if ($m["wa_qicc"] == 1) {
			$qicc = 'Yes';
		} else {
			$qicc = 'No';
		}

		$link = '';
		$files = $photos[$m['wa_id']] ?? [];
		foreach($files as $index => $row) {
			$link .= ('<a target="_blank" href="' . $row['url'] . '">Link of Image ' . ($index + 1) . '</a><br>');
		}

		if ($m['wa_tl'] == 1) {
			$backcol = 'style="background-color:#00CC33"';
		} elseif ($m['wa_tl'] == 2) {
			$backcol = 'style="background-color:#ff7f27"';
		} elseif ($m['wa_tl'] == 3) {
			$backcol = 'style="background-color:#F00"';
		} else {
			$backcol = '';
		}
		if ($m['wa_variation'] == 1) {
			$variation = 'Yes';
		} else {
			$variation = 'No';
		}

		$notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
		$notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Attachment</td></tr>';

		if (!empty($notesData[$m['wa_id']])) {
			foreach ($notesData[$m['wa_id']] as $kn => $vn) {
				$notes .= '<tr>';

				if (isset($vn['wn_id'])) {
					$notes .= '<td>' . stripslashes($vn['wn_notes']) . '</td>';
					$notes .= '<td>' . $vn['wn_added_by'] . '</td>';
					$notes .= '<td>' . $vn['wn_date'] . '</td>';
					$notes .= '<td>';
					
					$attachmentFields = ['wn_attachment', 'attachment1', 'attachment2', 'attachment3', 'attachment4', 'attachment5'];
					$counter = 1;
					foreach ($attachmentFields as $field) {
						if (!empty($vn[$field])) {
							$imageUrl = '/warranty_log.download_content?file_name='.$vn[$field].'&module_name=warranty_log.notes';
							$notes .= '<a target="_blank" href="' . $imageUrl . '">Download Attachment ' . $counter . '</a><br/>';
							$counter++;
						}
					}
					
					$notes .= '</td>';
				} elseif (isset($vn['ws_wa_id'])) {
					$notes .= '<td>' . stripslashes($vn['ws_update_text']) . '</td>';
					$notes .= '<td>' . $vn['ws_supplier_name'] . '</td>';
					$notes .= '<td>' . changedate_d_m_y($vn['ws_date']) . '</td>';
					$notes .= '<td>';
					
					$attachmentFields = ['ws_attachment', 'ws_attachment_2', 'ws_attachment_3', 'ws_attachment_4', 'ws_attachment_5'];
					$counter = 1;
					foreach ($attachmentFields as $field) {
						if (!empty($vn[$field])) {
							$imageUrl = '/warranty_log.download_content?file_name='.$vn[$field].'&module_name=warranty_log.notes';
							$notes .= '<a target="_blank" href="' . $imageUrl . '">Download Attachment ' . $counter . '</a><br/>';
							$counter++;
						}
					}
					
					$notes .= '</td>';
				}

				$notes .= '</tr>';
			}
		}

		$notes .= '</table>';

		if (empty($notesData[$m['wa_id']]) && empty($suData[$m['wa_id']])) {
			$notes = "";
		}

		$m["wa_problem"] = str_replace("’", "'", $m["wa_problem"]);

		$dayscount = '';
		$ccdate = $m['wa_date'];
		if (!empty($ccdate)) {
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}

		$html .= '<tr style="background-color:#FF0; text-align:center">';
		$html .= '<th  colspan="2">Rec. No. ' . $m["wa_id"] . ' </th>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Project</td>';
		$html .= '<td width="85%">' . $m["wa_project"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Contact Info</td>';
		$html .= '<td width="85%">' . $data[$m['wa_project']]['bcust_fname'] . ' ' . $data[$m['wa_project']]['bcust_lname'] . ' - Mobile No :' . $data[$m['wa_project']]['bcust_misc_moble'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Responsible</td>';
		$html .= '<td width="85%">' . $cgfbdata[$m['wa_cgfb_resp']]["wc_cgfb_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Why Not Responsible</td>';
		$html .= '<td width="85%">' . $whybdata[$m['wa_why_not']]["ww_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Liability Accepted</td>';
		$html .= '<td width="85%">' . $labdata[$m['wa_lia_acc']]["wl_liability_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Status</td>';
		$html .= '<td width="85%">' . $m["wa_status"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Traffic Light</td>';
		$html .= '<td width="85%"' . $backcol . '></td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Variation Required</td>';
		$html .= '<td width="85%">' . $variation . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Priority</td>';
		$html .= '<td width="85%">' . $prData[$m["wa_priority"]]['pr_priority'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Problem</td>';
		$html .= '<td width="85%">' . $m["wa_problem"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Notes</td>';
		$html .= '<td width="85%">' . $notes . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date</td>';
		$html .= '<td width="85%">' . trim($m["wa_date"]) . '</td>';
		$html .= '</tr>';

		$data2_bt_completed_date = $data2[$data[$m['wa_project']]['bs_business_id']]['bt_completed_date'];
		$html .= '<tr>';
		$html .= '<td width="15%">Walkthrough Date</td>';
		$html .= '<td width="85%">' . changedate_d_m_y($data2_bt_completed_date) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Days Count</td>';
		$html .= '<td width="85%">' . $dayscount . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Type</td>';
		$html .= '<td width="85%">' . $m["wa_type"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Tenated</td>';
		$html .= '<td width="85%">' . $m["wa_tenanted"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
		$html .= '<td width="85%">' . trim($qicc) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date Inspected</td>';
		$html .= '<td width="85%">' . trim($m["wa_date_inspected"]) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Person</td>';
		$html .= '<td width="85%">' . $m["wa_cgfb_person"] . '</td>';
		$html .= '</tr>';


		$x = explode("<br>", $m['wa_include_supplier']);
		$incsup = [];
		foreach ($x as $k3 => $v3) {
			preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
			$incsup[] = $str[0];
		}


		$html .= '<tr>';
		$html .= '<td width="15%">Supplier or Contact</td>';
		if ($m['wa_include_supplier']) {
			$html .= '<td width="85%">' . implode("<br>", $incsup) . '</td>';
		} else {
			$html .= '<td width="85%">N/A</td>';
		}
		$html .= '</tr>';


		//$html .= '<td colspan="2">'.$img1.'&nbsp;'.$img2.'&nbsp;'.$img3.'&nbsp;'.$img4.'&nbsp;'.$img5.'</td>';
		if ($link) {
			$html .= '<tr>';
			//$html .= '<tr><td>Attachments</td><td>'.$link.'</td></tr>';
			$html .= '<td width="15%">Attachments</td>';
			$html .= '<td width="85%">' . $link . '</td>';
			$html .= '</tr>';
		}


		if ($k <> $last_key) {
			$html .= '<br pagebreak="true" />';
		}

		/* new code split */
		$nop++;
		$fname = "_";
		if ($nop == 100) {
			$html .= '</table>';
			$html = utf8_encode($html);
			$path[] = create_warranty_PDF($heading, $html, $fname);
			unset($html);
			$html = '<table border="1" width="100%" cellpadding="7">';
			$nop = 0;
		}
		/* new code ends */
	}


	$html .= '</table>';
	// echo $html;
	// exit;
	$html = utf8_encode($html);
	$path[] = create_warranty_PDF($heading, $html, $fname);
	$fwViewData['filepath'] = $path;
	unset($html);
}

// MERGE PRINT OPEN AND PENDING ENDS HERE 

//  Merge Print OPEN and CLOSED Image Thumbnail starts here
$submit = $fwRequest->getParam('printOPimgthumb', '');
if (!empty($submit)) {
	$path = [];
	$search_project = $fwRequest->getParam('project_name', '');
	$supplier_name = $fwRequest->getParam('supp_name', '');
	$warranty_type = $fwRequest->getParam('warranty_type', '');
	$recno = $fwRequest->getParam('recno', '');
	$search_by_priority = $fwRequest->getParam('priority', '');
	$res_staff = $fwRequest->getParam('search_by_rs', '');

	$where = " WHERE (wa_status like '%Open%' OR wa_status like '%Pending%')";

	if (!empty($search_project)) {
		$where .= " AND wa_project like '%" . $search_project . "%'  ";
	}

	if (!empty($supp_name)) {
		$where .= " AND wa_include_supplier like '%" . $supp_name . "%'  ";
	}

	if (!empty($warranty_type)) {
		$where .= " AND wa_type like '%" . $warranty_type . "%'  ";
	}

	if (!empty($recno)) {
		$where .= " AND wa_id = " . $recno . "  ";
	}

	if (!empty($search_by_priority)) {
		$where .= " AND wa_priority like '%" . $search_by_priority . "%'  ";
	}

	if (!empty($res_staff)) {
		$where .= " AND wa_resp_staff like '%" . $res_staff . "%'  ";
	}

	$heading = "Warranty Log Report";

	$wasql = "SELECT * from warranty_log " . $where . " order by wa_status DESC";
	if ($wasql) {
		$waData = $fwDb->query($wasql);
	}

	$html = '';
	$html .= '<table border="1" width="100%" cellpadding="7">';

	$last_key = end(array_keys($waData));

	$nop = 0;
	$path = [];

	$qry = "SELECT pr_id, pr_priority from warranty_log_priority";
	$res = $fwDb->query($qry);
	$prData = [];
	foreach ($res as $row) {
		$prData[$row['pr_id']] = $row;
	}

	$qry = "SELECT business.bsn_name, business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble from business_sellers
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id";
	$res = $fwDb->query($qry);
	$data = [];
	foreach ($res as $row) {
		$data[$row['bsn_name']] = $row;
	}

	$qry = "SELECT wc_id, wc_cgfb_option from warranty_log_cgfb";
	$res = $fwDb->query($qry);
	$cgfbdata = [];
	foreach ($res as $row) {
		$cgfbdata[$row['wc_id']] = $row;
	}

	$qry = "SELECT ww_id, ww_option from warranty_log_why_not";
	$res = $fwDb->query($qry);
	$whybdata = [];
	foreach ($res as $row) {
		$whybdata[$row['ww_id']] = $row;
	}

	$qry = "SELECT wl_id, wl_liability_option from warranty_log_liability";
	$res = $fwDb->query($qry);
	$labdata = [];
	foreach ($res as $row) {
		$labdata[$row['wl_id']] = $row;
	}

	$qry = "SELECT wln.*, MAX(CASE WHEN a.row_num = 1 THEN a.wna_attachment END) AS attachment1, MAX(CASE WHEN a.row_num = 2 THEN a.wna_attachment END) AS attachment2, MAX(CASE WHEN a.row_num = 3 THEN a.wna_attachment END) AS attachment3, MAX(CASE WHEN a.row_num = 4 THEN a.wna_attachment END) AS attachment4, MAX(CASE WHEN a.row_num = 5 THEN a.wna_attachment END) AS attachment5 FROM warranty_log_notes wln LEFT JOIN ( SELECT wna_wn_id, wna_attachment, ROW_NUMBER() OVER (PARTITION BY wna_wn_id ORDER BY wna_id) AS row_num FROM warranty_log_note_attachments ) a ON wln.wn_id = a.wna_wn_id GROUP BY wln.wn_id ORDER BY STR_TO_DATE(wln.wn_date, '%d-%m-%Y') DESC";
	$res = $fwDb->query($qry);
	$notesData = [];
	foreach ($res as $row) {
		if (!isset($notesData[$row['wn_wa_id']])) {
			$notesData[$row['wn_wa_id']] = [];
		}
		$notesData[$row['wn_wa_id']][] = $row;
	}

	$qry = "SELECT ws_wa_id, ws_supplier_name, ws_update_text, ws_attachment, ws_attachment_2, ws_attachment_3, ws_attachment_4, ws_attachment_5, ws_date, ws_wr from warranty_supplier_update";
	$res = $fwDb->query($qry);
	$suData = [];
	foreach ($res as $row) {
		if (!isset($suData[$row['ws_wa_id']])) {
			$suData[$row['ws_wa_id']] = [];
		}
		$suData[$row['ws_wa_id']][] = $row;
		$notesData[$row['ws_wa_id']][] = $row;
	}

	foreach ($notesData as $wa_id => &$items) {
		usort($items, function ($a, $b) {
			$dateA = isset($a['wn_date']) ? DateTime::createFromFormat('d-m-Y', $a['wn_date']) : new DateTime($a['ws_date']);
			$dateB = isset($b['wn_date']) ? DateTime::createFromFormat('d-m-Y', $b['wn_date']) : new DateTime($b['ws_date']);

			return $dateB <=> $dateA;
		});
	}

	$qry = "SELECT bt_bsn_id, bt_completed_date from business_tasks where bt_task_id = 254";
	$res = $fwDb->query($qry);
	$data2 = [];
	foreach ($res as $row) {
		$data2[$row['bt_bsn_id']] = $row;
	}

	foreach ($waData as $k => $m) {

		if ($m["wa_qicc"] == 1) {
			$qicc = 'Yes';
		} else {
			$qicc = 'No';
		}

		$link = '';
		$files = $photos[$m['wa_id']] ?? [];
		foreach($files as $index => $row) {
			$folder_path = "files/warranty_log/";
			$object_name = $row['file'];
			$file = get_file_raw_data($folder_path, $object_name);
			if ($file !== false) {
				$link .= '<img src="' . $file . '" alt="Image ' . ($index + 1) . '" style="max-width:150px; max-height:150px; margin:5px;" /><br>';
			} else {
				$link .= '';
			}
		}

		if ($m['wa_tl'] == 1) {
			$backcol = 'style="background-color:#00CC33"';
		} elseif ($m['wa_tl'] == 2) {
			$backcol = 'style="background-color:#ff7f27"';
		} elseif ($m['wa_tl'] == 3) {
			$backcol = 'style="background-color:#F00"';
		} else {
			$backcol = '';
		}
		if ($m['wa_variation'] == 1) {
			$variation = 'Yes';
		} else {
			$variation = 'No';
		}

		$notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
		$notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Attachment</td></tr>';

		if (!empty($notesData[$m['wa_id']])) {
			foreach ($notesData[$m['wa_id']] as $kn => $vn) {
				$notes .= '<tr>';

				if (isset($vn['wn_id'])) {
					$notes .= '<td>' . stripslashes($vn['wn_notes']) . '</td>';
					$notes .= '<td>' . $vn['wn_added_by'] . '</td>';
					$notes .= '<td>' . $vn['wn_date'] . '</td>';
					$notes .= '<td>';
					$attachmentFields = ['wn_attachment', 'attachment1', 'attachment2', 'attachment3', 'attachment4', 'attachment5'];

					$allowedImageTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/webp', 'image/gif'];
					$allowedImageExtensions = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

					$counter = 1;
					foreach ($attachmentFields as $field) {
						if (!empty($vn[$field])) {
							
							//echo $vn[$field]; echo "<br/>";
														
							/* $folder_path = "files/warranty_log/notes/";
							//$object_name = rawurlencode($vn[$field]);
							$object_name = $vn[$field];
							$file = get_file_raw_data($folder_path, $object_name);
							
							if ($file !== false) {
								$notes .= '<img src="' . $file . '" alt="Image ' . ($index + 1) . '" style="max-width:150px; max-height:150px; margin:5px;" /><br>';
							} else {
								$notes .= '';
							} */
							
							$imageUrl = '/warranty_log.download_content?file_name='.$vn[$field].'&module_name=warranty_log.notes';
							$ext = strtolower(pathinfo($imageUrl, PATHINFO_EXTENSION));

							if (in_array($ext, $allowedImageExtensions)) {
								$notes .= '<img src="' . $imageUrl . '" alt="Attachment" style="max-width:150px; max-height:150px; margin:5px;" /><br/>';
							} else {
								$notes .= '<a target="_blank" href="' . $imageUrl . '">Download Attachment ' . $counter . '</a><br/>';
								$counter++;
							}
						}
						
						/* if (!empty($vn[$field])) {
							$fileUrl = BASE_URL . "files/uploads/" . $vn[$field];
							$ext = strtolower(pathinfo($fileUrl, PATHINFO_EXTENSION));

							$headers = @get_headers($fileUrl, 1);
							$isValid = false;

							if ($headers && strpos($headers[0], '200') !== false) {
								$contentType = isset($headers['Content-Type']) ? $headers['Content-Type'] : '';
								if (is_array($contentType)) {
									$contentType = $contentType[0];
								}

								$imageData = @file_get_contents($fileUrl, false, null, 0, 500); // Read first 500 bytes

								if (
									$imageData &&
									stripos($imageData, '<html') === false &&
									stripos($imageData, 'The Fusebox framework could not find the circuit') === false
								) {
									$isValid = true;
								}
							}

							if ($isValid) {
								if (in_array(strtolower($contentType), $allowedImageTypes) || in_array($ext, $allowedImageExtensions)) {
									$notes .= '<img src="' . $fileUrl . '" alt="Attachment" style="max-width:150px; max-height:150px; margin:5px;" /><br/>';
								} else {
									$notes .= '<a target="_blank" href="' . $fileUrl . '">Download Attachment</a><br/>';
								}
							} else {
								$notes .= '<span style="color:red;">Attachment Unavailable</span><br/>';
							}
						} */
					}

					$notes .= '</td>';
				} elseif (isset($vn['ws_wa_id'])) {
					$notes .= '<td>' . stripslashes($vn['ws_update_text']) . '</td>';
					$notes .= '<td>' . $vn['ws_supplier_name'] . '</td>';
					$notes .= '<td>' . changedate_d_m_y($vn['ws_date']) . '</td>';
					$notes .= '<td>';
					$attachmentFields = ['ws_attachment', 'ws_attachment_2', 'ws_attachment_3', 'ws_attachment_4', 'ws_attachment_5'];

					$allowedImageTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/webp', 'image/gif'];
					$allowedImageExtensions = ['jpg', 'jpeg', 'png', 'webp', 'gif'];
					
					$counter = 1;
					foreach ($attachmentFields as $field) {
						if (!empty($vn[$field])) {
							
							/* //echo $vn[$field]; echo "<br/>";
							$folder_path = "files/warranty_log/notes/";
							//$object_name = rawurlencode($vn[$field]);
							$object_name = $vn[$field];
							$file = get_file_raw_data($folder_path, $object_name);
							
							if ($file !== false) {
								$notes .= '<img src="' . $file . '" alt="Image ' . ($index + 1) . '" style="max-width:150px; max-height:150px; margin:5px;" /><br>';
							} else {
								$notes .= '';
							} */
							
							$imageUrl = '/warranty_log.download_content?file_name='.$vn[$field].'&module_name=warranty_log.notes';
							$ext = strtolower(pathinfo($imageUrl, PATHINFO_EXTENSION));

							if (in_array($ext, $allowedImageExtensions)) {
								$notes .= '<img src="' . $imageUrl . '" alt="Attachment" style="max-width:150px; max-height:150px; margin:5px;" /><br/>';
							} else {
								$notes .= '<a target="_blank" href="' . $imageUrl . '">Download Attachment ' . $counter . '</a><br/>';
								$counter++;
							}
						}
						
						/* if (!empty($vn[$field])) {
							$imageUrl = 'https://warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/' . $vn[$field];
							$ext = strtolower(pathinfo($imageUrl, PATHINFO_EXTENSION));

							$headers = @get_headers($imageUrl, 1);

							if ($headers && strpos($headers[0], '200') !== false) {
								$contentType = isset($headers['Content-Type']) ? $headers['Content-Type'] : '';

								if (is_array($contentType)) {
									$contentType = $contentType[0]; // handle array case
								}

								if (in_array(strtolower($contentType), $allowedImageTypes) || in_array($ext, $allowedImageExtensions)) {
									$notes .= '<img src="' . $imageUrl . '" alt="Attachment" style="max-width:150px; max-height:150px; margin:5px;" /><br/>';
								} else {
									$notes .= '<a target="_blank" href="' . $imageUrl . '">Download Attachment</a><br/>';
								}
							} else {
								$notes .= '<span>Attachment Unavailable</span><br/>';
							}
						} */
					}

					$notes .= '</td>';
				}

				$notes .= '</tr>';
			}
		}

		$notes .= '</table>';

		if (empty($notesData[$m['wa_id']]) && empty($suData[$m['wa_id']])) {
			$notes = "";
		}

		$m["wa_problem"] = str_replace("’", "'", $m["wa_problem"]);

		$dayscount = '';
		$ccdate = $m['wa_date'];
		if (!empty($ccdate)) {
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}

		$html .= '<tr style="background-color:#FF0; text-align:center">';
		$html .= '<th  colspan="2">Rec. No. ' . $m["wa_id"] . ' </th>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Project</td>';
		$html .= '<td width="85%">' . $m["wa_project"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Contact Info</td>';
		$html .= '<td width="85%">' . $data[$m['wa_project']]['bcust_fname'] . ' ' . $data[$m['wa_project']]['bcust_lname'] . ' - Mobile No :' . $data[$m['wa_project']]['bcust_misc_moble'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Responsible</td>';
		$html .= '<td width="85%">' . $cgfbdata[$m['wa_cgfb_resp']]["wc_cgfb_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Why Not Responsible</td>';
		$html .= '<td width="85%">' . $whybdata[$m['wa_why_not']]["ww_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Liability Accepted</td>';
		$html .= '<td width="85%">' . $labdata[$m['wa_lia_acc']]["wl_liability_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Status</td>';
		$html .= '<td width="85%">' . $m["wa_status"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Traffic Light</td>';
		$html .= '<td width="85%"' . $backcol . '></td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Variation Required</td>';
		$html .= '<td width="85%">' . $variation . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Priority</td>';
		$html .= '<td width="85%">' . $prData[$m["wa_priority"]]['pr_priority'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Problem</td>';
		$html .= '<td width="85%">' . $m["wa_problem"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Notes</td>';
		$html .= '<td width="85%">' . $notes . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date</td>';
		$html .= '<td width="85%">' . trim($m["wa_date"]) . '</td>';
		$html .= '</tr>';

		$data2_bt_completed_date = $data2[$data[$m['wa_project']]['bs_business_id']]['bt_completed_date'];
		$html .= '<tr>';
		$html .= '<td width="15%">Walkthrough Date</td>';
		$html .= '<td width="85%">' . changedate_d_m_y($data2_bt_completed_date) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Days Count</td>';
		$html .= '<td width="85%">' . $dayscount . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Type</td>';
		$html .= '<td width="85%">' . $m["wa_type"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Tenated</td>';
		$html .= '<td width="85%">' . $m["wa_tenanted"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
		$html .= '<td width="85%">' . trim($qicc) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date Inspected</td>';
		$html .= '<td width="85%">' . trim($m["wa_date_inspected"]) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Person</td>';
		$html .= '<td width="85%">' . $m["wa_cgfb_person"] . '</td>';
		$html .= '</tr>';


		$x = explode("<br>", $m['wa_include_supplier']);
		$incsup = [];
		foreach ($x as $k3 => $v3) {
			preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
			$incsup[] = $str[0];
		}


		$html .= '<tr>';
		$html .= '<td width="15%">Supplier or Contact</td>';
		if ($m['wa_include_supplier']) {
			$html .= '<td width="85%">' . implode("<br>", $incsup) . '</td>';
		} else {
			$html .= '<td width="85%">N/A</td>';
		}
		$html .= '</tr>';

		if ($link) {
			$html .= '<tr>';
			$html .= '<td width="15%">Attachments</td>';
			$html .= '<td width="85%">' . $link . '</td>';
			$html .= '</tr>';
		}

		if ($k <> $last_key) {
			$html .= '<br pagebreak="true" />';
		}

		/* new code split */
		$nop++;
		$fname = "_";
		if ($nop == 100) {
			$html .= '</table>';
			$html = utf8_encode($html);
			$path[] = create_warranty_PDF($heading, $html, $fname);
			unset($html);
			$html = '<table border="1" width="100%" cellpadding="7">';
			$nop = 0;
		}
		/* new code ends */
	}


	$html .= '</table>';
	//echo $html; exit;
	$html = utf8_encode($html);
	$path[] = create_warranty_PDF($heading, $html, $fname);
	$fwViewData['filepath'] = $path;
	unset($html);
}
// MERGE PRINT OPEN AND PENDING Image Thumbnail ENDS HERE

//  7 Day Report Starts Here

$submit7 = $fwRequest->getParam('sevenday', '');
if (!empty($submit7)) {
	$oc = $fwRequest->getParam('oc', '');
	$ina = $fwRequest->getParam('ina', '');

	if ($oc == 1) {
		$where2 = " AND wa_status = 'Open' ";
	} elseif ($oc == 2) {
		$where2 = " AND  wa_status = 'Closed' ";
	}
	$fwViewData['oc'] = $oc;

	$heading = "Warranty Log Report";
	$todate = date('d-m-M', strtotime('- ' . '7 days'));

	$prsql = "SELECT distinct wa_project FROM warranty_log 
	          WHERE STR_TO_DATE(wa_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 7 DAY " . $where2 . "  ORDER BY wa_project ASC";
	if ($prsql) {
		$prData = $fwDb->query($prsql);
	}



	$html = '';
	foreach ($prData as $pk => $pv) {

		$wasql = "SELECT * FROM warranty_log 
	          WHERE STR_TO_DATE(wa_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 7 DAY " . $where2 . " AND wa_project = '" . $pv['wa_project'] . "'";
		if ($wasql) {
			$waData = $fwDb->query($wasql);
		}



		$html .= '<table border="1" width="100%" cellpadding="7">';
		$last_key = end(array_keys($waData));


		$sr = 1;
		foreach ($waData as $k => $m) {

			$sql_p = "Select pr_priority from warranty_log_priority where pr_id = " . $m["wa_priority"];
			$prData = $fwDb->queryOne($sql_p);

			$sq12 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         		bus_customers.bcust_misc_moble from business_sellers 		
	 		    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			    Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '" . $m['wa_project'] . "'";

			$data = $fwDb->queryOne($sq12);

			if ($m["wa_qicc"] == 1) {
				$qicc = 'Yes';
			} else {
				$qicc = 'No';
			}

			if (!empty($m["wa_image_1"])) {

				$folder_path = "files/warranty_log/";
				$object_name = $m["wa_image_1"];
				$file = get_file_raw_data($folder_path, $object_name);
				$img1 = '<img src="' . $file . '" height="150">';

				//	$img1 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_1"].'" height="150">';
			} else {
				$img1 = '';
			}

			if (!empty($m["wa_image_2"])) {
				$folder_path = "files/warranty_log/";
				$object_name = $m["wa_image_2"];
				$file = get_file_raw_data($folder_path, $object_name);
				$img2 = '<img src="' . $file . '" height="150">';

				//	$img2 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_2"].'" height="150">';
			} else {
				$img2 = '';
			}

			if (!empty($m["wa_image_3"])) {
				$folder_path = "files/warranty_log/";
				$object_name = $m["wa_image_3"];
				$file = get_file_raw_data($folder_path, $object_name);
				$img3 = '<img src="' . $file . '" height="150">';
				//	$img3 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_3"].'" height="150">';
			} else {
				$img3 = '';
			}

			if (!empty($m["wa_image_4"])) {
				$folder_path = "files/warranty_log/";
				$object_name = $m["wa_image_4"];
				$file = get_file_raw_data($folder_path, $object_name);
				$img4 = '<img src="' . $file . '" height="150">';
				//	$img4 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_4"].'" height="150">';
			} else {
				$img4 = '';
			}


			if (!empty($m["wa_image_5"])) {
				$folder_path = "files/warranty_log/";
				$object_name = $m["wa_image_5"];
				$file = get_file_raw_data($folder_path, $object_name);
				$img5 = '<img src="' . $file . '" height="150">';
				//	$img5 = '<img src="https://deckquote.s3.amazonaws.com/files/warranty_log/'.$m["wa_image_5"].'" height="150">';
			} else {
				$img5 = '';
			}


			$sql_cg = "select wc_cgfb_option from warranty_log_cgfb where wc_id = " . $m['wa_cgfb_resp'];
			$cgfbdata = $fwDb->queryOne($sql_cg);

			$sql_why = "select ww_option from warranty_log_why_not where ww_id = " . $m['wa_why_not'];
			$whybdata = $fwDb->queryOne($sql_why);

			$sql_la = "select wl_liability_option  from warranty_log_liability where wl_id = " . $m['wa_lia_acc'];
			$labdata = $fwDb->queryOne($sql_la);

			if ($m['wa_tl'] == 1) {
				$backcol = 'style="background-color:#00CC33"';
			} elseif ($m['wa_tl'] == 2) {
				$backcol = 'style="background-color:#ff7f27"';
			} elseif ($m['wa_tl'] == 3) {
				$backcol = 'style="background-color:#F00"';
			} else {
				$backcol = '';
			}
			if ($m['wa_variation'] == 1) {
				$variation = 'Yes';
			} else {
				$variation = 'No';
			}


			$sqlnotes = "select * from warranty_log_notes where wn_wa_id = " . $m['wa_id'];
			$notesData = $fwDb->query($sqlnotes);

			$sql_2 = "Select ws_supplier_name, ws_update_text, ws_attachment, ws_date,ws_wr from warranty_supplier_update where  ws_wa_id = " . $m['wa_id'];
			$suData = $fwDb->query($sql_2);

			$notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
			$notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Attachment</td></tr>';

			if (!empty($notesData)) {

				foreach ($notesData as $kn => $vn) {

					$notes .= '<tr>';
					$notes .= '<td>' . stripslashes($vn['wn_notes']) . '</td>';
					$notes .= '<td>' . $vn['wn_added_by'] . '</td>';
					$notes .= '<td>' . $vn['wn_date'] . '</td>';
					$notes .= '<td>';
					if (!empty($vn['wn_attachment'])) {
						$notes .= '<a target="_blank" href="' . BASE_URL . "files/uploads/" . $vn['wn_attachment'] . '">Link</a>';
					}
					$notes .= '</td>';
					$notes .= '</tr>';
				}
			}


			if (!empty($suData)) {

				foreach ($suData as $kn2 => $vn2) {

					$notes .= '<tr>';
					$notes .= '<td>' . stripslashes($vn2['ws_update_text']) . '</td>';
					$notes .= '<td>' . $vn2['ws_supplier_name'] . '</td>';
					$notes .= '<td>' . changedate_d_m_y($vn2['ws_date']) . '</td>';
					$notes .= '<td>';
					if (!empty($vn2['ws_attachment'])) {
						$notes .= '<a target="_blank" href="https://www.warrantyreport.com.au/files/uploads/' . $vn2['ws_attachment'] . '">Link</a>';
					}
					$notes .= '</td>';
					$notes .= '</tr>';
				}
			}


			$notes .= '</table>';

			if (empty($notesData) && empty($suData)) {
				$notes = "";
			}


			$sql5678 = "Select business_tasks.bt_completed_date from business_tasks
			     where business_tasks.bt_bsn_id = " . $data['bs_business_id'] . " And business_tasks.bt_task_id = 254 ";

			$data2 = $fwDb->queryOne($sql5678);

			$m["wa_problem"] = str_replace("’", "'", $m["wa_problem"]);
			//$m["wa_notes"] = str_replace("’","'",$m["wa_notes"]);

			$dayscount = '';
			$ccdate = $m['wa_date'];
			if (!empty($ccdate)) {
				$Statusdate = changedate_y_m_d($ccdate);
				$curdate_y_m_d = date('Y-m-d');
				$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
			}


			$html .= '<tr style="background-color:#FF0; text-align:center">';
			$html .= '<th  colspan="2">Rec. No. ' . $m["wa_id"] . ' </th>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Project</td>';
			$html .= '<td width="85%">' . $m["wa_project"] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Contact Info</td>';
			$html .= '<td width="85%">' . $data['bcust_fname'] . ' ' . $data['bcust_lname'] . ' - Mobile No :' . $data['bcust_misc_moble'] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">CGFB Responsible</td>';
			$html .= '<td width="85%">' . $cgfbdata["wc_cgfb_option"] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Why Not Responsible</td>';
			$html .= '<td width="85%">' . $whybdata["ww_option"] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Liability Accepted</td>';
			$html .= '<td width="85%">' . $labdata["wl_liability_option"] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Status</td>';
			$html .= '<td width="85%">' . $m["wa_status"] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Traffic Light</td>';
			$html .= '<td width="85%"' . $backcol . '></td>';
			$html .= '</tr>';


			$html .= '<tr>';
			$html .= '<td width="15%">Variation Required</td>';
			$html .= '<td width="85%">' . $variation . '</td>';
			$html .= '</tr>';


			$html .= '<tr>';
			$html .= '<td width="15%">Priority</td>';
			$html .= '<td width="85%">' . $prData['pr_priority'] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Problem</td>';
			$html .= '<td width="85%">' . $m["wa_problem"] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Notes</td>';
			$html .= '<td width="85%">' . $notes . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Date</td>';
			$html .= '<td width="85%">' . trim($m["wa_date"]) . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Walkthrough Date</td>';
			$html .= '<td width="85%">' . changedate_d_m_y($data2['bt_completed_date']) . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Days Count</td>';
			$html .= '<td width="85%">' . $dayscount . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Type</td>';
			$html .= '<td width="85%">' . $m["wa_type"] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Tenated</td>';
			$html .= '<td width="85%">' . $m["wa_tenanted"] . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
			$html .= '<td width="85%">' . trim($qicc) . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">Date Inspected</td>';
			$html .= '<td width="85%">' . trim($m["wa_date_inspected"]) . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td width="15%">CGFB Person</td>';
			$html .= '<td width="85%">' . $m["wa_cgfb_person"] . '</td>';
			$html .= '</tr>';

			$x = explode("<br>", $m['wa_include_supplier']);
			$incsup = [];
			foreach ($x as $k3 => $v3) {
				preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
				$incsup[] = $str[0];
			}

			$html .= '<tr>';
			$html .= '<td width="15%">Supplier or Contact</td>';
			$html .= '<td width="85%">' . implode("<br>", $incsup) . '</td>';
			$html .= '</tr>';

			$html .= '<tr>';
			$html .= '<td colspan="2">' . $img1 . '&nbsp;' . $img2 . '&nbsp;' . $img3 . '&nbsp;' . $img4 . '&nbsp;' . $img5 . '</td>';
			$html .= '</tr>';
			if ($k <> $last_key) {
				$html .= '<br pagebreak="true" />';
			}

			//$html = utf8_encode($html);

			$sr++;
		}
		$html .= '</table>';
	}



	create_warranty_PDF($heading, $html, $fname);
}



if ($pagenum > 1) {
	if (isset($_SESSION['ord'])) {
		$ord = $_SESSION['ord'];
	}
	if (isset($_SESSION['where'])) {
		$where = $_SESSION['where'];
	}
}

if (isset($_SESSION['where'])) {
	$where = $_SESSION['where'];
}


//$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . " " . $where . ' ' . $ord;
if ($unallocated_logs):
	//clearAllFilterSearch();
	$_SESSION['unallocated_logs'] = $unallocated_logs;
	$fwViewData['unallocated_logs'] = $_SESSION['unallocated_logs'];
	$matsql = "SELECT DISTINCT wl.*
FROM warranty_log wl
WHERE wl.wa_status = 'Open'
  AND (
    NOT EXISTS (
      SELECT 1
      FROM supplier_warranty sw
      WHERE sw.sa_wa_id = wl.wa_id
    )
    OR    
    EXISTS (
      SELECT 1
      FROM supplier_warranty sw2
      WHERE sw2.sa_wa_id = wl.wa_id
        AND sw2.sa_co_id IS NOT NULL
        AND NOT EXISTS (
          SELECT 1
          FROM supplier_email_warranty sew
          WHERE sew.se_wa_id = sw2.sa_wa_id
            AND sew.se_co_id = sw2.sa_co_id
        )
    )
  )
ORDER BY wl.wa_id ASC";
elseif ($_SESSION['unallocated_logs']):
	$matsql = "SELECT DISTINCT wl.*
FROM warranty_log wl
WHERE wl.wa_status = 'Open'
  AND (
    NOT EXISTS (
      SELECT 1
      FROM supplier_warranty sw
      WHERE sw.sa_wa_id = wl.wa_id
    )
    OR    
    EXISTS (
      SELECT 1
      FROM supplier_warranty sw2
      WHERE sw2.sa_wa_id = wl.wa_id
        AND sw2.sa_co_id IS NOT NULL
        AND NOT EXISTS (
          SELECT 1
          FROM supplier_email_warranty sew
          WHERE sew.se_wa_id = sw2.sa_wa_id
            AND sew.se_co_id = sw2.sa_co_id
        )
    )
  )
ORDER BY wl.wa_id ASC";
else:
	$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . " " . $where . ' ' . $ord;
endif;

if ($matsql) {
	$userData = $fwDb->query($matsql);
}


$sql_open = "Select count(*) as open from warranty_log where wa_status = 'Open' ";
$fwViewData['tot_open'] = $fwDb->queryOne($sql_open);

$sql_open = "Select count(*) as pending from warranty_log where wa_status = 'Pending'";
$fwViewData['tot_pending'] = $fwDb->queryOne($sql_open);

$sql_seven = "SELECT count(*) as seven FROM warranty_log 
	         WHERE STR_TO_DATE(wa_date , '%d-%m-%Y' ) > CURDATE( ) - INTERVAL 7 DAY ";
$fwViewData['tot_seven'] = $fwDb->queryOne($sql_seven);

$sql_ninety = "SELECT count(*) as ninety FROM warranty_log 
	           WHERE wa_status = 'Open' and STR_TO_DATE(wa_date , '%d-%m-%Y' ) < CURDATE( ) - INTERVAL 90 DAY ";
$fwViewData['tot_ninety'] = $fwDb->queryOne($sql_ninety);

$sql_unallocated = "Select count(*) as total_unallocated from ( SELECT DISTINCT wl.* FROM warranty_log wl WHERE wl.wa_status = 'Open' AND ( NOT EXISTS ( SELECT 1 FROM supplier_warranty sw WHERE sw.sa_wa_id = wl.wa_id ) OR EXISTS ( SELECT 1 FROM supplier_warranty sw2 WHERE sw2.sa_wa_id = wl.wa_id AND sw2.sa_co_id IS NOT NULL AND NOT EXISTS ( SELECT 1 FROM supplier_email_warranty sew WHERE sew.se_wa_id = sw2.sa_wa_id AND sew.se_co_id = sw2.sa_co_id ) ) ) ) as Sub";
$fwViewData['tot_unallocated'] = $fwDb->queryOne($sql_unallocated);

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

			$setdata2[] = $list;
		endforeach;

		$fwViewData['list'] = $setdata2;
	}
}

if (!empty($setdata2)) {

	foreach ($setdata2 as $k => $v2) {
		// $endTime = microtime(true);
		// $executionTime = $endTime - $startTime;
		// echo "START LOOP: " . $k;
		// db($executionTime); // 199 - 6.8639209270477

		$sq12 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         bus_customers.bcust_misc_moble from business_sellers 		
	     Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	     Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name Like '%" . $v2['wa_project'] . "%'";

		$data = $fwDb->queryOne($sq12);

		$projectLink = $v2['wa_project'];
		if(!empty($data['bs_business_id'])) {
			$projectLink = '<a target="_blank" href="business.detail/bsn_id/' . $data['bs_business_id'] . '">' . $v2['wa_project'] . '</a>';
		}
		$setdata2[$k]['project_link'] = $projectLink;


		$dayscount = '';
		$ccdate = $v2['wa_date'];
		if (!empty($ccdate)) {
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}

		$sql_t = "Select wa_id  from trade_responsibility where wa_log_number = " . $v2['wa_id'];
		$data_tr = $fwDb->queryOne($sql_t);


		$sqlenq = "Select we_answer from warranty_enquiry where we_wa_id = " . $v2['wa_id'];
		$ansdata = $fwDb->query($sqlenq);

		$sql_ud = "Select max(ws_date) as update_date from warranty_supplier_update where  ws_wa_id = " . $v2['wa_id'];
		$udData = $fwDb->queryOne($sql_ud);

		$sql_nt = "Select max(STR_TO_DATE(wn_date, '%d-%m-%Y' )) as notes_date from warranty_log_notes where wn_wa_id = " . $v2['wa_id'];
		$ntdata = $fwDb->queryOne($sql_nt);

		$sql_nt2 = "Select max(ws_date) as notes_date2 from warranty_supplier_update where ws_wa_id = " . $v2['wa_id'];
		$ntdata2 = $fwDb->queryOne($sql_nt2);



		$lnsql_1 = "select wn_notes from warranty_log_notes where wn_date = '" . changedate_d_m_Y($ntdata['notes_date']) . "' and wn_wa_id = " . $v2['wa_id'];
		$nd_1 = $fwDb->queryOne($lnsql_1);

		$sql_comch2 = "Select max(ws_date) as ws_date from warranty_supplier_update 
                 where ws_wa_id = " . $v2['wa_id'];
		$chkcomp2 = $fwDb->queryOne($sql_comch2);



		$lnsql_2 = "select ws_update_text from warranty_supplier_update 
               where ws_date = '" . $chkcomp2['ws_date'] . "' and ws_wa_id = " . $v2['wa_id'];
		$nd_2 = $fwDb->queryOne($lnsql_2);



		if (strtotime($ntdata['notes_date']) > strtotime($ntdata2['notes_date2'])) {
			$ndate =  $ntdata['notes_date'];
			$setdata2[$k]['notes_text'] = $nd_1['wn_notes'];
		} else {
			$ndate =  $ntdata2['notes_date2'];
			$setdata2[$k]['notes_text'] = $nd_2['ws_update_text'];
		}





		$sql_comch = "Select max(STR_TO_DATE(ch_date, '%d-%m-%Y' ))  as comp_date from warranty_checklist 
               where ch_wa_id = " . $v2['wa_id'] . " and ch_status = 'Complete'";
		$chkcomp = $fwDb->queryOne($sql_comch);


		if (!empty($chkcomp['comp_date'])) {
			$sql99 = "select wc_task_name from warranty_checklist_admin
 	              Inner Join warranty_checklist On warranty_checklist_admin.wc_id = warranty_checklist.ch_checklist 
				  where warranty_checklist.ch_date = '" . changedate_d_m_Y($chkcomp['comp_date']) . "' and ch_wa_id = " . $v2['wa_id'];

			$chdata = $fwDb->queryOne($sql99);

			$setdata2[$k]['task_name'] = $chdata['wc_task_name'];
		} else {
			$setdata2[$k]['task_name'] = '';
		}



		$sql100 = "select sa_co_id from supplier_warranty where sa_wa_id = " . $v2['wa_id'];
		$data100 = $fwDb->query($sql100);

		$red = 0;
		foreach ($data100 as $k10 => $v10) {
			$sql101 = "Select se_co_id from supplier_email_warranty where se_co_id = " . $v10['sa_co_id'] . " and se_wa_id = " . $v2['wa_id'];
			$found = $fwDb->query($sql101);
			if (empty($found)) {
				$red = 1;
			}
		}


		$sql_11 = "Select  DATEDIFF(STR_TO_date(wn_due_date, '%d-%m-%Y'), CURDATE()) as diff_wn 
               from warranty_log_notes where wn_wa_id = " . $v2['wa_id'] . " 
			   and DATEDIFF(STR_TO_date(wn_due_date, '%d-%m-%Y'), CURDATE()) < 0 and wn_resolved = 0 ";
		$data11 = $fwDb->query($sql_11);

		$sql_22 = "Select DATEDIFF(STR_TO_date(ws_due_date, '%d-%m-%Y'), CURDATE()) as diff_ws 
                from warranty_supplier_update where  ws_wa_id = " . $v2['wa_id'] .  " 
				and DATEDIFF(STR_TO_date(ws_due_date, '%d-%m-%Y'), CURDATE()) < 0 and ws_resolved = 0 ";
		$data22 = $fwDb->query($sql_22);


		$setdata2[$k]['wa_project'] = stripslashes($v2['wa_project']);

		$setdata2[$k]['bs_business_id'] = $data['bs_business_id'];
		$setdata2[$k]['bs_customers_id'] = $data['bs_customers_id'];
		$setdata2[$k]['bcust_fname'] = $data['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $data['bcust_lname'];
		$setdata2[$k]['bcust_misc_moble'] = $data['bcust_misc_moble'];
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['wa_selected'] = $red;
		$setdata2[$k]['update_date'] = changedate_d_m_y($udData['update_date']);
		$setdata2[$k]['notes_date']  = changedate_d_m_y($ndate);

		if (!empty($data11) || !empty($data22)) {
			$setdata2[$k]['cell_red'] = 1;
		} else {
			$setdata2[$k]['cell_red'] = 0;
		}


		if (!empty($data_tr['wa_id'])) {
			$setdata2[$k]['wa_button'] =  $data_tr['wa_id'];
		}

		$setdata2[$k]['enquiry_pen'] = 0;
		foreach ($ansdata as $k4 => $v4) {
			if (strlen(trim($v4['we_answer'])) == 0 || $v4['we_answer'] == NULL) {
				$setdata2[$k]['enquiry_pen'] = 1;
				break;
			}
		}
		$sql4 = "select count(*) as tot from warranty_supplier_update where ws_wa_id = " . $v2['wa_id'];
		$cudata = $fwDb->queryOne($sql4);

		if ($cudata['tot'] > 0) {
			$setdata2[$k]['supplier_upadate'] = true;
		}

		$setdata2[$k]['wa_lia_acc'] = $v2['wa_lia_acc'];

		$sql5 = "Select count(*) as tot_cd from warranty_checklist where ch_wa_id = " . $v2['wa_id'] . " and ch_status IN ('Complete')";
		$cd_data = $fwDb->queryOne($sql5);

		$setdata2[$k]['tot_cd'] = $cd_data['tot_cd'];

		$sql1234 = "Select bsn_id from business where bsn_name like '%" . $v2['wa_project'] . "%'";
		//db($sql1234);
		$bsnData = $fwDb->queryOne($sql1234);

		$sql5678 = "Select business_tasks.bt_completed_date from business_tasks
			     where business_tasks.bt_bsn_id = " . $bsnData['bsn_id'] . " And business_tasks.bt_task_id = 254 ";

		$data2 = $fwDb->queryOne($sql5678);

		$setdata2[$k]['bt_completed_date_254'] = changedate_d_m_y($data2['bt_completed_date']);

		if ($bsnData['bsn_id']) {
			//$bsn_id = $bsnRow['bsn_id'];
			$bsn_id = $bsnData['bsn_id'];

			//get and add hia_value and ppd_value
			$sqlSum = "SELECT SUM( CASE WHEN TRIM(ppd_hia_value) <> '' THEN CAST(REPLACE(REPLACE(ppd_hia_value, '$', ''), ',', '') AS DECIMAL(10,2)) ELSE 0 END ) AS total_hia, SUM( CASE WHEN TRIM(ppd_value) <> '' THEN CAST(REPLACE(REPLACE(ppd_value, '$', ''), ',', '') AS DECIMAL(10,2)) ELSE 0 END ) AS total_ppd FROM progress_payment_detail WHERE ppd_bsn_id =" . $bsn_id;
			$sumRow = $fwDb->queryOne($sqlSum);

			//$sumRow = $fwDb->queryOne($sqlSum, [$bsn_id]);

			$total_hia = isset($sumRow['total_hia']) ? (float)$sumRow['total_hia'] : 0;
			$total_ppd = isset($sumRow['total_ppd']) ? (float)$sumRow['total_ppd'] : 0;

			// Step 3: Calculate difference
			if ($total_hia > 0) {
				if ($total_ppd > 0) {
					$outstanding = $total_hia - $total_ppd;
				} else {
					$outstanding = $total_hia;
				}
				$setdata2[$k]['project_balance'] = ($outstanding < 0 ? "-$" : "$") . number_format(abs($outstanding), 2, '.', ',');
			} else {
				$setdata2[$k]['project_balance'] = '';
			}
		} else {
			$setdata2[$k]['project_balance'] = '';
		}

		if ($bsnData['bsn_id']) {
			$bsn_id = $bsnData['bsn_id'];
			$sql_outstanding_inv = "SELECT bsn_wa_outstanding_payment FROM business where bsn_id = " . $bsn_id;
			$data_outstanding_inv = $fwDb->queryOne($sql_outstanding_inv);
			$setdata2[$k]['outstanding_invoices'] = $data_outstanding_inv['bsn_wa_outstanding_payment'];
		} else {
			$setdata2[$k]['outstanding_invoices'] = '';
		}
	}


	// Apply filter only when "Sort By Notes due Date" button is clicked
	if ($sortNotesDueDate) {
		$setdata2 = array_filter($setdata2, function ($item) {
			return isset($item['cell_red']) && $item['cell_red'] == 1;
		});
	}


	$fwViewData['list'] = $setdata2;
	$fwViewData['title'] = $MODULE_PLURAL;
	//echo "<pre>"; print_r($fwViewData['list']); exit('Checking Notes');
	unset($setdata2);
} else {
	$fwViewData['notfound'] = 'No Open Logs Found. If you think record is found but not showing Please click on CLEAR All SEARCH button <br>
	                           If there is a closed log then click on Closed Log Button ';
}

$sqlpr = "Select * from warranty_log_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr);


$thisTable = new Fw_Db_Table("warranty_log_type");
$fwViewData['typedetail'] = $thisTable->getAllRows();

$areaTable = new Fw_Db_Table("warranty_log_area");
$fwViewData['areadetail'] = $areaTable->getAllRows();

$areaTable = new Fw_Db_Table("warranty_log_cgfb");
$fwViewData['cgfbdetail'] = $areaTable->getAllRows();

$whynotTable = new Fw_Db_Table("warranty_log_why_not");
$fwViewData['whynotdetail'] = $whynotTable->getAllRows();

$thisLT = new Fw_Db_Table("warranty_log_liability");
$fwViewData['liadetail'] = $thisLT->getAllRows();

//  Merge Print Filter by priority

$submit = $fwRequest->getParam('print_filter', '');
if (!empty($submit)) {

	$pr = $fwRequest->getParam('search_by_priority', '');

	if ($pr > 0) {
		$where = " where wa_priority = " . $pr;
	}


	$heading = "Warranty Log Report";

	$ord =  " ORDER BY if(  warranty_log.wa_date = ' '
              OR warranty_log.wa_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log.wa_date, '%d-%m-%Y' ) ";


	$wasql = "SELECT * from warranty_log " . $where . " " . $ord;
	//$wasql = "SELECT * from warranty_log " . $where . " " . $ord . " limit 0, 80 ";

	if ($wasql) {
		$waData = $fwDb->query($wasql);
	}


	$html = '';
	$html .= '<table border="1" width="100%" cellpadding="7">';


	$last_key = end(array_keys($waData));

	$qry = "SELECT pr_id, pr_priority from warranty_log_priority";
	$res = $fwDb->query($qry);
	$prData = [];
	foreach ($res as $row) {
		$prData[$row['pr_id']] = $row;
	}

	$qry = "SELECT business.bsn_name, business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble from business_sellers
		Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		Inner Join business ON business_sellers.bs_business_id = business.bsn_id";
	$res = $fwDb->query($qry);
	$data = [];
	foreach ($res as $row) {
		$data[$row['bsn_name']] = $row;
	}

	$qry = "SELECT wc_id, wc_cgfb_option from warranty_log_cgfb";
	$res = $fwDb->query($qry);
	$cgfbdata = [];
	foreach ($res as $row) {
		$cgfbdata[$row['wc_id']] = $row;
	}

	$qry = "SELECT ww_id, ww_option from warranty_log_why_not";
	$res = $fwDb->query($qry);
	$whybdata = [];
	foreach ($res as $row) {
		$whybdata[$row['ww_id']] = $row;
	}

	$qry = "SELECT wl_id, wl_liability_option from warranty_log_liability";
	$res = $fwDb->query($qry);
	$labdata = [];
	foreach ($res as $row) {
		$labdata[$row['wl_id']] = $row;
	}

	$qry = "SELECT * from warranty_log_notes";
	$res = $fwDb->query($qry);
	$notesData = [];
	foreach ($res as $row) {
		if (!isset($notesData[$row['wn_wa_id']])) {
			$notesData[$row['wn_wa_id']] = [];
		}
		$notesData[$row['wn_wa_id']][] = $row;
	}

	$qry = "SELECT ws_wa_id, ws_supplier_name, ws_update_text, ws_attachment, ws_date, ws_wr from warranty_supplier_update";
	$res = $fwDb->query($qry);
	$suData = [];
	foreach ($res as $row) {
		if (!isset($suData[$row['ws_wa_id']])) {
			$suData[$row['ws_wa_id']] = [];
		}
		$suData[$row['ws_wa_id']][] = $row;
	}

	$qry = "SELECT bt_bsn_id, bt_completed_date from business_tasks where bt_task_id = 254";
	$res = $fwDb->query($qry);
	$data2 = [];
	foreach ($res as $row) {
		$data2[$row['bt_bsn_id']] = $row;
	}

	foreach ($waData as $k => $m) {
		if ($m["wa_qicc"] == 1) {
			$qicc = 'Yes';
		} else {
			$qicc = 'No';
		}

		// if (!empty($m["wa_image_1"])) {
		// 	$folder_path = "files/warranty_log/";
		// 	$object_name = $m["wa_image_1"];
		// 	$file = get_file_raw_data($folder_path, $object_name);
		// 	$img1 = '<img src="' . $file . '" height="150">';
		// } else {
		// 	$img1 = '';
		// }

		// if (!empty($m["wa_image_2"])) {
		// 	$folder_path = "files/warranty_log/";
		// 	$object_name = $m["wa_image_2"];
		// 	$file = get_file_raw_data($folder_path, $object_name);
		// 	$img2 = '<img src="' . $file . '" height="150">';
		// } else {
		// 	$img2 = '';
		// }

		// if (!empty($m["wa_image_3"])) {
		// 	$folder_path = "files/warranty_log/";
		// 	$object_name = $m["wa_image_3"];
		// 	$file = get_file_raw_data($folder_path, $object_name);
		// 	$img3 = '<img src="' . $file . '" height="150">';
		// } else {
		// 	$img3 = '';
		// }

		// if (!empty($m["wa_image_4"])) {
		// 	$folder_path = "files/warranty_log/";
		// 	$object_name = $m["wa_image_4"];
		// 	$file = get_file_raw_data($folder_path, $object_name);
		// 	$img4 = '<img src="' . $file . '" height="150">';
		// } else {
		// 	$img4 = '';
		// }


		// if (!empty($m["wa_image_5"])) {
		// 	$folder_path = "files/warranty_log/";
		// 	$object_name = $m["wa_image_5"];
		// 	$file = get_file_raw_data($folder_path, $object_name);
		// 	$img5 = '<img src="' . $file . '" height="150">';
		// } else {
		// 	$img5 = '';
		// }

		$link = '';
		$files = $photos[$m['wa_id']] ?? [];
		foreach($files as $index => $row) {
			$link .= ('<a target="_blank" href="' . $row['url'] . '">Link of Image ' . ($index + 1) . '</a><br>');
		}

		if ($m['wa_tl'] == 1) {
			$backcol = 'style="background-color:#00CC33"';
		} elseif ($m['wa_tl'] == 2) {
			$backcol = 'style="background-color:#ff7f27"';
		} elseif ($m['wa_tl'] == 3) {
			$backcol = 'style="background-color:#F00"';
		} else {
			$backcol = '';
		}
		if ($m['wa_variation'] == 1) {
			$variation = 'Yes';
		} else {
			$variation = 'No';
		}

		$notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
		$notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Attachment</td></tr>';

		if (!empty($notesData[$m['wa_id']])) {
			foreach ($notesData[$m['wa_id']] as $kn => $vn) {
				$notes .= '<tr>';
				$notes .= '<td>' . stripslashes($vn['wn_notes']) . '</td>';
				$notes .= '<td>' . $vn['wn_added_by'] . '</td>';
				$notes .= '<td>' . $vn['wn_date'] . '</td>';
				$notes .= '<td>';
				if (!empty($vn['wn_attachment'])) {
					$notes .= '<a target="_blank" href="' . BASE_URL . "files/uploads/" . $vn['wn_attachment'] . '">Link</a>';
				}
				$notes .= '</td>';
				$notes .= '</tr>';
			}
		}

		if (!empty($suData[$m['wa_id']])) {
			foreach ($suData[$m['wa_id']] as $kn2 => $vn2) {
				$notes .= '<tr>';
				$notes .= '<td>' . stripslashes($vn2['ws_update_text']) . '</td>';
				$notes .= '<td>' . $vn2['ws_supplier_name'] . '</td>';
				$notes .= '<td>' . changedate_d_m_y($vn2['ws_date']) . '</td>';
				$notes .= '<td>';
				if (!empty($vn2['ws_attachment'])) {
					$notes .= '<a target="_blank" href="https://www.warrantyreport.com.au/files/uploads/' . $vn2['ws_attachment'] . '">Link</a>';
				}
				$notes .= '</td>';
				$notes .= '</tr>';
			}
		}

		$notes .= '</table>';

		if (empty($notesData[$m['wa_id']]) && empty($suData[$m['wa_id']])) {
			$notes = "";
		}

		$m["wa_problem"] = str_replace("’", "'", $m["wa_problem"]);

		$dayscount = '';
		$ccdate = $m['wa_date'];
		if (!empty($ccdate)) {
			$Statusdate = changedate_y_m_d($ccdate);
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}

		$html .= '<tr style="background-color:#FF0; text-align:center">';
		$html .= '<th  colspan="2">Rec. No. ' . $m["wa_id"] . ' </th>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Project</td>';
		$html .= '<td width="85%">' . $m["wa_project"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Contact Info</td>';
		$html .= '<td width="85%">' . $data[$m['wa_project']]['bcust_fname'] . ' ' . $data[$m['wa_project']]['bcust_lname'] . ' - Mobile No :' . $data[$m['wa_project']]['bcust_misc_moble'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Responsible</td>';
		$html .= '<td width="85%">' . $cgfbdata[$m['wa_cgfb_resp']]["wc_cgfb_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Why Not Responsible</td>';
		$html .= '<td width="85%">' . $whybdata[$m['wa_why_not']]["ww_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Liability Accepted</td>';
		$html .= '<td width="85%">' . $labdata[$m['wa_lia_acc']]["wl_liability_option"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Status</td>';
		$html .= '<td width="85%">' . $m["wa_status"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Traffic Light</td>';
		$html .= '<td width="85%"' . $backcol . '></td>';
		$html .= '</tr>';


		$html .= '<tr>';
		$html .= '<td width="15%">Variation Required</td>';
		$html .= '<td width="85%">' . $variation . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Priority</td>';
		$html .= '<td width="85%">' . $prData[$m["wa_priority"]]['pr_priority'] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Problem</td>';
		$html .= '<td width="85%">' . preg_replace('/[[:^print:]\x00-\x1F\x7F]/', '', $m["wa_problem"]) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Notes</td>';
		$html .= '<td width="85%">' . $notes . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date</td>';
		$html .= '<td width="85%">' . trim($m["wa_date"]) . '</td>';
		$html .= '</tr>';

		$data2_bt_completed_date = $data2[$data[$m['wa_project']]['bs_business_id']]['bt_completed_date'];
		$html .= '<tr>';
		$html .= '<td width="15%">Walkthrough Date</td>';
		$html .= '<td width="85%">' . changedate_d_m_y($data2_bt_completed_date) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Days Count</td>';
		$html .= '<td width="85%">' . $dayscount . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Type</td>';
		$html .= '<td width="85%">' . $m["wa_type"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Tenated</td>';
		$html .= '<td width="85%">' . $m["wa_tenanted"] . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
		$html .= '<td width="85%">' . trim($qicc) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">Date Inspected</td>';
		$html .= '<td width="85%">' . trim($m["wa_date_inspected"]) . '</td>';
		$html .= '</tr>';

		$html .= '<tr>';
		$html .= '<td width="15%">CGFB Person</td>';
		$html .= '<td width="85%">' . $m["wa_cgfb_person"] . '</td>';
		$html .= '</tr>';


		$x = explode("<br>", $m['wa_include_supplier']);
		$incsup = [];
		foreach ($x as $k3 => $v3) {
			preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
			$incsup[] = $str[0];
		}

		$html .= '<tr>';
		$html .= '<td width="15%">Supplier or Contact</td>';
		$html .= '<td width="85%">' . implode("<br>", $incsup) . '</td>';
		$html .= '</tr>';

		// $html .= '<tr>';
		// $html .= '<td colspan="2">' . $img1 . '&nbsp;' . $img2 . '&nbsp;' . $img3 . '&nbsp;' . $img4 . '&nbsp;' . $img5 . '</td>';
		// $html .= '</tr>';

		if ($link) {
			$html .= '<tr>';
			$html .= '<td width="15%">Attachments</td>';
			$html .= '<td width="85%">' . $link . '</td>';
			$html .= '</tr>';
		}

		if ($k <> $last_key) {
			$html .= '<br pagebreak="true" />';
		}
	}

	$html .= '</table>';
	$html = utf8_encode($html);
	unset($waData);
	create_warranty_PDF($heading, $html, $fname);
}

// Merge Print Ends here 

$sqlRe = "Select distinct cs_position from contacts where cs_position <> ''";
$fwViewData['rsdetail'] = $fwDb->query($sqlRe);

$sql_pro = "select distinct wa_project from warranty_log";
$fwViewData['project_data'] = $fwDb->query($sql_pro);


$sqls = "select co_id, co_company_name from companies order by co_company_name";
$fwViewData['supdetail'] = $fwDb->query($sqls);

// For Checlist  Column

$sqlcc = "select count(*) as tot_chk from warranty_checklist_admin";
$datacc = $fwDb->queryOne($sqlcc);
$fwViewData['tot_chk'] =  $datacc['tot_chk'];

$single_log = $fwRequest->getParam('single_log', '');
if (!empty($single_log)) {
	$wa_id = $fwRequest->getParam('wa_id', '');
	$heading = "Warranty Log Report";

	$onesql = "SELECT * FROM warranty_log  where wa_id = " . $wa_id;

	$oneData = $fwDb->queryOne($onesql);

	$html .= '<table border="1" width="100%" cellpadding="7">';


	$sql_p = "Select pr_priority from warranty_log_priority where pr_id = " . $oneData["wa_priority"];
	$prData = $fwDb->queryOne($sql_p);

	$sq12 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         		bus_customers.bcust_misc_moble from business_sellers 		
	 		    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
			    Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '" . $oneData['wa_project'] . "'";

	$data = $fwDb->queryOne($sq12);

	if ($oneData["wa_qicc"] == 1) {
		$qicc = 'Yes';
	} else {
		$qicc = 'No';
	}

	$link = '';
	$files = $photos[$oneData['wa_id']] ?? [];
	foreach($files as $index => $row) {
		$folder_path = "files/warranty_log/";
		$object_name = $row['file'];
		$file = get_file_raw_data($folder_path, $object_name);
		if ($file !== false) {
			$link .= '<img src="' . $file . '" alt="Image ' . ($index + 1) . '" style="height: 160px; margin: 5px;"><br>';
		} else {
			$link .= '';
		}
	}
	// db($link); exit;

	// if (!empty($oneData["wa_image_1"])) {

	// 	$folder_path = "files/warranty_log/";
	// 	$object_name = $oneData["wa_image_1"];
	// 	$file = get_file_raw_data($folder_path, $object_name);
	// 	$img1 = '<img src="' . $file . '" height="150">';
	// } else {
	// 	$img1 = '';
	// }

	// if (!empty($oneData["wa_image_2"])) {
	// 	$folder_path = "files/warranty_log/";
	// 	$object_name = $oneData["wa_image_2"];
	// 	$file = get_file_raw_data($folder_path, $object_name);
	// 	$img2 = '<img src="' . $file . '" height="150">';
	// } else {
	// 	$img2 = '';
	// }

	// if (!empty($oneData["wa_image_3"])) {
	// 	$folder_path = "files/warranty_log/";
	// 	$object_name = $oneData["wa_image_3"];
	// 	$file = get_file_raw_data($folder_path, $object_name);
	// 	$img3 = '<img src="' . $file . '" height="150">';
	// } else {
	// 	$img3 = '';
	// }

	// if (!empty($oneData["wa_image_4"])) {
	// 	$folder_path = "files/warranty_log/";
	// 	$object_name = $oneData["wa_image_4"];
	// 	$file = get_file_raw_data($folder_path, $object_name);
	// 	$img4 = '<img src="' . $file . '" height="150">';
	// } else {
	// 	$img4 = '';
	// }


	// if (!empty($oneData["wa_image_5"])) {
	// 	$folder_path = "files/warranty_log/";
	// 	$object_name = $oneData["wa_image_5"];
	// 	$file = get_file_raw_data($folder_path, $object_name);
	// 	$img5 = '<img src="' . $file . '" height="150">';
	// } else {
	// 	$img5 = '';
	// }
	$oneData["wa_problem"] = str_replace("’", "'", $oneData["wa_problem"]);


	$sql_cg = "select wc_cgfb_option from warranty_log_cgfb where wc_id = " . $oneData['wa_cgfb_resp'];
	$cgfbdata = $fwDb->queryOne($sql_cg);

	$sql_why = "select ww_option from warranty_log_why_not where ww_id = " . $oneData['wa_why_not'];
	$whybdata = $fwDb->queryOne($sql_why);

	$sql_la = "select wl_liability_option  from warranty_log_liability where wl_id = " . $oneData['wa_lia_acc'];
	$labdata = $fwDb->queryOne($sql_la);

	if ($oneData['wa_tl'] == 1) {
		$backcol = 'style="background-color:#00CC33"';
	} elseif ($oneData['wa_tl'] == 2) {
		$backcol = 'style="background-color:#ff7f27"';
	} elseif ($oneData['wa_tl'] == 3) {
		$backcol = 'style="background-color:#F00"';
	} else {
		$backcol = '';
	}
	if ($oneData['wa_variation'] == 1) {
		$variation = 'Yes';
	} else {
		$variation = 'No';
	}


	$sqlnotes = "select * from warranty_log_notes where wn_wa_id = " . $oneData['wa_id'];
	$notesData = $fwDb->query($sqlnotes);

	$sql_2 = "Select ws_supplier_name, ws_update_text, ws_attachment, ws_date, ws_wr, ws_due_date from warranty_supplier_update 
	          where  ws_wa_id = " . $oneData['wa_id'];
	$suData = $fwDb->query($sql_2);

	$notes = '<table border = "1" cellpadding="5" cellspacing="0" >';
	$notes .= '<tr><td >Notes</td><td>Added By</td><td>Date Added</td><td>Due Date</td><td>Attachment</td></tr>';

	if (!empty($notesData)) {

		foreach ($notesData as $kn => $vn) {
			$rowHighlighted = '';
			if (!empty($vn['wn_due_date']) && strtotime($vn['wn_due_date']) > 0 && strtotime($vn['wn_due_date']) >= strtotime(date('Y-m-d 00:00:00'))) {
				$rowHighlighted = ' style="background-color:#F00"';
			}
			$notes .= '<tr' . $rowHighlighted . '>';
			$notes .= '<td>' . stripslashes($vn['wn_notes']) . '</td>';
			$notes .= '<td>' . $vn['wn_added_by'] . '</td>';
			$notes .= '<td>' . $vn['wn_date'] . '</td>';
			$notes .= '<td>' . $vn['wn_due_date'] . '</td>';
			$notes .= '<td>';
			if (!empty($vn['wn_attachment'])) {
				$notes .= '<a target="_blank" href="' . BASE_URL . "files/uploads/" . $vn['wn_attachment'] . '">Link</a>';
			}
			$notes .= '</td>';
			$notes .= '</tr>';
		}
	}


	if (!empty($suData)) {

		foreach ($suData as $kn2 => $vn2) {

			$notes .= '<tr>';
			$notes .= '<td>' . stripslashes($vn2['ws_update_text']) . '</td>';
			$notes .= '<td>' . $vn2['ws_supplier_name'] . '</td>';
			$notes .= '<td>' . changedate_d_m_y($vn2['ws_date']) . '</td>';
			$notes .= '<td>' . $vn2['ws_due_date'] . '</td>';
			$notes .= '<td>';
			if (!empty($vn2['ws_attachment'])) {
				$notes .= '<a target="_blank" href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/' . $vn2['ws_attachment'] . '">Link</a>';
			}
			$notes .= '</td>';
			$notes .= '</tr>';
		}
	}


	$notes .= '</table>';

	if (empty($notesData) && empty($suData)) {
		$notes = "";
	}


	$sql5678 = "Select business_tasks.bt_completed_date from business_tasks
			     where business_tasks.bt_bsn_id = " . $data['bs_business_id'] . " And business_tasks.bt_task_id = 254 ";

	$data2 = $fwDb->queryOne($sql5678);

	$oneData["wa_problem"] = str_replace("’", "'", $oneData["wa_problem"]);
	//$oneData["wa_notes"] = str_replace("’","'",$oneData["wa_notes"]);

	$dayscount = '';
	$ccdate = $oneData['wa_date'];
	if (!empty($ccdate)) {
		$Statusdate = changedate_y_m_d($ccdate);
		$curdate_y_m_d = date('Y-m-d');
		$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
	}


	$html .= '<tr style="background-color:#FF0; text-align:center">';
	$html .= '<th  colspan="2">Rec. No. ' . $oneData["wa_id"] . ' </th>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Project</td>';
	$html .= '<td width="85%">' . $oneData["wa_project"] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Contact Info</td>';
	$html .= '<td width="85%">' . $data['bcust_fname'] . ' ' . $data['bcust_lname'] . ' - Mobile No :' . $data['bcust_misc_moble'] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">CGFB Responsible</td>';
	$html .= '<td width="85%">' . $cgfbdata["wc_cgfb_option"] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Why Not Responsible</td>';
	$html .= '<td width="85%">' . $whybdata["ww_option"] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Liability Accepted</td>';
	$html .= '<td width="85%">' . $labdata["wl_liability_option"] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Status</td>';
	$html .= '<td width="85%">' . $oneData["wa_status"] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Traffic Light</td>';
	$html .= '<td width="85%"' . $backcol . '></td>';
	$html .= '</tr>';


	$html .= '<tr>';
	$html .= '<td width="15%">Variation Required</td>';
	$html .= '<td width="85%">' . $variation . '</td>';
	$html .= '</tr>';


	$html .= '<tr>';
	$html .= '<td width="15%">Priority</td>';
	$html .= '<td width="85%">' . $prData['pr_priority'] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Problem</td>';
	$html .= '<td width="85%">' . $oneData["wa_problem"] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Notes</td>';
	$html .= '<td width="85%">' . $notes . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Date</td>';
	$html .= '<td width="85%">' . trim($oneData["wa_date"]) . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Walkthrough Date</td>';
	$html .= '<td width="85%">' . changedate_d_m_y($data2['bt_completed_date']) . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Days Count</td>';
	$html .= '<td width="85%">' . $dayscount . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Type</td>';
	$html .= '<td width="85%">' . $oneData["wa_type"] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Tenated</td>';
	$html .= '<td width="85%">' . $oneData["wa_tenanted"] . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Q. Inspector Contaced Client</td>';
	$html .= '<td width="85%">' . trim($qicc) . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">Date Inspected</td>';
	$html .= '<td width="85%">' . trim($oneData["wa_date_inspected"]) . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td width="15%">CGFB Person</td>';
	$html .= '<td width="85%">' . $oneData["wa_cgfb_person"] . '</td>';
	$html .= '</tr>';

	$x = explode("<br>", $oneData['wa_include_supplier']);
	$incsup = [];
	foreach ($x as $k3 => $v3) {
		preg_match('~>\K[^<>]*(?=<)~',  $v3, $str);
		$incsup[] = $str[0];
	}

	$html .= '<tr>';
	$html .= '<td width="15%">Supplier or Contact</td>';
	$html .= '<td width="85%">' . implode("<br>", $incsup) . '</td>';
	$html .= '</tr>';

	$html .= '<tr>';
	$html .= '<td colspan="2">' . $link . '</td>';
	$html .= '</tr>';

	$html .= '</table>';

	create_warranty_PDF($heading, $html, $fname);
}


$walkthrough_log_count = 0;
$post_walkthrough_count = 0;
$query = 'SELECT wa_type, COUNT(*) AS total FROM `warranty_log` WHERE wa_id IN (SELECT wa_id FROM warranty_log WHERE wa_status = "Open" OR wa_status = "Pending") GROUP BY wa_type;';
$result = $fwDb->query($query);
foreach($result as $row) {
	if($row['wa_type'] == 'Post Walkthrough') {
		$post_walkthrough_count = $row['total'];
	}
	elseif($row['wa_type'] == 'Walkthrough Log') {
		$walkthrough_log_count = $row['total'];
	}
}
$fwViewData['walkthrough_log_count'] = $walkthrough_log_count;
$fwViewData['post_walkthrough_count'] = $post_walkthrough_count;