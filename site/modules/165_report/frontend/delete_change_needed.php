<?php
$this_id = (int)$fwRequest->getparam('cn_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('165_report_change_needed');
		$thisTable->setWhere("cn_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "165_report.view_change_needed");