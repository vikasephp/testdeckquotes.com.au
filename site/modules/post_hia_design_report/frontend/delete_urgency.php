<?php
$this_id = (int)$fwRequest->getparam('pu_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('post_hia_urgency');
		$thisTable->setWhere("pu_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "post_hia_design_report.view_urgency");