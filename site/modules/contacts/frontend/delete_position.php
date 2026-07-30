<?php
$this_id = (int)$fwRequest->getparam('cp_id', 0);

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('contacts_position');
	$thisTable->setWhere("cp_id = $this_id");
	$thisTable->deleteRow();
}
	
Location(BASE_URL . "contacts.view_position");