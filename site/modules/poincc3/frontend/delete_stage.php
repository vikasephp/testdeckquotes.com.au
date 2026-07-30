<?php
$this_id = (int)$fwRequest->getparam('is_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('poincc3_invoice_stage');
		$thisTable->setWhere("is_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "poincc3.view_stage");