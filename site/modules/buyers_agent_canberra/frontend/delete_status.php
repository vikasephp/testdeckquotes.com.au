<?php
$this_id = (int)$fwRequest->getparam('bacs_id', 0);

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('buyers_agent_canberra_status');
	$thisTable->setWhere("bacs_id = $this_id");
	$thisTable->deleteRow();
	
}
Location(BASE_URL . $BASEFOLDER .".view_status");