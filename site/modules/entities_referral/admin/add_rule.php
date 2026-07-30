<?php
$fwMainView = 'file:' . getcwd() . '/add_rule.tpl';
$tableRule = new Fw_Db_Table('project_planning_rule');
$tableRuleQA = new Fw_Db_Table('project_planning_rule_qa');

$ppc_id = $fwRequest->getParam('ppc_id', '');
$fwViewData['ppc_id'] = $ppc_id;
$sql = "select * from  planning_project_checklist_admin where ppc_id = ".$ppc_id;
$fwViewData['data'] = $fwDb->queryOne($sql);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('rule', array());
	$detail['ppr_ppc_id'] = $detail['ppc_id']; 
		
	$this_id = (int)$detail['ppr_id'];
	
    if($this_id > 0)
    	{
       		 unset($detail['ppr_id']);
       		 $tableRule->setWhere("ppr_id = $this_id");
	     	 $opr = $tableRule->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableRule->insertRow($detail); 
	}    	
	     $fwViewData['opr'] = "Rule has been saved....";
			
}

$queansDetail = $fwRequest->getParam('queansDetail', '');
if(!empty($queansDetail))
{
  $detail_qa = $fwRequest->getParam('rule_qa', array());
  $opr = $tableRuleQA->insertRow($detail_qa); 
}

$this_id = (int)$fwRequest->getParam('ppc_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('project_planning_rule');
	$tableTask->setWhere("ppr_ppc_id = $this_id");
	$detail = $tableTask->getRow();
   
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	


$sql = "Select * from project_planning_rule_qa where pqa_ppc_id = ".$ppc_id;

$fwViewData['dataqa'] = $fwDb->query($sql);

