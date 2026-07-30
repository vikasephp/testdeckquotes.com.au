<?php
$this_id = (int)$fwRequest->getparam('rt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('roofing_they_want');
		$thisTable->setWhere("rt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "roofing_report.view_they_want");