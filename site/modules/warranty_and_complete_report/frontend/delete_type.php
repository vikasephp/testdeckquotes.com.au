<?php
$this_id = (int)$fwRequest->getparam('ho_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('wacr_handover_options');
		$thisTable->setWhere("ho_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "warranty_and_complete_report.viewtype");