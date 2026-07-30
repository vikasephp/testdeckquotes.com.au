<?php
$fwMainView = 'file:' . getcwd() . '/view_projects_open_log.tpl';

$sql_l = "SELECT wa_project, COUNT(*) AS open_count, business.bsn_id, COALESCE(pp.total_hia,0) - COALESCE(pp.total_ppd,0) AS amnt_owed FROM warranty_log Left Join business on business.bsn_name = warranty_log.wa_project LEFT JOIN ( SELECT ppd_bsn_id, SUM( CASE WHEN TRIM(ppd_hia_value) <> '' THEN CAST(REPLACE(REPLACE(ppd_hia_value, '$', ''), ',', '') AS DECIMAL(10,2)) ELSE 0 END ) AS total_hia, SUM( CASE WHEN TRIM(ppd_value) <> '' THEN CAST(REPLACE(REPLACE(ppd_value, '$', ''), ',', '') AS DECIMAL(10,2)) ELSE 0 END ) AS total_ppd FROM progress_payment_detail GROUP BY ppd_bsn_id ) pp ON pp.ppd_bsn_id = business.bsn_id WHERE wa_status IN ('Open') GROUP BY wa_project";

$fwViewData['countopenrecord'] = $fwDb->query($sql_l);
