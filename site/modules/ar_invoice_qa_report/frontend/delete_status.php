<?php
$this_id = (int)$fwRequest->getparam('st_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('ar_invoice_report_status');
		$thisTable->setWhere("st_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "ar_invoice_qa_report.view_status");