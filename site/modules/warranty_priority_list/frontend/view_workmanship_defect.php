<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['workmanship_defect']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['workmanship_defect']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['workmanship_defect']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['workmanship_defect']['id'];
