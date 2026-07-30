<?php
$this_id = (int)$fwRequest->getparam('ims_id', 0);

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('insurance_manager_status');
	$thisTable->setWhere("ims_id = $this_id");
	$thisTable->deleteRow();
	
}
Location(BASE_URL . $BASEFOLDER .".view_status");