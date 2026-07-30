<?php
$this_id = (int)$fwRequest->getparam('st_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('develop_log_ephp_subtype');
		$thisTable->setWhere("st_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "development_log_ephp.view_sub_type");