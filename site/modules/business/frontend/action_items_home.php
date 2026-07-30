<?php
$fwMainView = 'file:' . getcwd() . '/action_items_home.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', 0);

$sales_action_items_data = [];
if($bsn_id > 0) {
    $table_sales_action_items = new Fw_Db_Table('sales_action_items');
    $table_sales_action_items->setWhere('sai_bsn_id = ' . $bsn_id);

    $add_action_item = $fwRequest->getParam('add_action_item', '');
    if($add_action_item) {
        $table_sales_action_items->insertRow([
            'sai_bsn_id' => $bsn_id
        ]);
    }

    $table_sales_action_items->setOrderBy('sai_created_at DESC');
    $sales_action_items_data = $table_sales_action_items->getAllRows();
}

$fwViewData['sales_action_items_data'] = $sales_action_items_data;
