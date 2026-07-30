<?php
$this_id = (int)$fwRequest->getparam('sc_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('customer_nps_spoke_cust');
		$thisTable->setWhere("sc_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "customer_nps_report.view_spoke_to_customer");