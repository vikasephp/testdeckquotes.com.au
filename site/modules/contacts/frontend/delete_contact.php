<?php
$this_id = (int)$fwRequest->getparam('cs_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('contacts');
		$thisTable->setWhere("cs_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . 'contacts.home');