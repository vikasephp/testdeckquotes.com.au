<?php
$this_id = (int)$fwRequest->getparam('cnn_id', 0);
$cn_id = (int)$fwRequest->getparam('cn_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('customer_nps_notes');
		$thisTable->setWhere("cnn_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "customer_nps_report.view_notes/cn_id/".$cn_id);