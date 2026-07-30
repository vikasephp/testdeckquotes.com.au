<?php
$this_id = (int)$fwRequest->getparam('et_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('people_man_type_admin');
		$thisTable->setWhere("et_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "people_management.view_type");