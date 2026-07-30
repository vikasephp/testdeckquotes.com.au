<?php
$this_id = (int)$fwRequest->getparam('ns_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('status_admin_nr');
		$thisTable->setWhere("ns_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "da_builder.view_status_nr");