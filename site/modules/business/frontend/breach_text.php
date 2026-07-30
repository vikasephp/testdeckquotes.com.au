<?php
$fwMainView = 'file:' . getcwd() . '/breach_text.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$pc_doc_id = $fwRequest->getParam('pc_doc_id', '0');
$query = 'SELECT 2025_165_report.os2_doc_plan, 2025_165_report.os2_breach_test, planning_project_checklist_admin.ppc_document FROM `2025_165_report` LEFT JOIN planning_project_checklist_admin on 2025_165_report.os2_doc_plan = planning_project_checklist_admin.ppc_order where 2025_165_report.os2_doc_plan = '.$pc_doc_id.';';
$breach_text = $fwDb->query($query);
$fwViewData['breach_text'] = $breach_text;

//$query2 = 'select `ppc_document` from planning_project_checklist_admin where `ppc_order` = ' . $pc_doc_id . ';';
$query2 = 'select `ppc_document` from planning_project_checklist_admin where `ppc_id` = ' . $pc_doc_id . ';';
$doc_name = $fwDb->query($query2);
$fwViewData['doc_name'] = $doc_name;