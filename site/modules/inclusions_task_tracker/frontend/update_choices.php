<?php
$fwMainView = 'file:' . getcwd() . '/update_choices.tpl';
$tablePages = new Fw_Db_Table('business');

$update = $fwRequest->getParam('update', '');
if(!empty($update)) {
    $query = 'UPDATE inclusions_task_tracker_choices_7_day SET last_week = this_week';
    $fwDb->queryOne($query);
}

// Percent Override Yes/No Slider
$percent_override = $fwRequest->getParam('percent_override', '');
if (!empty($percent_override)) {
    $dt = date('d-m-Y');
    $user = $_SESSION['user']['user_name'];
    $key = array_keys($percent_override);
    $ky = $key[0];

    $poDetail['bsn_percent_override'] = $percent_override[$ky];
    $poDetail['bsn_percent_override_username'] = $user;
    $poDetail['bsn_percent_override_date'] = $dt;

    $tablePages->setWhere('bsn_id = ' . $ky);
    $detail = $tablePages->updateRow($poDetail);
    $redirectUrl = $_SERVER['REQUEST_URI'];
    header("Location: $redirectUrl");
    exit;
}

$projects = [];
$sql = 'SELECT business.bsn_id, business.bsn_name, business.bsn_percent_override, business.bsn_percent_override_username, business.bsn_percent_override_date, business.bsn_percentage_notes, business.bsn_per_complete FROM business WHERE business.bsn_status LIKE "%|5|%" ORDER BY business.bsn_status_sys_date DESC';
$result = $fwDb->query($sql);
foreach ($result as $row) {
    $projects[$row['bsn_id']] = [
        'name' => $row['bsn_name'],
        'percent_override' => $row['bsn_percent_override'],
        'override_username' => $row['bsn_percent_override_username'],
        'override_date' => $row['bsn_percent_override_date'],
        'percentage_notes' => $row['bsn_percentage_notes'],
        'last_change_per' => $row['bsn_per_complete'],
    ];
}

$query = 'SELECT * FROM `inclusions_task_tracker_choices_7_day`';
$result = $fwDb->query($query);
$inclusions_task_tracker_choices_7_day = [];
foreach ($result as $row) {
    $inclusions_task_tracker_choices_7_day[$row['bsn_id']] = $row;
}

foreach ($projects as $bsn_id => $row) {
    if(isset($inclusions_task_tracker_choices_7_day[$bsn_id]) && !empty($inclusions_task_tracker_choices_7_day[$bsn_id]['this_week']) && $inclusions_task_tracker_choices_7_day[$bsn_id]['this_week'] != $row['last_change_per']) {
        $query = 'UPDATE inclusions_task_tracker_choices_7_day SET this_week = ' . $row['last_change_per'] . ' WHERE bsn_id = ' . $bsn_id . ';';
        $fwDb->queryOne($query);
    }
    else {
        $query = 'INSERT INTO inclusions_task_tracker_choices_7_day(bsn_id, this_week) VALUES(' . $bsn_id . ', ' . $row['last_change_per'] . ');';
        $fwDb->queryOne($query);
    }
}

// UPDATED THE RECORDS of $inclusions_task_tracker_choices_7_day
$query = 'SELECT * FROM `inclusions_task_tracker_choices_7_day`';
$result = $fwDb->query($query);
$inclusions_task_tracker_choices_7_day = [];
foreach ($result as $row) {
    $inclusions_task_tracker_choices_7_day[$row['bsn_id']] = $row;
}

$sql = 'SELECT TCCL.*, users.user_username FROM tracker_choices_changed_log AS TCCL LEFT JOIN users ON users.user_id = TCCL.tccl_changed_by WHERE TCCL.tccl_type = "inclusion_task" AND TCCL.tccl_bsn_id IN (' . implode(',', array_keys($projects)) . ') ORDER BY TCCL.tccl_bsn_id ASC, TCCL.tccl_id DESC';
$records = $fwDb->query($sql);
$changed_per_list = [];
foreach ($records as $row) {
    if (!isset($changed_per_list[$row['tccl_bsn_id']])) {
        $changed_per_list[$row['tccl_bsn_id']] = [
            'date' => $row['tccl_changed_at'],
            //'user' => $row['tccl_changed_by'],
            'user' => $row['user_username'],
            'per' => $row['tccl_changed_per'],
        ];
    }
}

$final_list = [];
foreach ($projects as $bsn_id => $project) {
    $record = $inclusions_task_tracker_choices_7_day[$bsn_id] ?? [];
    $last_week_per = $this_week_per = $difference_per = '';
    if (!empty($record['last_week'])) {
        $last_week_per = $record['last_week'];
    }
    if (!empty($record['this_week'])) {
        $this_week_per = $record['this_week'];
    }
    if (!empty($last_week_per) && !empty($this_week_per)) {
        $difference_per = $this_week_per - $last_week_per;
    }

    $final_list[$bsn_id] = [
        'project' => $project['name'],
        'bsn_id' => $bsn_id,
        'last_week_per' => $last_week_per !== '' ? $last_week_per . '%' : '-',
        'this_week_per' => $this_week_per !== '' ? $this_week_per . '%' : '-',
        'difference_per' => $difference_per !== '' ? $difference_per . '%' : '-',
        // 'tccl_id' => $tccl_id,
        'percent_override' => $project['percent_override'],
        'override_username' => $project['override_username'],
        'override_date' => $project['override_date'],
        'percentage_notes' => $project['percentage_notes'],
        'last_changed_per' => $changed_per_list[$bsn_id]['per'] ?? '0',
        'last_changed_user' => $changed_per_list[$bsn_id]['user'] ?? '',
        'last_changed_date' => strtotime($changed_per_list[$bsn_id]['date']) > 0 ? date('d-M-Y', strtotime($changed_per_list[$bsn_id]['date'])) : '',
    ];

    $ccm = $final_list[$bsn_id]['last_changed_per'] . '%';
    if ($final_list[$bsn_id]['last_changed_user'] != '') {
        $ccm .= ' - ' . $final_list[$bsn_id]['last_changed_user'];
    }
    if ($final_list[$bsn_id]['last_changed_date'] != '') {
        $ccm .= ' - ' . $final_list[$bsn_id]['last_changed_date'];
    }
    $final_list[$bsn_id]['ccm'] = $ccm != '' ? $ccm : '-';
}

$fwViewData['final_list'] = $final_list;
