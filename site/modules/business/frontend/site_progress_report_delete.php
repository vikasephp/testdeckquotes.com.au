<?php

$sp_id = (int)$fwRequest->getparam('sp_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);

if ($sp_id > 0 && $bsn_id > 0) {
    $table_site_progress_report = new Fw_Db_Table('site_progress_report');
    $table_site_progress_report->setWhere("sp_id = $sp_id");
    $table_site_progress_report->deleteRow();
}

Location(BASE_URL . 'business.site_progress_report_home/bsn_id/'.$bsn_id);