<?php
$this_id = (int)$fwRequest->getparam('cs_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('customer_nps_status_admin');
		$thisTable->setWhere("cs_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "customer_nps_report.view_status");