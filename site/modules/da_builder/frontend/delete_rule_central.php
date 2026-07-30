<?php
$this_id = (int)$fwRequest->getparam('rr_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('report_rule');
		$thisTable->setWhere("rr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "da_builder.rules_central");