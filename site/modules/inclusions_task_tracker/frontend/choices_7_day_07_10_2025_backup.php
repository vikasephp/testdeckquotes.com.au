<?php
$fwMainView = 'file:' . getcwd() . '/choices_7_day.tpl';

$projects = [];
// $sql = 'SELECT bsn_id, bsn_name FROM business ORDER BY bsn_status_sys_date DESC';
$sql = 'SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_status LIKE "%|5|%" ORDER BY business.bsn_status_sys_date DESC';
$result = $fwDb->query($sql);
foreach($result as $row) {
    $projects[$row['bsn_id']] = $row['bsn_name'];
}

$originalDate = new DateTime('now');
$secondDate = $originalDate->format('Y-m-d 23:59:59');
$firstDate = $originalDate->modify('-2 weeks')->format('Y-m-d 00:00:00');

$sql = 'SELECT * FROM tracker_choices_changed_log WHERE tccl_bsn_id IN (' . implode(',', array_keys($projects)) . ') ORDER BY tccl_bsn_id ASC, tccl_id DESC';
$records = $fwDb->query($sql);
$tracker_choices_changed_log = [];
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
        'project' => $projects[$bsn_id],
        'last_week_per' => $last_week_per != '' ? ($last_week_per . '%') : '-',
        'this_week_per' => $this_week_per != '' ? ($this_week_per . '%') : '-',
        'difference_per' => $difference_per != '' ? ($difference_per . '%') : '-',
        'tccl_id' => $tccl_id,
    ];
}

$fwViewData['final_list'] = $final_list;
