<?php
$this_id = (int)$fwRequest->getparam('st_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('design_agr_inv_status');
		$thisTable->setWhere("st_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "design_agreement_invoice_report.view_status");