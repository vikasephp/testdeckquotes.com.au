<?php
$this_id = (int)$fwRequest->getparam('aa_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('audit_admin');
		$thisTable->setWhere("aa_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "project_audit_report.view_audit");