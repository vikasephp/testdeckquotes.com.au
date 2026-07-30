<?php
$this_id = (int)$fwRequest->getparam('cldf_id', 0);
if ($this_id > 0) {
    $thisTable = new Fw_Db_Table('central_letter_database_files');
    $thisTable->setWhere("cldf_id = $this_id");
    $thisTable->deleteRow();
}
Location(BASE_URL . $XFA['home']);
exit;