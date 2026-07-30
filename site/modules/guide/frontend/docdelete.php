<?php
$this_id = (int)$fwRequest->getparamget('bgd_id', 0);

if($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('bes_guide_docs');
		$thisTable->setWhere("bgd_id = $this_id");
		$thisTable->deleteRow();
echo "delete.";				
	}
exit;