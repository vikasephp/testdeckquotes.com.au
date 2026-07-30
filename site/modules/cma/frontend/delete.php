<?php
$this_id = (int)$fwRequest->getparam($ID, 0);
if ($this_id > 0)
{
    $thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere($ID." = $this_id");
    $thisTable->deleteRow();
	
	$thisTable = new Fw_Db_Table('cma_images');
    $thisTable->setWhere("cma_id = $this_id");
    $thisTable->deleteRows();
	
	
}
Location(BASE_URL . $XFA['home']);