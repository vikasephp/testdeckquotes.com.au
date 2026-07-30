<?php
$this_id = (int)$fwRequest->getparam('rs_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('report_status_admin');
		$thisTable->setWhere("rs_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "da_builder.view_status");