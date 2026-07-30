<?php
$fwMainView = 'file:' . getcwd() . '/view_cac_projectlist.tpl';

$year = $fwRequest->getParam('year', '');
$financial_year = (int)$fwRequest->getParam('financial_year', '');

if ($year != '' ){
$sql_l = "SELECT business.bsn_address, business.bsn_id, business_tasks.bt_bsn_id, business_tasks.bt_completed_date, business_tasks.bt_meeting_date FROM business_tasks left join business on business.bsn_id = business_tasks.bt_bsn_id WHERE bt_task_id = 553 AND bt_complete = 1 AND bt_completed_date != '' and YEAR(bt_completed_date) = ".$year." ORDER BY bt_completed_date DESC";

$fwViewData['cacrecordlist'] = $fwDb->query($sql_l);
$fwViewData['year'] = "Year ".$year;
}

if ($financial_year != ''){

$start = $financial_year . '-07-01';
$end   = ($financial_year + 1) . '-06-30';

$sql_2 = "SELECT business.bsn_address, business.bsn_id, business_tasks.bt_bsn_id, business_tasks.bt_completed_date, business_tasks.bt_meeting_date FROM business_tasks LEFT JOIN business ON business.bsn_id = business_tasks.bt_bsn_id WHERE bt_task_id = 553 AND bt_complete = 1 AND bt_completed_date IS NOT NULL AND bt_completed_date >= '$start' AND bt_completed_date < '$end' ORDER BY bt_completed_date DESC";

$fwViewData['cacrecordlist'] = $fwDb->query($sql_2);
$fwViewData['year'] = date('F j, Y', strtotime($start)) . ' - ' . date('F j, Y', strtotime($end));
}