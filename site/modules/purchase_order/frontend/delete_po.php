<?php
$po_id = (int)$fwRequest->getparamget('po_id', 0);
if ($po_id > 0)
{
    $thisTable = new Fw_Db_Table('purchase_order');
    $thisTable->setWhere("po_id = $po_id");
    $thisTable->deleteRow();
		
}
Location(BASE_URL . $XFA['home']);
exit;