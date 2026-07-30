<?php
$this_id = (int)$fwRequest->getparam('pr_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('procedure_panel_designestimatereport');
		$thisTable->setWhere("pr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "design_estimates_report.view_procedure");