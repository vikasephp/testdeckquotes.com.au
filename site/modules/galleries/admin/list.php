<?php
$tablePages = new Fw_Db_Table($TABLE);
$tablePages->setOrderBy($ID.' ASC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;

