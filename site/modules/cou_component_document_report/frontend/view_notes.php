<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';

$bsn_id = $fwRequest->getparam('bsn_id', 0);

$records = [];
if($bsn_id > 0) {
    $cou_component_document_report_notes_table = new Fw_Db_Table("cou_component_document_report_notes");
    $cou_component_document_report_notes_table->setWhere('ccdrn_bsn_id = ' . $bsn_id);
    $cou_component_document_report_notes_table->setOrderBy('ccdrn_id DESC');
    $records = $cou_component_document_report_notes_table->getAllRows();
    foreach($records as $index => $row) {
        $records[$index]['user'] = $users_array[$row['ccdrn_created_by']];
        $records[$index]['date'] = date('d-M-Y', strtotime($row['ccdrn_created_at']));
    }
}
// db($users_array);
$fwViewData['records'] = $records;
$fwViewData['bsn_id'] = $bsn_id;

