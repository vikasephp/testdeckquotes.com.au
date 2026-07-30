<?php
$this_id = (int)$fwRequest->getparam('ta_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('di_2_type_admin');
		$thisTable->setWhere("ta_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "design_interface_2.view_type");