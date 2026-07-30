<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['mistake_log_process_stage']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['mistake_log_process_stage']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['mistake_log_process_stage']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['mistake_log_process_stage']['id'];
