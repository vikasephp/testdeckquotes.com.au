<?php
$this_id = (int)$fwRequest->getparam('imd_id', 0);
if ($this_id > 0) {
    $thisTable = new Fw_Db_Table('insurance_manager_docs');
    $thisTable->setWhere("imd_id = $this_id");
    $thisTable->deleteRow();
}
Location(BASE_URL . $XFA['home']);
exit;