<?php
$fwMainView = 'file:' . getcwd() . '/edit_notes.tpl';
$table = new Fw_Db_Table('business');

$submit = $fwRequest->getParam('subAddDetail', '');

if (!empty($submit)) {
    $detail = $fwRequest->getParam('doc', array());
    // db($_FILES); die();
    $this_id = (int)$detail['bsn_id'];
    unset($detail['bsn_id']);
    
    $table->setWhere("bsn_id = $this_id");
    $opr = $table->updateRow($detail);
    $fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('bsn_id', 0);
if ($this_id > 0) {
    $table = new Fw_Db_Table('business');
    $table->setWhere("bsn_id = $this_id");
    $record = $table->getRow();
    $fwViewData['record'] = $record;
}

