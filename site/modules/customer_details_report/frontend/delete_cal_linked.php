<?php
$this_id = (int)$fwRequest->getparam('cl_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('calendar_linked_admin');
		$thisTable->setWhere("cl_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "customer_details_report.view_cal_linked");