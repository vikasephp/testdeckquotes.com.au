<?php
$this_id = (int)$fwRequest->getparam('imt_id', 0);

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('insurance_manager_type');
	$thisTable->setWhere("imt_id = $this_id");
	$thisTable->deleteRow();
	
}
Location(BASE_URL . $BASEFOLDER .".view_type");