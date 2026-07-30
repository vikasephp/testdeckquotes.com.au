<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['invoice_type']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['invoice_type']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['invoice_type']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['invoice_type']['id'];
