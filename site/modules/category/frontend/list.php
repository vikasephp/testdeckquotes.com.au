<?php
$tablePages = new Fw_Db_Table($TABLE);

$fwViewData['list'] =$tablePages->getAllRows();

$fwViewData['title'] = $MODULE_PLURAL;