<?php
$this_id = (int)$fwRequest->getparam('pt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('management_rep_pl_type');
		$thisTable->setWhere("pt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "management_report.view_type");