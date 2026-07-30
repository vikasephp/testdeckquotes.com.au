<?php
$this_id = (int)$fwRequest->getparam('dp_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('dp_mistak_log_plan');
		$thisTable->setWhere("dp_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "design_plans_mistake_log.view_plans");