<?php

$this_id = (int)$fwRequest->getparam('pel_id', 0);
$pel_task_id = (int)$fwRequest->getparam('pel_task_id', 0);


if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('proposal_task_list_email_link');
    $thisTable->setWhere("pel_id = ". $this_id);
    $thisTable->deleteRow();
	
	//$thisTable2 = new Fw_Db_Table('proposal_tasks_sub');
	//$thisTable2->setWhere("bts_bsst_id = ". $this_id);
    //$thisTable2->deleteRows();

}

Location(BASE_URL . $XFA['detail'].'/bst_id/'. $pel_task_id);