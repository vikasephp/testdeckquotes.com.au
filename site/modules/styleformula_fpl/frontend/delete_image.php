<?php
$this_id = (int)$fwRequest->getparam('ig_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('galleries_fpl');
		$thisTable->setWhere("ig_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . $XFA['listimage']);