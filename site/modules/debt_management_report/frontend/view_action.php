<?php
$fwMainView = 'file:' . getcwd() . '/view_action.tpl';
$thisTable = new Fw_Db_Table($ACTION_TABLE);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_PLURAL;
$fwViewData['primary_id'] = $ACTION_ID;
