<?php

$this_id = (int)$fwRequest->getparam('mr_id', 0);

if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table('merge_report_buttons');
    $thisTable->setWhere("mr_id = $this_id");
    $thisTable->deleteRow();
	

	
}

Location(BASE_URL . $XFA['listbuttons']);