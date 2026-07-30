<?php

$this_id = (int)$fwRequest->getparam('elog_id', 0);

if ($this_id > 0)

	{

		$thisTable = new Fw_Db_Table('email_log');

		$thisTable->setWhere("elog_id =". $this_id);

		$thisTable->deleteRow();

	}

Location(BASE_URL . "emaillibrary.email_log");