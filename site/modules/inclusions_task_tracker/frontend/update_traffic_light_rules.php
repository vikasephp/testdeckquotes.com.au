<?php
$fwMainView = 'file:' . getcwd() . '/update_traffic_light_rules.tpl';

$tableTask = new Fw_Db_Table('inclusions_task_tracker_traffic_light');

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
    $detail = $fwRequest->getParam('task', array());
    $this_id = (int)$detail['itttl_id'];
    unset($detail['itttl_id']);
    if ($this_id > 0) {
        $tableTask->setWhere("itttl_id = $this_id");
        $opr = $tableTask->updateRow($detail);
    } else {
        $opr = $tableTask->insertRow($detail);
    }
    $fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('itttl_id', 0);
if ($this_id > 0) {
    $tableTask = new Fw_Db_Table('inclusions_task_tracker_traffic_light');
    $tableTask->setWhere("itttl_id = $this_id");
    $detail = $tableTask->getRow();

    $fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
    $fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}
