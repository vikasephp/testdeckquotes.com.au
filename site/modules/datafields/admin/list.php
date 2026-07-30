<?php
$thisTable = new Fw_Db_Table($TABLE);
$thisTable->setOrderBy($ID.' ASC');
$fwViewData['list'] = $thisTable->getAllRows();
$fwViewData['title'] = $MODULE_PLURAL;

