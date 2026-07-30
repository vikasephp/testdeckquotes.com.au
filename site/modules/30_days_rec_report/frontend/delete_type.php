<?php
$this_id = (int)$fwRequest->getparam('it_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('invoice_types');
		$thisTable->setWhere("it_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "30_days_rec_report.viewtype");