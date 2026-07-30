<?php

$this_id = (int)$fwRequest->getparam('pqa_id', 0);
$ppc_id = (int)$fwRequest->getparam('ppc_id', 0);

if ($this_id > 0)
{

    $thisTable = new Fw_Db_Table('project_planning_rule_qa');
    $thisTable->setWhere("pqa_id = $this_id");
    $thisTable->deleteRow();

}

Location(BASE_URL . 'project_planning_checklistAdmin.add_rule/ppc_id/'.$ppc_id);