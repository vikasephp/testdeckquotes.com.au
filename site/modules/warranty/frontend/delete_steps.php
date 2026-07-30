<?php
$this_id = (int)$fwRequest->getparam('apd_id', 0);
$car_id = (int)$fwRequest->getparam('car_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('action_plan_step_detail');
		$thisTable->setWhere("apd_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "construction_alert_report.viewstep/car_id/".$car_id);