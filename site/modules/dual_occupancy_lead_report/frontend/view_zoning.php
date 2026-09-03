<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['zoning']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['zoning']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['zoning']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['zoning']['id'];
