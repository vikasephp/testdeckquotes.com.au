<?php
$this_id = (int)$fwRequest->getparam('st_id', 0);
$sp_id = (int)$fwRequest->getparam('sp_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('sales_prospect_detail_task');
		$thisTable->setWhere("st_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "sales_prospect.detail/sp_id/".$sp_id);