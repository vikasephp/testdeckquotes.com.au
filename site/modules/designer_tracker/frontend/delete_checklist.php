<?php
$this_id = (int)$fwRequest->getparam('dtc_id', 0);

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('design_tracker_checklist');
	$thisTable->setWhere("dtc_id = $this_id");
	$thisTable->deleteRow();
}
	
Location(BASE_URL . "designer_tracker.mytask");