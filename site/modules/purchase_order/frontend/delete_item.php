<?php
$po_id = (int)$fwRequest->getparamget('po_id', 0);
$pi_id = (int)$fwRequest->getparamget('pi_id', 0);
if ($pi_id > 0)
{
    $thisTable = new Fw_Db_Table('purchase_order_items');
    $thisTable->setWhere("pi_id = $pi_id");
    $thisTable->deleteRow();
		
}
Location(BASE_URL . 'purchase_order.view_item/po_id/'.$po_id);
exit;