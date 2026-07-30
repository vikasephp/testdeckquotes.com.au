<?php
$fwMainView = 'file:' . getcwd() . '/site_progress_report_home.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', 0);

$site_progress_report_data = [];
if($bsn_id > 0) {
    $table_site_progress_report = new Fw_Db_Table('site_progress_report');
    $table_site_progress_report->setWhere('sp_bsn_id = ' . $bsn_id);
    $table_site_progress_report->setOrderBy("IF(sp_date='' OR sp_date IS NULL, 1, 0), STR_TO_DATE(sp_date, '%d-%m-%Y') DESC");
    $site_progress_report_data = $table_site_progress_report->getAllRows();
}

$fwViewData['site_progress_report_data'] = $site_progress_report_data;

$sqlpr = "Select * from site_progress_report_task";
$fwViewData['cdetail'] = $fwDb->query($sqlpr);
