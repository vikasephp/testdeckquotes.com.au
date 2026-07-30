<?php

$this_id = (int)$fwRequest->getparam('btp_id', 0);
$bst_id = (int)$fwRequest->getparam('bst_id', 0);


if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('busness_status_task_procedures');
    $thisTable->setWhere("btp_id = ". $this_id);
    $thisTable->deleteRow();

}

Location(BASE_URL . $XFA['detail'].'/bst_id/'. $bst_id);