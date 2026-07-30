<?php
$this_id = (int)$fwRequest->getparam('bqa_id', 0);
if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('business_qa');
	$thisTable->setWhere("bqa_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . $XFA['home']);
