<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['action_type']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['action_type']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['action_type']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['action_type']['id'];
