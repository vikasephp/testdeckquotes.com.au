<?php
$po_id = (int)$fwRequest->getparamget('po_id', 0);
if ($po_id > 0)
{
    $thisTable = new Fw_Db_Table('purchase_order');
    $thisTable->setWhere("po_id = $po_id");
     $detail['po_quote1'] = '';
    $detail['po_supplier1'] = '';
    $detail['po_type'] = '';
    $detail['po_value1'] = '';
    $detail['po_quote_accepted'] = '';
    $detail['po_accepted_supplier'] = '';
    $detail['po_accepted_value'] = '';
    $detail['po_acceptance_date'] = '';
    
    $thisTable->updateRow($detail);
}
print("success");
exit;