<?php
$this_id = (int)$fwRequest->getparam('ime_id', 0);

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('insurance_manager_email');
	$thisTable->setWhere("ime_id = $this_id");
	$thisTable->deleteRow();
	
}
Location(BASE_URL . $BASEFOLDER .".view_email_template");