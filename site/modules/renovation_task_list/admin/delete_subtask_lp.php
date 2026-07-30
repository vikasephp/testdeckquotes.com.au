<?php

$this_id = (int)$fwRequest->getparam('bstlp_id', 0);
$bst_id = (int)$fwRequest->getparam('bst_id', 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('renovation_task_list_subtask_lp');
    $thisTable->setWhere("bstlp_id = ". $this_id);
    $thisTable->deleteRow();

}
exit;

//Location(BASE_URL . $XFA['detail'].'/bst_id/'. $bst_id);