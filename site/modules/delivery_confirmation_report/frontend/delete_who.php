<?php
$this_id = (int)$fwRequest->getparam('wo_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('delivery_conf_who');
		$thisTable->setWhere("wo_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "delivery_confirmation_report.view_who");