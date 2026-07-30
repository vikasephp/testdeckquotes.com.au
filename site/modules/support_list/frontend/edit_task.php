<?php
$fwMainView = 'file:' . getcwd() . '/edit_task.tpl';

$table = new Fw_Db_Table('support_task');
$fwViewData['tasklist'] = $table->getRows();