<?php
$this_id = (int)$fwRequest->getparam('ww_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('warranty_log_why_not');
		$thisTable->setWhere("ww_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "warranty_log.view_why_not");