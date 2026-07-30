<?php
$this_id = (int)$fwRequest->getparam('pr_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('proposal_report_status');
		$thisTable->setWhere("pr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "proposal_report.edit_status");