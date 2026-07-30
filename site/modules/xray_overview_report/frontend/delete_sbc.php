<?php
$this_id = (int)$fwRequest->getparam('sb_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('xray_overview_sbc');
		$thisTable->setWhere("sb_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "xray_overview_report.view_sbc");