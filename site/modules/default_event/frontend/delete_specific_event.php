<?php
$this_id = (int)$fwRequest->getparam('se_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('specific_event');
		$thisTable->setWhere("se_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "default_event.view_specific_event");