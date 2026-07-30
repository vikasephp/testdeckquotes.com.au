<?php
$this_id = (int)$fwRequest->getparam('ma_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('missing_variations_action');
		$thisTable->setWhere("ma_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "missing_variation_invoice_report.view_action");