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
//End Percent Override Yes/No Slider


$projects = [];
// $sql = 'SELECT bsn_id, bsn_name FROM business ORDER BY bsn_status_sys_date DESC';
$sql = 'SELECT business.bsn_id, business.bsn_name, business.bsn_percent_override, business.bsn_percent_override_username, business.bsn_percent_override_date, business.bsn_percentage_notes FROM business WHERE business.bsn_status LIKE "%|5|%" ORDER BY business.bsn_status_sys_date DESC';
$result = $fwDb->query($sql);
foreach($result as $row) {
    //$projects[$row['bsn_id']] = $row['bsn_name'];
	$projects[$row['bsn_id']] = [
        'name' => $row['bsn_name'],
        'percent_override' => $row['bsn_percent_override'],
        'override_username' => $row['bsn_percent_override_username'],
        'override_date' => $row['bsn_percent_override_date'],
        'percentage_notes' => $row['bsn_percentage_notes'],
    ];
}

$originalDate = new DateTime('now');
$secondDate = $originalDate->format('Y-m-d 23:59:59');
$firstDate = $originalDate->modify('-2 weeks')->format('Y-m-d 00:00:00');

//$sql = 'SELECT * FROM tracker_choices_changed_log WHERE tccl_bsn_id IN (' . implode(',', array_keys($projects)) . ') ORDER BY tccl_bsn_id ASC, tccl_id DESC';
$sql = 'SELECT tracker_choices_changed_log.*, users.user_username FROM tracker_choices_changed_log LEFT JOIN users ON users.user_id = tracker_choices_changed_log.tccl_changed_by WHERE tracker_choices_changed_log.tccl_bsn_id IN (' . implode(',', array_keys($projects)) . ') ORDER BY tracker_choices_changed_log.tccl_bsn_id ASC, tracker_choices_changed_log.tccl_id DESC';

$records = $fwDb->query($sql);
/* $tracker_choices_changed_log = [];
foreach($records as $row) {
    if(isset($tracker_choices_changed_log[$row['tccl_bsn_id']]) && isset($tracker_choices_changed_log[$row['tccl_bsn_id']][1])) {
        continue;
    }
    if(!isset($tracker_choices_changed_log[$row['tccl_bsn_id']])) {
        $tracker_choices_changed_log[$row['tccl_bsn_id']] = [];
    }
    $tracker_choices_changed_log[$row['tccl_bsn_id']][] = $row;
}

$final_list = [];
foreach($projects as $bsn_id => $bsn_name) {
    $records = $tracker_choices_changed_log[$bsn_id];
    $last_week_per = $this_week_per = $difference_per = '';
    $tccl_id = 0;
    if (!empty($records)) {
        $tccl_id = $records[0]['tccl_id'];
        // $result['last_updated_date'] = date('d-M-Y', strtotime($records[0]['tccl_changed_at']));
        $this_week_per = $records[0]['tccl_changed_per'];
        if(isset($records[1])) {
            $last_week_per = $records[1]['tccl_changed_per'];
            $difference_per = $this_week_per - $last_week_per;
            $tccl_id = $records[1]['tccl_id'];
        }
    }

    $final_list[$bsn_id] = [
        //'project' => $projects[$bsn_id],
		'project' => $projects[$bsn_id]['name'],
		'bsn_id' => $bsn_id,
        'last_week_per' => $last_week_per != '' ? ($last_week_per . '%') : '-',
        'this_week_per' => $this_week_per != '' ? ($this_week_per . '%') : '-',
        'difference_per' => $difference_per != '' ? ($difference_per . '%') : '-',
        'tccl_id' => $tccl_id,
		
		'percent_override' => $projects[$bsn_id]['percent_override'],
		'override_username' => $projects[$bsn_id]['override_username'],
		'override_date' => $projects[$bsn_id]['override_date'],
		'percentage_notes' => $projects[$bsn_id]['percentage_notes'],
    ];
} */

$changed_per_list = [];
foreach($records as $row) {
    if (!isset($tracker_choices_changed_log[$row['tccl_bsn_id']])) {
        $tracker_choices_changed_log[$row['tccl_bsn_id']] = [];
    }
    if (count($tracker_choices_changed_log[$row['tccl_bsn_id']]) < 2) {
        $tracker_choices_changed_log[$row['tccl_bsn_id']][] = $row;
    }
	
    if (!isset($changed_per_list[$row['tccl_bsn_id']])) {
        $changed_per_list[$row['tccl_bsn_id']] = [
            'date' => $row['tccl_changed_at'],
            //'user' => $row['tccl_changed_by'],
			'user' => $row['user_username'],
        ];
    }
}

$final_list = [];
foreach ($projects as $bsn_id => $project) {
    $records = $tracker_choices_changed_log[$bsn_id] ?? [];

    $last_week_per = $this_week_per = $difference_per = '';
    $tccl_id = 0;
    if (!empty($records)) {
        $tccl_id = $records[0]['tccl_id'];
        $this_week_per = $records[0]['tccl_changed_per'];
        if (isset($records[1])) {
            $last_week_per = $records[1]['tccl_changed_per'];
            $difference_per = $this_week_per - $last_week_per;
            $tccl_id = $records[1]['tccl_id'];
        }
    }

    $final_list[$bsn_id] = [
        'project' => $project['name'],
        'bsn_id' => $bsn_id,
        'last_week_per' => $last_week_per !== '' ? $last_week_per . '%' : '-',
        'this_week_per' => $this_week_per !== '' ? $this_week_per . '%' : '-',
        'difference_per' => $difference_per !== '' ? $difference_per . '%' : '-',
        'tccl_id' => $tccl_id,
        'percent_override' => $project['percent_override'],
        'override_username' => $project['override_username'],
        'override_date' => $project['override_date'],
        'percentage_notes' => $project['percentage_notes'],
        'last_changed_user' => $changed_per_list[$bsn_id]['user'] ?? '',
        'last_changed_date' => $changed_per_list[$bsn_id]['date'] ?? '',
    ];
}

//echo "<pre>"; print_r($final_list); exit();
$fwViewData['final_list'] = $final_list;
