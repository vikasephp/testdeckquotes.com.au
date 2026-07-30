<?php
$this_id = (int)$fwRequest->getparam('to_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('type_options_cpr');
		$thisTable->setWhere("to_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "construction_pipeline_report.view_type");