<?php
$this_id = (int)$fwRequest->getparam('wa_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('warranty_log_area');
		$thisTable->setWhere("wa_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "warranty_log.view_area");