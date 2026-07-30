<?php
$this_id = (int)$fwRequest->getparam('de_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('design_team');
		$thisTable->setWhere("de_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "designer_tracker.edit_team");