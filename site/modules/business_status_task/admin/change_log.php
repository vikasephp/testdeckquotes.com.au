<?php
$tablePages = new Fw_Db_Table("business_task_change_log");
$tablePages->setOrderBy('tcl_date DESC');
$catdata=$tablePages->getAllRows();

$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;
