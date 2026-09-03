<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['size_class']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['size_class']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['size_class']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['size_class']['id'];
