<?php
$this_id = (int)$fwRequest->getparam('wt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('watch_list_type');
		$thisTable->setWhere("wt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "watch_list_report.view_type");