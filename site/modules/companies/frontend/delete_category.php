<?php
$this_id = (int)$fwRequest->getparam('co_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('category_options');
		$thisTable->setWhere("co_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "companies.view_category");