<?php
$fwMainView = 'file:' . getcwd() . '/delay_list.tpl';

$pdr_id = (int)$fwRequest->getParam($ID, 0);
$pagenum = $fwRequest->getparamget('pagenum', 0);

$pdrTable = new Fw_Db_Table($TABLE);
$pdrTable->setWhere("$ID = $pdr_id");
$pdrRow = $pdrTable->getRow();

$fwViewData['pdr_id'] = $pdr_id;
$fwViewData['pdr_project_address'] = $pdrRow['pdr_project_address'];
$fwViewData['title'] = 'Delay Entries';

$statusFilter = trim((string)$fwRequest->getParam('status', ''));
if ($statusFilter !== 'Pending' && $statusFilter !== 'Approved') {
	$statusFilter = '';
}
$fwViewData['status_filter'] = $statusFilter;
if ($statusFilter === 'Pending') {
	$fwViewData['title'] = 'Pending Confirmation Letters';
} elseif ($statusFilter === 'Approved') {
	$fwViewData['title'] = 'Approved Letters to be Sent';
}

$sync = $fwRequest->getParam('sync', '');
if ($sync) {
	$pData = $fwDb->queryOne("SELECT pdtc_pdr_id, pdtc_days_delay, pdtc_sync FROM project_delay_timeline_center WHERE pdtc_id = " . (int)$sync);

	if (!empty($pData)) {
		$days = (int)$pData['pdtc_days_delay'];

		if ((int)$pData['pdtc_sync'] == 0) {
			$fwDb->queryOne("UPDATE project_delay_register SET pdr_time_delays_added = pdr_time_delays_added + " . $days . " WHERE pdr_id = " . (int)$pData['pdtc_pdr_id']);
			$fwDb->queryOne("UPDATE project_delay_timeline_center SET pdtc_sync = 1 WHERE pdtc_id = " . (int)$sync);
		} else {
			$fwDb->queryOne("UPDATE project_delay_register SET pdr_time_delays_added = pdr_time_delays_added - " . $days . " WHERE pdr_id = " . (int)$pData['pdtc_pdr_id']);
			$fwDb->queryOne("UPDATE project_delay_timeline_center SET pdtc_sync = 0 WHERE pdtc_id = " . (int)$sync);
		}
	}
}

$delId = (int)$fwRequest->getParam('delpdtc', 0);
if ($delId > 0) {
	$delRow = $fwDb->queryOne("SELECT pdtc_workflow_status FROM project_delay_timeline_center WHERE pdtc_id = " . $delId);
	$fwDb->queryOne("DELETE FROM project_delay_timeline_center WHERE pdtc_id = " . $delId);
	if (!empty($delRow) && $delRow['pdtc_workflow_status'] == 'Pending') {
		$fwDb->queryOne("UPDATE project_delay_register SET pdr_pending_confirmation = GREATEST(IFNULL(pdr_pending_confirmation,0) - 1, 0) WHERE pdr_id = " . $pdr_id);
	}
	if (!empty($delRow) && $delRow['pdtc_workflow_status'] == 'Approved') {
		$fwDb->queryOne("UPDATE project_delay_register SET pdr_approved_letters_to_be_sent = GREATEST(IFNULL(pdr_approved_letters_to_be_sent,0) - 1, 0) WHERE pdr_id = " . $pdr_id);

		// Recalculate Last Time Delay Letter Sent from remaining approved letters (blank if none).
		$lastSql = "SELECT pdtc_letter_email FROM project_delay_timeline_center
			WHERE pdtc_pdr_id = " . $pdr_id . "
			AND pdtc_workflow_status = 'Approved'
			AND pdtc_letter_email IS NOT NULL
			AND TRIM(pdtc_letter_email) <> ''
			ORDER BY STR_TO_DATE(pdtc_letter_email, '%d-%m-%Y') DESC, pdtc_id DESC
			LIMIT 1";
		$lastRow = $fwDb->queryOne($lastSql);
		$lastDate = !empty($lastRow['pdtc_letter_email']) ? $lastRow['pdtc_letter_email'] : '';
		$fwDb->queryOne("UPDATE project_delay_register SET pdr_last_delay_letter_sent_date = '" . addslashes($lastDate) . "' WHERE pdr_id = " . $pdr_id);
	}
}

// Approve pending letter from list.
$approveId = (int)$fwRequest->getParam('approvepdtc', 0);
if ($approveId > 0) {
	$saved = $fwDb->queryOne("SELECT * FROM project_delay_timeline_center WHERE pdtc_id = " . $approveId . " AND pdtc_pdr_id = " . $pdr_id);
	if (!empty($saved) && $saved['pdtc_workflow_status'] == 'Pending') {
		$fwDb->queryOne("UPDATE project_delay_timeline_center SET pdtc_workflow_status = 'Approved' WHERE pdtc_id = " . $approveId);
		$fwDb->queryOne("UPDATE project_delay_register SET pdr_approved_letters_to_be_sent = IFNULL(pdr_approved_letters_to_be_sent,0) + 1, pdr_pending_confirmation = GREATEST(IFNULL(pdr_pending_confirmation,0) - 1, 0) WHERE pdr_id = " . $pdr_id);

		$tcData = array(
			'tc_project' => $saved['pdtc_project'],
			'tc_who_req' => $saved['pdtc_who_req'],
			'tc_letter_code' => $saved['pdtc_letter_code'],
			'tc_days_delay' => $saved['pdtc_days_delay'],
			'tc_rev_comm_date' => $saved['pdtc_rev_comm_date'],
			'tc_rev_comp_date' => $saved['pdtc_rev_comp_date'],
			'tc_send_pathway' => $saved['pdtc_send_pathway'],
			'tc_letter_upload' => $saved['pdtc_letter_upload'],
			'tc_letter_email' => $saved['pdtc_letter_email'],
			'tc_email_user' => $saved['pdtc_email_user'],
			'tc_status' => $saved['pdtc_status'],
			'tc_auto_date' => $saved['pdtc_auto_date'],
			'tc_current_days' => (int)$saved['pdtc_current_days'],
			'tc_new_days' => (int)$saved['pdtc_new_days'],
			'tc_sync' => 0,
			'tc_notes' => $saved['pdtc_notes'],
			'tc_evidence' => $saved['pdtc_evidence']
		);
		$tcTable = new Fw_Db_Table('timeline_center');
		$tcId = (int)$saved['pdtc_tc_id'];
		if ($tcId > 0) {
			$tcTable->setWhere('tc_id = ' . $tcId);
			$tcTable->updateRow($tcData);
		} else {
			$tcTable->insertRow($tcData);
			$tcNew = $fwDb->queryOne("SELECT MAX(tc_id) AS mid FROM timeline_center WHERE tc_project = '" . addslashes($saved['pdtc_project']) . "'");
			$tcId = !empty($tcNew['mid']) ? (int)$tcNew['mid'] : 0;
			if ($tcId > 0) {
				$fwDb->queryOne("UPDATE project_delay_timeline_center SET pdtc_tc_id = " . $tcId . " WHERE pdtc_id = " . $approveId);
			}
		}

		$lastSql = "SELECT pdtc_letter_email FROM project_delay_timeline_center
			WHERE pdtc_pdr_id = " . $pdr_id . "
			AND pdtc_workflow_status = 'Approved'
			AND pdtc_letter_email IS NOT NULL
			AND TRIM(pdtc_letter_email) <> ''
			ORDER BY STR_TO_DATE(pdtc_letter_email, '%d-%m-%Y') DESC, pdtc_id DESC
			LIMIT 1";
		$lastRow = $fwDb->queryOne($lastSql);
		$lastDate = !empty($lastRow['pdtc_letter_email']) ? $lastRow['pdtc_letter_email'] : date('d-m-Y');
		$fwDb->queryOne("UPDATE project_delay_register SET pdr_last_delay_letter_sent_date = '" . addslashes($lastDate) . "' WHERE pdr_id = " . $pdr_id);
	}
}

$matsql = "SELECT * FROM project_delay_timeline_center WHERE pdtc_pdr_id = " . $pdr_id;
if ($statusFilter !== '') {
	$matsql .= " AND pdtc_workflow_status = '" . addslashes($statusFilter) . "'";
}
$matsql .= " ORDER BY pdtc_id DESC";
$userData = $fwDb->query($matsql);

if (!empty($userData)) {
	if (!isset($pagenum) || !$pagenum) {
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
	$sql2 = $matsql . ' ' . $max;
	$fwViewData['list'] = $fwDb->query($sql2);
}
