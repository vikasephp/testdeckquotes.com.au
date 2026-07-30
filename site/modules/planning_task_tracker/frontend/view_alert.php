<?php
$fwMainView = 'file:' . getcwd() . '/view_alert.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['alertdata'] = [];
if($bsn_id){
    $sql_l = "SELECT * FROM planning_client_alerts WHERE pca_bsn_id = " . $bsn_id . " AND pca_status = 'Open';";
    $fwViewData['alertdata'] = $fwDb->query($sql_l);
}


