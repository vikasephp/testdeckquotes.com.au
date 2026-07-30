<?php
$thisTable = new Fw_Db_Table($TABLE);
$thisTable->setOrderBy('tm_id ASC');
$fwViewData['list'] = $thisTable->getAllRows();
$fwViewData['title'] = $MODULE_PLURAL;

