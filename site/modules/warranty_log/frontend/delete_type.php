<?php
$this_id = (int)$fwRequest->getparam('wt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('warranty_log_type');
		$thisTable->setWhere("wt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "warranty_log.view_type");