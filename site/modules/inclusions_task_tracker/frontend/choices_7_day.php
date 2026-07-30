<?php
$fwMainView = 'file:' . getcwd() . '/choices_7_day.tpl';
$tablePages = new Fw_Db_Table('business');

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
// db($inclusions_task_tracker_choices_7_day);

// $calendar = IntlCalendar::createInstance();
// // Set Monday as the first day of the week
// $calendar->setFirstDayOfWeek(IntlCalendar::DOW_WEDNESDAY);
// db($calendar);

function getStartOfWeek($dateString) {
    $dateTime = new DateTime($dateString);
    $dayOfWeek = (int)$dateTime->format('N'); // 1 (for Monday) through 7 (for Sunday)

    if ($dayOfWeek == 3) { // If it's already Tuesday
        return $dateTime->format('Y-m-d');
    } elseif ($dayOfWeek < 3) { // If it's Monday or Sunday
        $dateTime->modify('last Wednesday');
    } else { // If it's Wednesday to Saturday
        $dateTime->modify('this Wednesday');
    }
    return $dateTime->format('Y-m-d 00:00:00');
}

$thisWeekStartDate = getStartOfWeek('now');
$thisWeekEndDate = date('Y-m-d 23:59:59', strtotime($thisWeekStartDate . ' +6 days'));
$lastWeekEndDate = date('Y-m-d H:i:s', strtotime($thisWeekStartDate . ' -1 second'));
$lastWeekStartDate = date('Y-m-d 00:00:00', strtotime($lastWeekEndDate . ' -6 days'));
// db($lastWeekStartDate);
// db($lastWeekEndDate);
// db($thisWeekStartDate);
// db($thisWeekEndDate);

// $lastWeekStartDate = date('Y-m-d 00:00:00', strtotime('last week wednesday'));
// $lastWeekEndDate = date('Y-m-d 23:59:59', strtotime('this week tuesday'));
// $thisWeekStartDate = date('Y-m-d 00:00:00', strtotime('this week wednesday'));
// $thisWeekEndDate = date('Y-m-d 23:59:59', strtotime('next week tuesday'));
// db($lastWeekStartDate);
// db($lastWeekEndDate);
// db($thisWeekStartDate);
// db($thisWeekEndDate);
// db(date('Y-m-d H:m:s'));
// $lastWeekStartDate = date('Y-m-d 00:00:00');
// $lastWeekEndDate = date('Y-m-d 22:55:00');
// $thisWeekStartDate = date('Y-m-d 22:55:01');
// $thisWeekEndDate = date('Y-m-d 23:59:59');
// $sql =
//     'SELECT
//         DISTINCT tccl_bsn_id,
//         (SELECT tccl_changed_per FROM tracker_choices_changed_log WHERE tccl_type = "inclusion_task" AND tccl_bsn_id = TCCL.tccl_bsn_id ORDER BY tccl_id DESC LIMIT 1) AS latest_per,
//         (SELECT tccl_changed_per FROM tracker_choices_changed_log WHERE tccl_type = "inclusion_task" AND tccl_bsn_id = TCCL.tccl_bsn_id AND tccl_id < (SELECT tccl_id FROM tracker_choices_changed_log WHERE tccl_type = "inclusion_task" AND tccl_bsn_id = TCCL.tccl_bsn_id ORDER BY tccl_id DESC LIMIT 1) ORDER BY tccl_id DESC LIMIT 1) AS last_per,
//         (SELECT tccl_changed_per FROM tracker_choices_changed_log WHERE tccl_type = "inclusion_task" AND tccl_bsn_id = TCCL.tccl_bsn_id AND tccl_changed_at BETWEEN "' . $lastWeekStartDate . '" AND "' . $lastWeekEndDate . '" ORDER BY tccl_id DESC LIMIT 1) AS last_week_per,
//         (SELECT tccl_changed_per FROM tracker_choices_changed_log WHERE tccl_type = "inclusion_task" AND tccl_bsn_id = TCCL.tccl_bsn_id AND tccl_changed_at BETWEEN "' . $thisWeekStartDate . '" AND "' . $thisWeekEndDate . '" ORDER BY tccl_id DESC LIMIT 1) AS this_week_per
//     FROM
//         tracker_choices_changed_log AS TCCL
//     WHERE
//         TCCL.tccl_type = "inclusion_task" AND
//         TCCL.tccl_bsn_id IN (' . implode(',', array_keys($projects)) . ')';
// $result = $fwDb->query($sql);
// $tracker_choices_changed_log = [];
// foreach ($result as $row) {
//     $difference_per = '';
//     $last_week_per = $row['last_week_per'];
//     $this_week_per = $row['this_week_per'];
//     if (!empty($row['last_per']) && !empty($this_week_per)) {
//         $last_week_per = $row['last_per'];
//     } elseif(empty($this_week_per)) {
//         $this_week_per = $row['latest_per'];
//     }

//     if (!empty($last_week_per) && !empty($this_week_per)) {
//         $difference_per = $this_week_per - $last_week_per;
//     }
//     $tracker_choices_changed_log[$row['tccl_bsn_id']] = [
//         'latest_per' => $row['latest_per'],
//         'last_per' => $row['last_per'],
//         'last_week_per' => $last_week_per,
//         'this_week_per' => $this_week_per,
//         'difference_per' => $difference_per,
//     ];
// }
// db($tracker_choices_changed_log);

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
