<?php
$this_id = (int)$fwRequest->getparam('pt_id', 0);
$mr_id = (int)$fwRequest->getparam('mr_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('report_populate_text');
		$thisTable->setWhere("pt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "da_builder.view_populate_text/mr_id/".$mr_id);