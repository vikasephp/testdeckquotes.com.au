<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$listdata = $fwRequest->getParam($TABLE, array());
$user_name = $_SESSION['user']['user_name'];

$where = " Where tdt_task_assignee like  '%" . $user_name . "%' ";

$hidecomplete = $fwRequest->getParam('hidecomplete', '');
if (!empty($hidecomplete)) {
	$where = " Where tdt_task_assignee like  '%" . $user_name . "%' AND tdt_status <> 'COMPLETE' ";
	$fwViewData['val'] = 1;
} else {
	$where = " Where tdt_task_assignee like  '%" . $user_name . "%' ";
}

$listdata = $fwRequest->getParam($TABLE, array());
$keyword = $listdata['keyword'];
$keyword2 = $listdata['keyword2'];
$keyword3 = $listdata['keyword3'];

if ($keyword):

	$where .= " AND ( task_designer_tracker.tdt_task_desc LIKE '%" . $keyword . "%' 
	            OR task_designer_tracker.tdt_task_assignee LIKE '%" . $keyword . "%' 
		    OR task_designer_tracker.tdt_task_assigner LIKE '%" . $keyword . "%'  
		    OR task_designer_tracker.tdt_task_type LIKE '%" . $keyword . "%' ) ";

	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];

elseif ($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND ( task_designer_tracker.tdt_task_desc LIKE '%" . $_SESSION['keyword'] . "%' 
	            OR task_designer_tracker.tdt_task_assignee LIKE '%" . $_SESSION['keyword'] . "%' 
		    OR task_designer_tracker.tdt_task_assigner LIKE '%" . $_SESSION['keyword'] . "%' 
		    OR task_designer_tracker.tdt_task_type LIKE '%" . $_SESSION['keyword'] . "%' ) ";

	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;


$ord = '';
$submit = $fwRequest->getParam('sort', '');
if (!empty($submit)) {
	$option = $fwRequest->getParam('sortoption', '');
	if ($option == 1) {
		$ord = " order by tdt_task_assigner ";
	} elseif ($option == 2) {
		$ord = " order by tdt_task_assigner ";
	} elseif ($option == 3) {
		$ord = " ORDER BY if(  tdt_due_date = ' '
	OR tdt_due_date IS NULL , 1, 0 ) , STR_TO_DATE( tdt_due_date, '%d-%m-%Y' ) ";
	} elseif ($option == 4) {
		$ord = " order by tdt_task_type";
	}

	$fwViewData['ord'] = $option;
}

$query = 'SELECT * FROM `pp_design_tracker` WHERE pr_procedure = "Revision Procedure Link:"';
$result = $fwDb->queryOne($query);
$revision_procedure_link = '';
if(!empty($result)) {
	$revision_procedure_link = '<a target="_blank" href="' . $result['pr_link'] . '">Link</a>';
}
$fwViewData['revision_procedure_link'] = $revision_procedure_link;

//$matsql = "SELECT * from task_designer_tracker where tdt_task_assignee like  '%".$user_name."%'";	
$matsql = "SELECT * from task_designer_tracker " . $where . $ord;


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


	foreach ($listsnew as $k => $v2) {

		$sql_a = "select dt_checklist_no from designer_tracker where dt_id = '" . $v2['tdt_dt_id'] . "'";
		$checklist = $fwDb->queryOne($sql_a);

		$sql_b = "select dpn_bsn_id from document_proposal_name where dpn_unique_id = '" . $checklist['dt_checklist_no'] . "'";
		$bsn = $fwDb->queryOne($sql_b);

		if (empty($bsn)) {
			$sql_b = "select dpn_bsn_id from document_renovation_name where dpn_unique_id = '" . $checklist['dt_checklist_no'] . "'";
			$bsn = $fwDb->queryOne($sql_b);
		}

		$bsn_id =  $bsn['dpn_bsn_id'];


		if (!empty($keyword3)) {
			$sql_c = "select bsn_name from business where bsn_id = " . $bsn_id  . " And business.bsn_name like '%" . $keyword3 . "%'";
		} else {
			$sql_c = "select bsn_name from business where bsn_id = " . $bsn_id;
		}



		$bsndata = $fwDb->queryOne($sql_c);

		if (!empty($keyword2)) {

			if ($checklist['dt_checklist_no'] == $keyword2) {
				$setdata2[$k]['tdt_id'] = $v2['tdt_id'];
				$setdata2[$k]['tdt_dt_id'] = $v2['tdt_dt_id'];
				$setdata2[$k]['dt_project_name'] = $bsndata['bsn_name'];
				$setdata2[$k]['dt_checklist_no'] = $checklist['dt_checklist_no'];
				$setdata2[$k]['tdt_task_desc'] = $v2['tdt_task_desc'];
				$setdata2[$k]['tdt_task_assignee'] = $v2['tdt_task_assignee'];
				$setdata2[$k]['tdt_task_assigner'] = $v2['tdt_task_assigner'];
				$setdata2[$k]['tdt_submitted_date'] = changedate_d_m_y($v2['tdt_submitted_date']);
				$setdata2[$k]['tdt_due_date'] = $v2['tdt_due_date'];
				$setdata2[$k]['tdt_status'] = $v2['tdt_status'];
				$setdata2[$k]['dt_assignee'] = $v2['dt_assignee'];
				$setdata2[$k]['tdt_task_type'] = $v2['tdt_task_type'];
				$setdata2[$k]['tdt_priority'] = $v2['tdt_priority'];
			}
		} else {
			if (!empty($bsndata['bsn_name'])) {
				$setdata2[$k]['tdt_id'] = $v2['tdt_id'];
				$setdata2[$k]['tdt_dt_id'] = $v2['tdt_dt_id'];
				$setdata2[$k]['dt_project_name'] = $bsndata['bsn_name'];
				$setdata2[$k]['dt_checklist_no'] = $checklist['dt_checklist_no'];
				$setdata2[$k]['tdt_task_desc'] = $v2['tdt_task_desc'];
				$setdata2[$k]['tdt_task_assignee'] = $v2['tdt_task_assignee'];
				$setdata2[$k]['tdt_task_assigner'] = $v2['tdt_task_assigner'];
				$setdata2[$k]['tdt_submitted_date'] = changedate_d_m_y($v2['tdt_submitted_date']);
				$setdata2[$k]['tdt_due_date'] = $v2['tdt_due_date'];
				$setdata2[$k]['tdt_status'] = $v2['tdt_status'];
				$setdata2[$k]['dt_assignee'] = $v2['dt_assignee'];
				$setdata2[$k]['tdt_task_type'] = $v2['tdt_task_type'];
				$setdata2[$k]['tdt_priority'] = $v2['tdt_priority'];
			}
		}
	}
}
if ($option == 2) {
	foreach ($setdata2 as $key => $row) {
		// replace 0 with the field's index/key
		$dates[$key]  = $row['dt_checklist_no'];
	}
	array_multisort($dates, SORT_ASC, $setdata2);
}
if (empty($setdata2)) {
	$fwViewData['notask'] = "No task is assign";
}
$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlpr = "Select * from design_tracker_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr);

$sql_checklist = "Select * from design_tracker_checklist";
$fwViewData['d_checklist'] = $fwDb->query($sql_checklist);

