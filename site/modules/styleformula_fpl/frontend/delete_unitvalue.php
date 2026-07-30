<?php
$this_id = (int)$fwRequest->getparam('uv_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('unit_value');
		$thisTable->setWhere("uv_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . $XFA['listunitvalue']);