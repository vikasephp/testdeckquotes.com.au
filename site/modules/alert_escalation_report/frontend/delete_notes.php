<?php
$this_id = (int)$fwRequest->getparam('cn_id', 0);
$car_id = (int)$fwRequest->getparam('car_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('alert_escalation_notes');
		$thisTable->setWhere("cn_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "alert_escalation_report.view_notes/car_id/".$car_id);