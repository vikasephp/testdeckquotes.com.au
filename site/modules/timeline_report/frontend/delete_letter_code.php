<?php
$this_id = (int)$fwRequest->getparam('lc_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('letter_code');
		$thisTable->setWhere("lc_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "timeline_report.edit_letter_code");