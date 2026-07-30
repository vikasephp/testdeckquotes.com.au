<?php
$this_id = (int)$fwRequest->getparam('pt_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('planning_project_type_admin');
		$thisTable->setWhere("pt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "business.view_type");