<?php
$this_id = (int)$fwRequest->getparam('pt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('project_planning_type');
		$thisTable->setWhere("pt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "project_planning_checklistAdmin.view_type");