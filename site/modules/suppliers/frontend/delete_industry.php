<?php
$this_id = (int)$fwRequest->getparam('si_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('suppliers_industry');
		$thisTable->setWhere("si_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "suppliers.edit_industry");