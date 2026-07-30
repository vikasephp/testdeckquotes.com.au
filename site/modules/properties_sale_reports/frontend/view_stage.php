<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['manage_stage']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['manage_stage']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['manage_stage']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['manage_stage']['id'];
