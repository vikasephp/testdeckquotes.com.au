<?php
$this_id = (int)$fwRequest->getparam('st_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('variation_design_status');
		$thisTable->setWhere("st_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "variation_design_agreement.view_status");