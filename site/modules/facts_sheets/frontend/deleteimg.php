<?php
$this_id = (int)$fwRequest->getparam($ID, 0);


	$data['doc_image']='';
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table($TABLE);
		$thisTable->setWhere("$ID = $this_id");
		$thisTable->updateRow($data);
		
	}
	
	
//Location(BASE_URL . $XFA['home']);