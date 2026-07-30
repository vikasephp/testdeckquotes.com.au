<?php
$tablePages = new Fw_Db_Table("business_task_delete_log");
$tablePages->setOrderBy('tdl_date DESC');
$catdata=$tablePages->getAllRows();


$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;
