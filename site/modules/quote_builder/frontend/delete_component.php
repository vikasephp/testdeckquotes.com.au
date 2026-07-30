<?php
$this_id = (int)$fwRequest->getparam('qb_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('quote_builder_component');
		$thisTable->setWhere("qb_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "quote_builder.view_component");