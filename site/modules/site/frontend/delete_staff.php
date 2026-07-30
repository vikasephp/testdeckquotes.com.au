<?php
$this_id = (int)$fwRequest->getparam('f_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table("frank_staff");
		$thisTable->setWhere("f_id = $this_id");
		$thisTable->deleteRow();
		
	
	}
Location(BASE_URL . 'site.stafflist');