<?php
$this_id = (int)$fwRequest->getparam($ID, 0);
$del_id = (int)$fwRequest->getparam('mbsl_id', 0);

if($this_id > 0 && $del_id > 0)
	{
		$thisTable = new Fw_Db_Table('mbsl_notes');
		$thisTable->setWhere("mbsl_id = $del_id");
		$thisTable->deleteRow();		
	}
Location(BASE_URL . $XFA['detail']."/mlbs_id/".$this_id);