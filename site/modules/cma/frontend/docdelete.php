<?php
$this_id = (int)$fwRequest->getparamget('btdl_docs_id', 0);

if($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('cma_images');
		$thisTable->setWhere("cm_id = $this_id");
		$thisTable->deleteRow();			
	}
echo "delete.";		
exit;