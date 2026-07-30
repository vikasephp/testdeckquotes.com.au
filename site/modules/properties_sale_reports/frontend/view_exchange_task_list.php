<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['exchange_task_list']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['exchange_task_list']['table']);
$thisTable->setWhere("psretl_key = 'T'");
$thisTable->setOrderBy("psretl_sequence ASC");
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['exchange_task_list']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['exchange_task_list']['id'];
