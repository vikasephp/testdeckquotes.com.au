<?php
$this_id = (int)$fwRequest->getparam('wl_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('warranty_log_liability');
		$thisTable->setWhere("wl_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "warranty_log.view_liability");