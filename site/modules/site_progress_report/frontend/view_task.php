<?php
$fwMainView = 'file:' . getcwd() . '/view_task.tpl';

$thisTable = new Fw_Db_Table("site_progress_report_task");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

$sql_companies = "SELECT DISTINCT co_categry, co_id FROM companies where co_categry is not null and co_categry != '' ";
$fwViewData['data_companies'] = $data_companies = $fwDb->query($sql_companies);

//$sql_con_positions = "Select distinct cs_position, cs_id from contacts where cs_position IS NOT NULL AND cs_position != '' ";
//$fwViewData['data_con_positions'] = $data_con_positions = $fwDb->query($sql_con_positions);

$sql_contacts_position = "SELECT * FROM contacts_position";
$fwViewData['data_con_positions'] = $fwDb->query($sql_contacts_position);