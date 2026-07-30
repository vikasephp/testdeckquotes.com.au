<?php

$sai_id = (int)$fwRequest->getparam('sai_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);

if ($sai_id > 0 && $bsn_id > 0) {
    $table_sales_action_items = new Fw_Db_Table('sales_action_items');
    $table_sales_action_items->setWhere("sai_id = $sai_id");
    $table_sales_action_items->deleteRow();
}

Location(BASE_URL . 'business.action_items_home/bsn_id/'.$bsn_id);