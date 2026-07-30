<?php

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['lead_conversion_task_list_specific']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['lead_conversion_task_list_specific']['table']);
$thisTable->setWhere("psrlctl_key = 'UT' AND psrlctl_bsn_id = $bsn_id");
$thisTable->setOrderBy("psrlctl_sequence ASC");
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['lead_conversion_task_list_specific']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['lead_conversion_task_list_specific']['id'];
