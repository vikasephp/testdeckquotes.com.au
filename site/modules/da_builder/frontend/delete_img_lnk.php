<?php
$ri_id = (int)$fwRequest->getparam('ri_id', 0);
$rl_id = (int)$fwRequest->getparam('rl_id', 0);

	if ($ri_id > 0)
	{
		$thisTable = new Fw_Db_Table('report_rule_images');
		$thisTable->setWhere("ri_id = $ri_id");
		$thisTable->deleteRow();
		
	}
	
	if ($rl_id > 0)
	{
		$thisTable = new Fw_Db_Table('report_rule_links');
		$thisTable->setWhere("rl_id = $rl_id");
		$thisTable->deleteRow();
		
	}
	
Location(BASE_URL . "da_builder.rules_central");