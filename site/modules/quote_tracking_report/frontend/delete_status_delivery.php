<?php
$this_id = (int)$fwRequest->getparam('qs_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('quote_tracking_status_delivery');
		$thisTable->setWhere("qs_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "quote_tracking_report.view_status_delivery");