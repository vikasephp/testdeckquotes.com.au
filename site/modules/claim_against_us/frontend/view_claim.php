<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['claim']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['claim']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['claim']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['claim']['id'];
