<?php
$this_id = (int)$fwRequest->getparam('et_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('entity_report_type');
		$thisTable->setWhere("et_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "entity_referal_report.view_type");