<?php
$this_id = (int)$fwRequest->getparam('pr_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('procedure_panel_short_stays_payables_tracker');
		$thisTable->setWhere("pr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "short_stays_payables_tracker.view_procedure");