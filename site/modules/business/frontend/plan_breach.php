<?php
$fwMainView = 'file:' . getcwd() . '/plan_breach.tpl';

$bus_id = $fwRequest->getParam('bus_id', '0');
$doc_name = $fwRequest->getParam('doc_name', '');
$query = 'SELECT B.bsn_id, OS.os2_doc_plan, PPCA.ppc_id, PPCA.ppc_document, OS.os2_project, OS.os2_breach_test FROM `2025_165_report` OS INNER JOIN business B ON B.bsn_name = OS.os2_project INNER JOIN planning_project_checklist_admin AS PPCA ON PPCA.ppc_id = OS.os2_doc_plan WHERE B.bsn_id = ' . $bus_id . ';';
$data = $fwDb->query($query);
// foreach($data as $index => $item){
//     $data[$index]['ppc_document'] = trim($item['ppc_document']);
// }
$fwViewData['plan_breach'] = $data;
$query = 'SELECT B.bsn_id, OS.os2_doc_plan, OS.os2_project, OS.os2_breach_test FROM `2025_165_report` OS INNER JOIN business B ON B.bsn_name = OS.os2_project WHERE OS.os2_doc_plan = 0 AND B.bsn_id = ' . $bus_id . ';';
$data = $fwDb->query($query);
$fwViewData['please_select_plan_breach'] = $data;
$fwViewData['doc_name'] = $doc_name;