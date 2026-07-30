<?php
$this_id = (int)$fwRequest->getparam('is_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('short_stays_payables_tracker_invoice_stage');
		$thisTable->setWhere("is_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "short_stays_payables_tracker.view_stage");