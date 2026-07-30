<?php
$fwMainView = 'file:' . getcwd() . '/attachments-and-comments.tpl';

$users = [];
$query = 'SELECT user_id, user_name FROM users;';
$result = $fwDb->query($query);
foreach($result as $row) {
    $users[$row['user_id']] = $row['user_name'];
}
$contacts = [];
$query = 'SELECT cs_id, cs_first_name, cs_surname FROM contacts;';
$result = $fwDb->query($query);
foreach($result as $row) {
    $contacts[$row['cs_id']] = $row['cs_first_name'] . ' ' . $row['cs_surname'];
}

$bsnID = $_GET['bsn_id'] ?? 0;
$taskID = $_GET['task_id'] ?? 0;
$sql = "SELECT * FROM $TABLE WHERE sp_bsn_id = $bsnID AND sp_task_name = $taskID ORDER BY sp_id DESC";
$list = $fwDb->query($sql);
$spIDs = [];
foreach($list as $row) {
    $spIDs[] = $row['sp_id'];
}

$site_progress_report_attachments = [];
$query = 'SELECT * FROM site_progress_report_attachments WHERE spra_sp_id IN (' . implode(',', $spIDs) . ')';
$result = $fwDb->query($query);
foreach($result as $row) {
    if(!isset($site_progress_report_attachments[$row['spra_sp_id']])) {
        $site_progress_report_attachments[$row['spra_sp_id']] = [];
    }
    $site_progress_report_attachments[$row['spra_sp_id']][] = $row;
}

$records = [];
foreach($list as $row) {
    if($row['sp_created_table'] == 'users') {
        $row['sp_created_by'] = $users[$row['sp_created_by']] ?? '';
    }
    elseif($row['sp_created_table'] == 'contacts') {
        $row['sp_created_by'] = $contacts[$row['sp_created_by']] ?? '';
    }
    else {
        $row['sp_created_by'] = '';
    }
    $row['site_progress_report_attachments'] = $site_progress_report_attachments[$row['sp_id']];
    $row['sp_created_at'] = date('d-M-Y', strtotime($row['sp_created_at']));
    $records[] = $row;
}

$fwViewData['records'] = $records;
$fwViewData['title'] = 'Attachments And Comments';