<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES[0]['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES[0]['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES[0]['name'];
$fwViewData['primary_id'] = $ATTRIBUTES[0]['id'];
