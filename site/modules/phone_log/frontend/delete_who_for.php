<?php
$this_id = (int)$fwRequest->getparam('pw_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('phone_log_whofor_admin');
		$thisTable->setWhere("pw_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "phone_log.view_who_for");