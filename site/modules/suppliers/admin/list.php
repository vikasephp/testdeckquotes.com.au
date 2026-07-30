<?php
$tablePages = new Fw_Db_Table($TABLE);
$tablePages->setOrderBy('sp_name ASC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;