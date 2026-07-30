<?php
$this_id = (int)$fwRequest->getparam('sw_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('sub_pages_www');
		$thisTable->setWhere("sw_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "sub_pages.view_www");