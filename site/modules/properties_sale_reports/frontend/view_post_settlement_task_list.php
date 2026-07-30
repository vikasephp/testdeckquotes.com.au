<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['post_settlement_task_list']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['post_settlement_task_list']['table']);
$thisTable->setWhere("psrpstl_key = 'T'");
$thisTable->setOrderBy("psrpstl_sequence ASC");
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['post_settlement_task_list']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['post_settlement_task_list']['id'];
