<?php
$this_id = (int)$fwRequest->getparamget('dhd_id', 0);

if($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('business_strategy_docs');
		$thisTable->setWhere("dhd_id = $this_id");
		$thisTable->deleteRow();
echo "delete.";				
	}
exit;