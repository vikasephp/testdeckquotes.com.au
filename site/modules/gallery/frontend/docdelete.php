<?php
$this_id = (int)$fwRequest->getparamget($ID1, 0);
if($this_id > 0)
	{
		$thisTable = new Fw_Db_Table($TABLE2);
		$thisTable->setWhere($ID1." = ".$this_id);
		$thisTable->deleteRow();
echo "delete.";				
	}
exit;