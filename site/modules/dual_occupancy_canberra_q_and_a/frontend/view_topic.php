<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['topic_type']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['topic_type']['table']);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['topic_type']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['topic_type']['id'];
