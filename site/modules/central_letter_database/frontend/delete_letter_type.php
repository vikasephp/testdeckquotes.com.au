<?php

$fwViewData['primary_id'] = $primary_id = 'cld_id';;
$this_id = (int)$fwRequest->getparam($primary_id, 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table("central_letter_database_letter_type");
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL . $BASEFOLDER . ".view_letter_type");
