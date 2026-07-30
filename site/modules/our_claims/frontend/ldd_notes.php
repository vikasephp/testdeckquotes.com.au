<?php
$fwMainView = 'file:' . getcwd() . '/ldd_notes.tpl';
$table = new Fw_Db_Table($TABLE);
$add_notes = $fwRequest->getParam('add_notes', '');
$dm_id = $fwRequest->getParam($ID, 0);
$fwViewData['dm_id'] = $dm_id;
if ($add_notes) {
    $dm_id = $fwRequest->getParam($ID, '');
    $ldd_note = $fwRequest->getParam('ldd_note', '');
    $table->setWhere($ID . ' = ' . $dm_id);
    if ($table->rowExists()) {
        $notes['ldd_note'] = $ldd_note;
        $detail = $table->updateRow($notes);
    }
    $fwViewData['opr'] = "Close";
}
$sqlnotes = "SELECT ldd_note FROM $TABLE where $ID = " . $dm_id;
$notesData = $fwDb->queryOne($sqlnotes);
$fwViewData['ldd_note'] = $notesData['ldd_note'];
