<?php

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['prep_market_task_list_specific']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['prep_market_task_list_specific']['table']);
$thisTable->setWhere("psrpmtl_key = 'UT' AND psrpmtl_bsn_id = $bsn_id");
$thisTable->setOrderBy("psrpmtl_sequence ASC");
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['prep_market_task_list_specific']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['prep_market_task_list_specific']['id'];
