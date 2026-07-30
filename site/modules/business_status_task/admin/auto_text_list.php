<?php
$tablePages = new Fw_Db_Table("auto_task_text_msg");
$tablePages->setOrderBy('au_task_uid ASC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;
