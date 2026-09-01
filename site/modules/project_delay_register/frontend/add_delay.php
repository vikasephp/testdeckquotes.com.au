<?php
$fwMainView = 'file:' . getcwd() . '/add_delay.tpl';

$pdr_id = (int)$fwRequest->getParam($ID, 0);

$pdrTable = new Fw_Db_Table($TABLE);
$pdrTable->setWhere("$ID = $pdr_id");
$pdrRow = $pdrTable->getRow();

$fwViewData['pdr_id'] = $pdr_id;
$fwViewData['pdr_project_address'] = !empty($pdrRow['pdr_project_address']) ? $pdrRow['pdr_project_address'] : '';

$pending = $fwRequest->getParam('subPending', '');
$approve = $fwRequest->getParam('subApprove', '');
$saveOnly = $fwRequest->getParam('subAddDetail', '');

if (!empty($pending) || !empty($approve) || !empty($saveOnly)) {
	$post = $fwRequest->getParam('pdtc', array());
	$pdtc_id = (int)$post['pdtc_id'];
	unset($post['pdtc_id']);

	$oldStatus = '';
	$oldTcId = 0;
	if ($pdtc_id > 0) {
		$oldRow = $fwDb->queryOne("SELECT pdtc_workflow_status, pdtc_tc_id, pdtc_letter_upload, pdtc_evidence, pdtc_rev_comp_date FROM project_delay_timeline_center WHERE pdtc_id = " . $pdtc_id);
		if (!empty($oldRow)) {
			$oldStatus = $oldRow['pdtc_workflow_status'];
			$oldTcId = (int)$oldRow['pdtc_tc_id'];
			if (empty($post['pdtc_letter_upload']) && !empty($oldRow['pdtc_letter_upload'])) {
				$post['pdtc_letter_upload'] = $oldRow['pdtc_letter_upload'];
			}
			if (empty($post['pdtc_evidence']) && !empty($oldRow['pdtc_evidence'])) {
				$post['pdtc_evidence'] = $oldRow['pdtc_evidence'];
			}
		}
	}

	// Approved edit: Save only — keep Approved, no Pending/Approve buttons.
	if (!empty($saveOnly)) {
		$newStatus = ($oldStatus === 'Approved') ? 'Approved' : $oldStatus;
		if ($newStatus === '') {
			$newStatus = 'Pending';
		}
	} else {
		$newStatus = !empty($approve) ? 'Approved' : 'Pending';
	}

	// Same as timeline_report: revised completion = current completion + days to be added.
	// Skip day-add recalculation on Save of already-Approved record (avoid double-adding days).
	$days = isset($post['pdtc_days_delay']) ? (int)$post['pdtc_days_delay'] : 0;
	if (empty($saveOnly) && !empty($post['pdtc_rev_comp_date']) && $days > 0) {
		$post['pdtc_rev_comp_date'] = date('d-m-Y', strtotime($post['pdtc_rev_comp_date'] . ' + ' . $days . ' days'));
	}

	if (!empty($_FILES['letter']['name'])) {
		$letterFile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['letter']['name']);
		upload($letterFile, $_FILES['letter']['tmp_name']);
		$post['pdtc_letter_upload'] = $letterFile;
	}
	if (!empty($_FILES['evidence']['name'])) {
		$evidenceFile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['evidence']['name']);
		upload($evidenceFile, $_FILES['evidence']['tmp_name']);
		$post['pdtc_evidence'] = $evidenceFile;
	}

	$post['pdtc_pdr_id'] = $pdr_id;
	$post['pdtc_project'] = $fwViewData['pdr_project_address'];
	$post['pdtc_workflow_status'] = $newStatus;
	if (empty($post['pdtc_status'])) {
		$post['pdtc_status'] = 'Open';
	}
	if (!isset($post['pdtc_current_days']) || $post['pdtc_current_days'] === '') {
		$post['pdtc_current_days'] = 0;
	}
	if (!isset($post['pdtc_new_days']) || $post['pdtc_new_days'] === '') {
		$post['pdtc_new_days'] = 0;
	}
	if (!isset($post['pdtc_sync']) || $post['pdtc_sync'] === '') {
		$post['pdtc_sync'] = 0;
	}
	// Fill NOT NULL blanks
	foreach (array('pdtc_who_req','pdtc_letter_code','pdtc_days_delay','pdtc_rev_comm_date','pdtc_rev_comp_date','pdtc_send_pathway','pdtc_letter_upload','pdtc_letter_email','pdtc_email_user','pdtc_auto_date','pdtc_notes','pdtc_evidence') as $blankField) {
		if (!isset($post[$blankField]) || $post[$blankField] === null) {
			$post[$blankField] = '';
		}
	}

	$pdtcTable = new Fw_Db_Table('project_delay_timeline_center');
	if ($pdtc_id > 0) {
		$pdtcTable->setWhere('pdtc_id = ' . $pdtc_id);
		$pdtcTable->updateRow($post);
	} else {
		$post['pdtc_created_by'] = !empty($_SESSION['user']['user_name']) ? $_SESSION['user']['user_name'] : '';
		$post['pdtc_created_at'] = date('Y-m-d H:i:s');
		$pdtcTable->insertRow($post);
		$newIdRow = $fwDb->queryOne("SELECT MAX(pdtc_id) AS mid FROM project_delay_timeline_center WHERE pdtc_pdr_id = " . $pdr_id);
		$pdtc_id = !empty($newIdRow['mid']) ? (int)$newIdRow['mid'] : 0;
	}

	// Adjust PDR counters when status changes (or new insert).
	if ($newStatus !== $oldStatus) {
		if ($newStatus === 'Pending') {
			$fwDb->queryOne("UPDATE project_delay_register SET pdr_pending_confirmation = IFNULL(pdr_pending_confirmation,0) + 1 WHERE pdr_id = " . $pdr_id);
			if ($oldStatus === 'Approved') {
				$fwDb->queryOne("UPDATE project_delay_register SET pdr_approved_letters_to_be_sent = GREATEST(IFNULL(pdr_approved_letters_to_be_sent,0) - 1, 0) WHERE pdr_id = " . $pdr_id);
			}
		}
		if ($newStatus === 'Approved') {
			$fwDb->queryOne("UPDATE project_delay_register SET pdr_approved_letters_to_be_sent = IFNULL(pdr_approved_letters_to_be_sent,0) + 1 WHERE pdr_id = " . $pdr_id);
			if ($oldStatus === 'Pending') {
				$fwDb->queryOne("UPDATE project_delay_register SET pdr_pending_confirmation = GREATEST(IFNULL(pdr_pending_confirmation,0) - 1, 0) WHERE pdr_id = " . $pdr_id);
			}
		}
	}

	// Approve: create/update matching timeline_center row + last letter date.
	if ($newStatus === 'Approved' && $pdtc_id > 0) {
		$saved = $fwDb->queryOne("SELECT * FROM project_delay_timeline_center WHERE pdtc_id = " . $pdtc_id);
		if (!empty($saved)) {
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
			$tcId = !empty($saved['pdtc_tc_id']) ? (int)$saved['pdtc_tc_id'] : $oldTcId;
			if ($tcId > 0) {
				$tcTable->setWhere('tc_id = ' . $tcId);
				$tcTable->updateRow($tcData);
			} else {
				$tcTable->insertRow($tcData);
				$tcNew = $fwDb->queryOne("SELECT MAX(tc_id) AS mid FROM timeline_center WHERE tc_project = '" . addslashes($saved['pdtc_project']) . "'");
				$tcId = !empty($tcNew['mid']) ? (int)$tcNew['mid'] : 0;
				if ($tcId > 0) {
					$fwDb->queryOne("UPDATE project_delay_timeline_center SET pdtc_tc_id = " . $tcId . " WHERE pdtc_id = " . $pdtc_id);
				}
			}
		}
	}

	// Refresh last approved letter date on PDR (Approve or moving away from Approved).
	if ($newStatus === 'Approved' || $oldStatus === 'Approved') {
		$lastSql = "SELECT pdtc_letter_email FROM project_delay_timeline_center
			WHERE pdtc_pdr_id = " . $pdr_id . "
			AND pdtc_workflow_status = 'Approved'
			AND pdtc_letter_email IS NOT NULL
			AND TRIM(pdtc_letter_email) <> ''
			ORDER BY STR_TO_DATE(pdtc_letter_email, '%d-%m-%Y') DESC, pdtc_id DESC
			LIMIT 1";
		$lastRow = $fwDb->queryOne($lastSql);
		$lastDate = !empty($lastRow['pdtc_letter_email']) ? $lastRow['pdtc_letter_email'] : '';
		if ($lastDate === '' && $newStatus === 'Approved') {
			$lastDate = date('d-m-Y');
		}
		$fwDb->queryOne("UPDATE project_delay_register SET pdr_last_delay_letter_sent_date = '" . addslashes($lastDate) . "' WHERE pdr_id = " . $pdr_id);
	}

	$fwViewData['opr'] = true;
} else {
	$pdtc_id = (int)$fwRequest->getParam('pdtc_id', 0);
}

$detail = array();
if ($pdtc_id > 0) {
	$detail = $fwDb->queryOne("SELECT * FROM project_delay_timeline_center WHERE pdtc_id = " . $pdtc_id);
	$fwViewData['title'] = 'Edit Delay';
} else {
	$fwViewData['title'] = 'Add Delay';
	$detail['pdtc_project'] = $fwViewData['pdr_project_address'];
	$currentDays = isset($pdrRow['pdr_time_delays_added']) ? (int)$pdrRow['pdr_time_delays_added'] : 0;
	$detail['pdtc_current_days'] = $currentDays > 0 ? $currentDays : '';

	$lastCompSql = "SELECT pdtc_rev_comp_date FROM project_delay_timeline_center
		WHERE pdtc_pdr_id = " . $pdr_id . "
		AND pdtc_rev_comp_date IS NOT NULL
		AND TRIM(pdtc_rev_comp_date) <> ''
		ORDER BY pdtc_id DESC
		LIMIT 1";
	$lastComp = $fwDb->queryOne($lastCompSql);
	$detail['pdtc_rev_comp_date'] = !empty($lastComp['pdtc_rev_comp_date']) ? $lastComp['pdtc_rev_comp_date'] : '';
}
$fwViewData['detail'] = $detail;
$fwViewData['pdtc_id'] = $pdtc_id;

$tablecode = new Fw_Db_Table('letter_code');
$fwViewData['codedata'] = $tablecode->getRows();

$sql = "SELECT user_name FROM users ORDER BY user_name ASC";
$fwViewData['userdetail'] = $fwDb->query($sql);
