<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['approval']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['approval']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['approval']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['approval']['id'];
