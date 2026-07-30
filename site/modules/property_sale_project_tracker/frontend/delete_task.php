<?php
$this_id = (int)$fwRequest->getparam('tm_id', 0);
$st_id = (int)$fwRequest->getparam('st_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('property_sale_task_master');
		$thisTable->setWhere("tm_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "property_sale_project_tracker.view_task/st_id/".$st_id);