<?php
$tablePages = new Fw_Db_Table("renovation_que_ans");
$tablePages->setOrderBy('ps_task_id DESC');
$catdata=$tablePages->getAllRows();
$fwViewData['list'] = $catdata; 
$fwViewData['title'] = $MODULE_PLURAL;
