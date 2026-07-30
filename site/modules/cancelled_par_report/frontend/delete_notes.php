<?php
$this_id = (int)$fwRequest->getparam('cn_id', 0);
$cp_id = (int)$fwRequest->getparam('cp_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('cancellation_par_notes');
		$thisTable->setWhere("cn_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "cancelled_par_report.view_notes/cp_id/".$cp_id);