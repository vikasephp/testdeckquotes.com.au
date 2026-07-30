<?php
$this_id = (int)$fwRequest->getparam('qmrs_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('quote_management_report_status');
		$thisTable->setWhere("qmrs_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "quote_management_report.view_quote_status");