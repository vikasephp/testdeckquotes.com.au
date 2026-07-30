<?php
$fwMainView = 'file:' . getcwd() . '/update_escalation_action.tpl';
$table = new Fw_Db_Table('warranty_log');
$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id'] = $wa_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
    $detail = $fwRequest->getParam('notes', array());
    $this_id = (int)$detail['wa_id'];
    unset($detail['wa_id']);

    if ($wa_id > 0) {
        unset($detail['wa_id']);
        $table->setWhere("wa_id = $wa_id");
        $opr = $table->updateRow($detail);
    }

    $fwViewData['opr'] = $opr;
}

//$this_id = (int)$fwRequest->getParam('pa_id', 0);
if ($wa_id > 0) {
    $table = new Fw_Db_Table('warranty_log');
    $table->setWhere("wa_id = $wa_id");
    $detail = $table->getRow();

    $fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
    $fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}
