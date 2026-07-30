<?php
$this_id = (int)$fwRequest->getparam('rt_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('report_type_admin');
		$thisTable->setWhere("rt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "property_price_report.view_type");