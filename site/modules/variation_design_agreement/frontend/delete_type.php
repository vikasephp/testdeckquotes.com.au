<?php
$this_id = (int)$fwRequest->getparam('vt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('variation_design_type');
		$thisTable->setWhere("vt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "variation_design_agreement.view_type");