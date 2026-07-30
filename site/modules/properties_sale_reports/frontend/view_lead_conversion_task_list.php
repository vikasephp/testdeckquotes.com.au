<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['lead_conversion_task_list']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['lead_conversion_task_list']['table']);
$thisTable->setWhere("psrlctl_key = 'T'");
//$fwViewData['resultdata'] = $thisTable->getAllRows($where);
$thisTable->setOrderBy("psrlctl_sequence ASC");
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['lead_conversion_task_list']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['lead_conversion_task_list']['id'];
