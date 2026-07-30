<?php
$this_id = (int)$fwRequest->getparam('pa_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('paqr_alert_admin');
		$thisTable->setWhere("pa_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "planning_assesment_quickreport.view_alert");