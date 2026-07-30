<?php
$this_id = (int)$fwRequest->getparam('pr_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('pp_nsw_paqr');
		$thisTable->setWhere("pr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "nsw_planning_assesment_quickreport.view_procedure");