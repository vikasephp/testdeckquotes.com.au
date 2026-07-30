<?php
$this_id = (int)$fwRequest->getparam('ds_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('deposite_report_sent');
		$thisTable->setWhere("ds_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "deposite_report.view_sent");