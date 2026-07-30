<?php
$this_id = (int)$fwRequest->getparam('ip_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('poincc3_invoice_approver');
		$thisTable->setWhere("ip_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "poincc3.view_approver");