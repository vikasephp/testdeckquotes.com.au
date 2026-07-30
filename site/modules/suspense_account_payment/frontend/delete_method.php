<?php
$this_id = (int)$fwRequest->getparam('sm_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('suspense_account_method');
		$thisTable->setWhere("sm_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "suspense_account_payment.view_method");