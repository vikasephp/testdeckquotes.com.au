<?php
$this_id = (int)$fwRequest->getparam('question_id', 0);
if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('planning_approval_enquiries');
	$thisTable->setWhere("id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . $XFA['home']);
