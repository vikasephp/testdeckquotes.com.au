<?php
$fwMainView = 'file:' . getcwd() . '/view_qa.tpl';
$bus_id = $fwRequest->getparam('bus_id', 0);
$tid = $fwRequest->getParam('tid', 0);

$fwViewData['tid'] = $tid;
$fwViewData['bus_id'] = $bus_id;

$sql = "SELECT * FROM ps_que_ans WHERE ps_task_id = " . $tid;
$fwViewData['psqadata'] = $fwDb->query($sql);


$psqaTable = new Fw_Db_Table('ps_que_ans');
$submit = $fwRequest->getParam('st_save', '');

if (!empty($submit)) {
    $detail = $fwRequest->getParam('ps_qa', array());
    $psqaTable->insertRow($detail);

    header('Location: ' . $_SERVER['REQUEST_URI']);
}
