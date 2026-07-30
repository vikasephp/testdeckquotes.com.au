<?php
$fwMainView = 'file:' . getcwd() . '/uid.tpl';

$sql = 'SELECT bst_id, bst_task_id, bst_task_name FROM busness_status_task WHERE bst_business_status_id = 5 ORDER BY bst_order ASC';
$result = $fwDb->query($sql);

$final_list = [];
foreach($result as $row) {
    $final_list[] = [
        'task_id' => $row['bst_task_id'],
        'task_name' => $row['bst_task_name'],
    ];
}

$fwViewData['final_list'] = $final_list;

