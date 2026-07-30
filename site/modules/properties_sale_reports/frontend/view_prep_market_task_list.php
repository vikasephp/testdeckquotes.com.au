<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['prep_market_task_list']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['prep_market_task_list']['table']);
$thisTable->setWhere("psrpmtl_key = 'T'");
$thisTable->setOrderBy("psrpmtl_sequence ASC");
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['prep_market_task_list']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['prep_market_task_list']['id'];
