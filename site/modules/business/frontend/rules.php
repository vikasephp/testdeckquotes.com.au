<?php
$fwMainView = 'file:' . getcwd() . '/rules.tpl';
$tableRule = new Fw_Db_Table('project_planning_rule');
$tableRuleQA = new Fw_Db_Table('project_planning_rule_qa');



$ppc_id = $fwRequest->getParam('pc_doc_id', '');
$fwViewData['ppc_id'] = $ppc_id;
$sql = "select ppc_document,  	ppc_procedure from  planning_project_checklist_admin where ppc_id = ".$ppc_id;
$fwViewData['data'] = $fwDb->queryOne($sql);

	
$sql_2 = "Select * from project_planning_rule where ppr_ppc_id = ".$ppc_id;
$fwViewData['datarule'] = $fwDb->queryOne($sql_2);

$sql_3 = "Select * from project_planning_rule_qa where pqa_ppc_id = ".$ppc_id;

$fwViewData['dataqa'] = $fwDb->query($sql_3);

