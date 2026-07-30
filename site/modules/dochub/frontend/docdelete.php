<?php
$this_id = (int)$fwRequest->getparamget('dhd_id', 0);

if($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('document_hub_docs');
		$thisTable->setWhere("dhd_id = $this_id");
		$filedata =  $thisTable->getRow();
		
	
		$thisTable->deleteRow();
echo "delete.";	


$dhd_dh_id = $filedata['dhd_dh_id'];
	    $documenthub_docs = new Fw_Db_Table('document_hub');
		
		$counterData['dh_thisversion'] =  0;
	
		$documenthub_docs->setWhere("dh_id = ".$dhd_dh_id);
	
		if($documenthub_docs->rowExists())
		{
				
			$documenthub_docs->updateRow($counterData);
		}


			
	}
exit;