<?php

$this_id = (int)$fwRequest->getparam('ps_id', 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table("proposal_que_ans");
    $thisTable->setWhere("ps_id = $this_id");
    $thisTable->deleteRow();
	
	
}

Location(BASE_URL . $XFA['qa_list']);