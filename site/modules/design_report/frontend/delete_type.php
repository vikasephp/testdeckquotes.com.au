<?php
$this_id = (int)$fwRequest->getparam('dr_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('design_report_type');
		$thisTable->setWhere("dr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "design_report.viewtype");