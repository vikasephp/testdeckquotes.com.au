<?php

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['post_settlement_task_list_specific']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['post_settlement_task_list_specific']['table']);
$thisTable->setWhere("psrpstl_key = 'UT' AND psrpstl_bsn_id = $bsn_id");
$thisTable->setOrderBy("psrpstl_sequence ASC");
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['post_settlement_task_list_specific']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['post_settlement_task_list_specific']['id'];
