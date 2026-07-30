<?php
$this_id = (int)$fwRequest->getparam('dik_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('design_interface_keyfeatures');
		$thisTable->setWhere("dik_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "icon_list.view_feature");