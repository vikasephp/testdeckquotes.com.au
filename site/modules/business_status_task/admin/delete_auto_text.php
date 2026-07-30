<?php

$this_id = (int)$fwRequest->getparam('au_id', 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table("auto_task_text_msg");
    $thisTable->setWhere("au_id = $this_id");
    $thisTable->deleteRow();
	
	
}

Location(BASE_URL . 'business_status_taskAdmin.auto_text_list');