<?php
$this_id = (int)$fwRequest->getparam('sa_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('street_sign_action');
		$thisTable->setWhere("sa_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "street_sign.view_action");