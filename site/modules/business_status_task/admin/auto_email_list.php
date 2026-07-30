<?php
$tablePages = new Fw_Db_Table("auto_email_text_task");
$tablePages->setOrderBy('au_task_uid ASC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;
