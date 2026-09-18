<?php
$fwMainView = 'file:' . getcwd() . '/where_we_are_at.tpl';
$table = new Fw_Db_Table('pbnsr_where_we_are_at');
$pbnsr_bsn_id = $fwRequest->getParam('bsn_id', 0);
$pbnsr_checklist = $fwRequest->getParam('checklist', 0);

$records = [];
if($pbnsr_bsn_id && $pbnsr_checklist) {
    $table->setWhere('pbnsr_bsn_id = ' . $pbnsr_bsn_id . ' AND pbnsr_checklist = ' . $pbnsr_checklist);
    $table->setOrderBy('pbnsr_changed_date DESC');
    $records = $table->getAllRows(); 
}

$query = 'SELECT user_id, user_username FROM users';
$result = $fwDb->query($query);
$userData = [];
foreach($result as $row) {
    $userData[$row['user_id']] = $row['user_username'];
}

foreach($records as $index => $record) {
    $records[$index]['user'] = $userData[$record['pbnsr_changed_user_id']];
    $records[$index]['date'] = date('d-M-Y h:i:s A', strtotime($record['pbnsr_changed_date'])) ;
}


$fwViewData['records'] = $records;