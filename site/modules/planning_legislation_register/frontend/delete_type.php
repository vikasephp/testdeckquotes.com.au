<?php
$this_id = (int)$fwRequest->getparam('pd_id', 0);

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('planning_legislation_doctype');
	$thisTable->setWhere("pd_id = $this_id");
	$thisTable->deleteRow();
	
}
Location(BASE_URL . $BASEFOLDER .".view_type");