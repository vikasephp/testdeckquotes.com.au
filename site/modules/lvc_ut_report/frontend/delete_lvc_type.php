<?php
$this_id = (int)$fwRequest->getparam('lv_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('lvc_ut_lvc_type');
		$thisTable->setWhere("lv_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "lvc_ut_report.view_lvc_type");