<?php
$this_id = (int)$fwRequest->getparam('pa_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('nsw_paqr_alert_admin');
		$thisTable->setWhere("pa_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "nsw_planning_assesment_quickreport.view_alert");