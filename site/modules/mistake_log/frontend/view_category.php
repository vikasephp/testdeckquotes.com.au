<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['mistake_log_category']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['mistake_log_category']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['mistake_log_category']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['mistake_log_category']['id'];
