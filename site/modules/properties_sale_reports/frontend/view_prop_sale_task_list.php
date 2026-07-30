<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['prop_sale_task_list']['view_file'];
$thisTable = new Fw_Db_Table($ATTRIBUTES['prop_sale_task_list']['table']);
$thisTable->setWhere("psrpstl_key = 'T'");
$thisTable->setOrderBy("psrpstl_sequence ASC");
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_SINGULAR . ' ' . $ATTRIBUTES['prop_sale_task_list']['name'];
$fwViewData['primary_id'] = $ATTRIBUTES['prop_sale_task_list']['id'];
