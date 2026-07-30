<?php
$this_id = (int)$fwRequest->getparam($ID, 0);
if ($this_id > 0) {
    $thisTable = new Fw_Db_Table($TABLE);
    $thisTable->setWhere("$ID = $this_id");
    $detail['cp_pdf_upload'] = '';
    $res = $thisTable->updateRow($detail);
    // db($res);
    // db($thisTable);
    // die();
}
// db($ID);
// db($this_id);
// db($TABLE);
// die();
Location(BASE_URL . $XFA['home']);
exit;
