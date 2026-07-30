<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['manage']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['manage']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['manage']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['manage']['id'];
