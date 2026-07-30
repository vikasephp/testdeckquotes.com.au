<?php
$this_id = (int)$fwRequest->getparam('et_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('email_template_mini');
		$thisTable->setWhere("et_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "construction_alert_report.view_email_templates");