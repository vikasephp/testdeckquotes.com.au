<?php
$fwMainView = 'file:' . getcwd() . '/viewtask.tpl';

//$submit = $fwRequest->getParam('subAddDetail', '');

  $group = array_keys($_SESSION['user']['::groups::']);
  $fwViewData['group'] = $group[0];

$thisTable = new Fw_Db_Table("warranty_log_task");

$fwViewData['taskdata'] = $thisTable->getAllRows(); 

