<?php
$this_id = (int)$fwRequest->getparam('sn_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('cipr_sn_th');
		$thisTable->setWhere("sn_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "construction_in_progress_report.view_sn");