<?php
$this_id = (int)$fwRequest->getparamget($ID, 0);
if ($this_id > 0) {
   $sql = "UPDATE $TABLE SET ldd_invoice_file = '' where $ID = " . $this_id;
   $fwDb->queryOne($sql);
}
Location(BASE_URL . $XFA['home']);
exit;