<?php
$this_id = (int)$fwRequest->getparam('pp_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('planning_project_types');
		$thisTable->setWhere("pp_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "project_planning_checklistAdmin.view_ppt");