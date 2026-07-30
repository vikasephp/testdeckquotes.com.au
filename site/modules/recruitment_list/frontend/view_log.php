<?php
$fwMainView = 'file:' . getcwd() . '/view_log.tpl';
$thisTable = new Fw_Db_Table('recruitment_list_log');
$thisID = $fwRequest->getParam($ID, '');
$records = [];
if ($thisID) {
    $thisTable->setWhere("rel_re_id = " . $thisID);
    $thisTable->setOrderBy('rel_created_at DESC');
    $records = $thisTable->getAllRows();
    foreach($records as $index => $record) {
        $records[$index]['rel_created_at'] = date('d-M-Y h:i:s A', strtotime($record['rel_created_at']));
    }
}
$fwViewData['records'] = $records;
