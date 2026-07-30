<?php
$fwMainView = 'file:' . getcwd() . '/choices_7_day.tpl';

$projects = [];
// $sql = 'SELECT bsn_id, bsn_name FROM business ORDER BY bsn_status_sys_date DESC';
$sql = 'SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_status LIKE "%|5|%" ORDER BY business.bsn_status_sys_date DESC';
$result = $fwDb->query($sql);
foreach($result as $row) {
    $projects[$row['bsn_id']] = $row['bsn_name'];
}

// db(array_keys($projects));

$originalDate = new DateTime('now');
$secondDate = $originalDate->format('Y-m-d 23:59:59');
$firstDate = $originalDate->modify('-2 weeks')->format('Y-m-d 00:00:00');

$sql = 'SELECT * FROM tracker_choices_changed_log WHERE tccl_changed_at BETWEEN "' . $firstDate . '" AND "' . $secondDate . '" AND tccl_bsn_id IN (' . implode(',', array_keys($projects)) . ') ORDER BY tccl_bsn_id ASC, tccl_id DESC';
$records = $fwDb->query($sql);

// $table = new Fw_Db_Table('tracker_choices_changed_log');
// $table->setOrderBy('tccl_bsn_id ASC, tccl_id DESC');
// $records = $table->getRows();

$totalRecords = count($records);

$index = 0;
$final_list = [];
while($totalRecords > $index) {
    $nextIndex = $index + 1;
    if($nextIndex >= $totalRecords) {
        break;
    }
    $bsn_id = $records[$index]['tccl_bsn_id'];
    // db($projects[$bsn_id]);

    if(!isset($final_list[$bsn_id])) {
        $tccl_id = $records[$index]['tccl_id'];
        $last_week_per = '';
        $this_week_per = $records[$index]['tccl_changed_per'];
        $difference_per = '';
        if($bsn_id == $records[$nextIndex]['tccl_bsn_id']) {
            $index = $nextIndex + 1;
            $last_week_per = $records[$nextIndex]['tccl_changed_per'];
            $difference_per = $this_week_per - $last_week_per;
        }
        else {
            $index = $nextIndex;
        }

        $final_list[$bsn_id] = [
            'project' => $projects[$bsn_id],
            'last_week_per' => $last_week_per != '' ? ($last_week_per . '%') : '-',
            'this_week_per' => $this_week_per . '%',
            'difference_per' => $difference_per != '' ? ($difference_per . '%') : '-',
            'tccl_id' => $tccl_id,
        ];
    }
    else {
        $index = $nextIndex;
    }
}

usort($final_list, function($a, $b) {
    return $b['tccl_id'] <=> $a['tccl_id']; // PHP 7+ spaceship operator for comparison
});

$fwViewData['final_list'] = $final_list;
