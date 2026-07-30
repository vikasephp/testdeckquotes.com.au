<?php

$this_id = (int)$fwRequest->getparam('bsst_id', 0);
$bst_id = (int)$fwRequest->getparam('bst_id', 0);


if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('renovation_task_list_subtask');
    $thisTable->setWhere("bsst_id = ". $this_id);
    $thisTable->deleteRow();
	
	$thisTable2 = new Fw_Db_Table('renovation_tasks_sub');
	$thisTable2->setWhere("bts_bsst_id = ". $this_id);
    $thisTable2->deleteRows();

}

Location(BASE_URL . $XFA['detail'].'/bst_id/'. $bst_id);