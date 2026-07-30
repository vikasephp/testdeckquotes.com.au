<?php
$this_id = (int)$fwRequest->getparam($ID, 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table($TABLE);
		$thisTable->setWhere("$ID = $this_id");
		$thisTable->deleteRow();
		
		$thisTable2 = new Fw_Db_Table('action_plan_step_detail');
		$thisTable2->setWhere("apd_car_id = $this_id");
		$thisTable2->deleteRows();
		
	}
Location(BASE_URL . $XFA['home']);