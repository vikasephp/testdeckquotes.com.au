<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['status']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['status']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['status']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['status']['id'];
