<?php
$this_id = (int)$fwRequest->getparam('on_id', 0);
$os_id = (int)$fwRequest->getparam('os_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('165_report_notes');
		$thisTable->setWhere("on_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "165_report.view_notes/os_id/".$os_id);