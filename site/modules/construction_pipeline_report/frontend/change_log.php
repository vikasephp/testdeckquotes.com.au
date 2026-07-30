<?php
$fwMainView = 'file:' . getcwd() . '/change_log.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', 0);
$bs_original_starting_date = $fwRequest->getParam('bs_original_starting_date', '');
$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['title'] = 'Change Log';
$fwViewData['bs_original_starting_date'] = $bs_original_starting_date;
$fwViewData['change_log'] = [];
$fwViewData['total_change_log'] = 0;
if ($bsn_id > 0) {
    $qry = 'SELECT * FROM construction_pipeline_report_onsite_log WHERE cprol_bsn_id = ' . $bsn_id . ';';
    $res = $fwDb->query($qry);
    // db($res);
    $fwViewData['change_log'] = $res;
    $fwViewData['total_change_log'] = count($res);
}
