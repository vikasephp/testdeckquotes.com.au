<?php
$this_id = (int)$fwRequest->getparam('cdcn_id', 0);
$wa_id = (int)$fwRequest->getParam('wa_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('warranty_log_cgfbdirectcosts_notes');
		$thisTable->setWhere("cdcn_id = $this_id");
		$thisTable->deleteRow();
	}
	
Location(BASE_URL . "warranty_log2.view_cgfbdirectcosts_notes/wa_id/$wa_id");