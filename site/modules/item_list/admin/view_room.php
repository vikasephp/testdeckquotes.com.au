<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['room']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['room']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['room']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['room']['id'];
