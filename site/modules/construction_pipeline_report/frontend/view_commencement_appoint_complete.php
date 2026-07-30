<?php
$fwMainView = 'file:' . getcwd() . '/view_commencement_appoint_complete.tpl';

$sql_l = "SELECT YEAR(bt_completed_date) AS year, COUNT(*) AS total_records FROM business_tasks WHERE bt_task_id = 553 AND bt_complete = 1 AND bt_completed_date != '' GROUP BY YEAR(bt_completed_date) ORDER BY year DESC";

$fwViewData['count553record'] = $fwDb->query($sql_l);


$sql_2 = "SELECT YEAR(DATE_SUB(bt_completed_date, INTERVAL 6 MONTH)) AS fy_year, CONCAT( 'Jul 1, ', YEAR(DATE_SUB(bt_completed_date, INTERVAL 6 MONTH)), ' - Jun 30, ', YEAR(DATE_SUB(bt_completed_date, INTERVAL 6 MONTH)) + 1 ) AS financial_year, COUNT(*) AS total_records FROM business_tasks WHERE bt_task_id = 553 AND bt_complete = 1 AND bt_completed_date IS NOT NULL GROUP BY YEAR(DATE_SUB(bt_completed_date, INTERVAL 6 MONTH)) ORDER BY fy_year DESC";
$fwViewData['countfin553record'] = $fwDb->query($sql_2);