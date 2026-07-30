<?php
$fwMainView = 'file:' . getcwd() . '/plan_breach.tpl';

$sql = "SELECT PPCA.ppc_document, REP.os2_doc_plan, COUNT(*) AS total FROM `2025_165_report` AS REP INNER JOIN planning_project_checklist_admin AS PPCA ON PPCA.ppc_id = REP.os2_doc_plan GROUP BY PPCA.ppc_document, REP.os2_doc_plan;";
$fwViewData['docplan'] = $fwDb->query($sql);