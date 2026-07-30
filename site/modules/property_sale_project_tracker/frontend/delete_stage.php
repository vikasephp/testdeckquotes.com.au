<?php
$this_id = (int)$fwRequest->getparam('sd_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('property_sale_stage_detail');
		$thisTable->setWhere("sd_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "property_sale_project_tracker.home");