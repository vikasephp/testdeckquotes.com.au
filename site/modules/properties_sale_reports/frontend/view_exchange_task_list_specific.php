<?php

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['exchange_task_list_specific']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['exchange_task_list_specific']['table']);
$thisTable->setWhere("psretl_key = 'UT' AND psretl_bsn_id = $bsn_id");
$thisTable->setOrderBy("psretl_sequence ASC");
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['exchange_task_list_specific']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['exchange_task_list_specific']['id'];
