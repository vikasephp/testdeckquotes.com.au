<?php
$fwMainView = 'file:' . getcwd() . '/who_is_managing.tpl';
$table = new Fw_Db_Table($TABLE);
$add_notes = $fwRequest->getParam('add_notes', '');
$dm_id = $fwRequest->getParam($ID, 0);
$fwViewData['dm_id'] = $dm_id;
if ($add_notes) {
    $dm_id = $fwRequest->getParam($ID, '');
    $ldd_who_is_managing = $fwRequest->getParam('ldd_who_is_managing', '');
    $table->setWhere($ID . ' = ' . $dm_id);
    if ($table->rowExists()) {
        $notes['ldd_who_is_managing'] = $ldd_who_is_managing;
        $detail = $table->updateRow($notes);
    }
    $fwViewData['opr'] = "Close";
}
$sqlnotes = "SELECT ldd_who_is_managing FROM $TABLE where $ID = " . $dm_id;
$notesData = $fwDb->queryOne($sqlnotes);
$fwViewData['ldd_who_is_managing'] = $notesData['ldd_who_is_managing'];
