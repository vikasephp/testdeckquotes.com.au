<?php
$this_id = (int)$fwRequest->getparam('rpt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('renovation_project_types');
		$thisTable->setWhere("rpt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "renovation_convert_task_report.viewtype");