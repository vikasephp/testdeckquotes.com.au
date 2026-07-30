<?php
$this_id = (int)$fwRequest->getparam('rb_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('report_build');
		$thisTable->setWhere("rb_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "da_builder.report_name");