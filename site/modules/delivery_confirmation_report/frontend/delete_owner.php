<?php
$this_id = (int)$fwRequest->getparam('ow_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('delivery_conf_owner');
		$thisTable->setWhere("ow_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "delivery_confirmation_report.view_owner");