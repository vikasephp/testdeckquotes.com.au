<?php
$fwMainView = 'file:' . getcwd() . '/view_jurisdiction.tpl';
$thisTable = new Fw_Db_Table($JURISDICTION_TABLE);
$fwViewData['resultdata'] = $thisTable->getAllRows();

$fwViewData['page_title'] = $MODULE_PLURAL;
$fwViewData['primary_id'] = $JURISDICTION_ID;
