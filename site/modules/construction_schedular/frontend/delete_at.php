<?php
$at_id = (int)$fwRequest->getparam('at_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);

	if ($at_id > 0)
	{
		$thisTable = new Fw_Db_Table('construction_schedular_assignto');
		$thisTable->setWhere("at_id = $at_id");
		$thisTable->deleteRow();
		
	}
	
	
	
Location(BASE_URL . "construction_schedular.grid_view/bsn_id/".$bsn_id);