<?php

$this_id = (int)$fwRequest->getparam('au_id', 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table("auto_email_text_task");
    $thisTable->setWhere("au_id = $this_id");
    $thisTable->deleteRow();
	
	
}

Location(BASE_URL . 'business_status_taskAdmin.auto_email_list');