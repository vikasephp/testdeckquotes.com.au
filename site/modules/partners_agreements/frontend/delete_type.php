<?php
$this_id = (int)$fwRequest->getparam('it_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('trade_partners_typeoptions');
		$thisTable->setWhere("it_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "partners_agreements.viewtype");