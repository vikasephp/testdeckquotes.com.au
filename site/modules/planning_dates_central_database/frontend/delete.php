<?php
$this_id = (int)$fwRequest->getparam('tt_id', 0);
if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('time_tracker');
		$thisTable->setWhere("tt_id = $this_id");
		$thisTable->deleteRow();

	}
Location(BASE_URL . $XFA['home']);