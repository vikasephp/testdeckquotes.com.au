<?php
$this_id = (int)$fwRequest->getparam('dc_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('dc_sections');
		$thisTable->setWhere("dc_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "documentCheckListAdmin.view_sections");