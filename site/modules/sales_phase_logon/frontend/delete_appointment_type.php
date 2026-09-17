<?php
$this_id = (int)$fwRequest->getparam('splat_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('sales_phase_logon_appointment_type');
		$thisTable->setWhere("splat_id = $this_id");
		$thisTable->deleteRow();
		
	}
	
Location(BASE_URL . "sales_phase_logon.view_appointment_type");