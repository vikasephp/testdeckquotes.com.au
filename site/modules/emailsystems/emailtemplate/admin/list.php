<?php
$thisTable = new Fw_Db_Table($TABLE);
$fwViewData['list'] = $thisTable->getAllRows();
$fwViewData['title'] = $MODULE_PLURAL;

