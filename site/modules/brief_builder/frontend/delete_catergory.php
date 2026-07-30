<?php
$this_id = (int)$fwRequest->getparam('bbc_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('brief_builder_catergory');
		$thisTable->setWhere("bbc_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "brief_builder.edit_catergory");