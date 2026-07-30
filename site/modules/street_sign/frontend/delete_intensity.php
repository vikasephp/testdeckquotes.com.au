<?php
$this_id = (int)$fwRequest->getparam('si_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('street_sign_intensity');
		$thisTable->setWhere("si_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "street_sign.view_intensity");