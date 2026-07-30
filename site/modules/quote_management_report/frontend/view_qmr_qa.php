<?php
$fwMainView = 'file:' . getcwd() . '/view_qmr_qa.tpl';

$Table = new Fw_Db_Table("quote_management_report_qa");

$qm_id = $fwRequest->getParam('qm_id', '');
$fwViewData['qm_id'] = $qm_id;

$sql = "Select * from quote_management_report_qa where qm_id = ".$qm_id;
$result = $fwDb->query($sql);

$fwViewData['qmr_qa'] = $result;