<?php
$this_id = (int)$fwRequest->getparam('rs_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('customer_nps_response_sent');
		$thisTable->setWhere("rs_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "customer_nps_report.view_response_sent");