<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['type']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['type']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['type']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['type']['id'];
