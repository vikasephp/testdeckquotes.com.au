<?php
$this_id = (int)$fwRequest->getparam('vp_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('variation_report_plans');
		$thisTable->setWhere("vp_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "variations_report.view_plans");