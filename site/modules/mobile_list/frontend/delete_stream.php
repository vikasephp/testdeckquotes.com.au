<?php
$this_id = (int)$fwRequest->getparam('ms_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('mobile_list_stream');
		$thisTable->setWhere("ms_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "mobile_list.view_stream");