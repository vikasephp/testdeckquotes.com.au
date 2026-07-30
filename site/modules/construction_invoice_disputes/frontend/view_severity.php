<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['severity']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['severity']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['severity']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['severity']['id'];
