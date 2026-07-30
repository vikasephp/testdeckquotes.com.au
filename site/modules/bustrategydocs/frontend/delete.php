<?php
$this_id = (int)$fwRequest->getparam($ID, 0);
if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere($ID." = $this_id");
    $thisTable->deleteRow();
	
	$thisTable = new Fw_Db_Table('business_strategy_docs');
    $thisTable->setWhere("dhd_bsd_id = $this_id");
    $thisTable->deleteRows();
}
Location(BASE_URL . $XFA['home']);