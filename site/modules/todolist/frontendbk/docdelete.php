<?php
$this_id = (int)$fwRequest->getparamget('btdl_docs_id', 0);

if($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('business_to_do_list_docs');
		$thisTable->setWhere("btdl_docs_id = $this_id");
		$thisTable->deleteRow();			
	}
echo "delete.";		
exit;