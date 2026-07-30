<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['category']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['category']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['category']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['category']['id'];
