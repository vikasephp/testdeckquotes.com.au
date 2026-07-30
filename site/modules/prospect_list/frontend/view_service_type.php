<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['service_type']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['service_type']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['service_type']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['service_type']['id'];
