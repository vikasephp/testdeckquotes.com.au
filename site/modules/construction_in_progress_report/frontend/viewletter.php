<?php
$fwMainView = 'file:' . getcwd() . '/viewletter.tpl';

//$submit = $fwRequest->getParam('subAddDetail', '');

  $group = array_keys($_SESSION['user']['::groups::']);
  $fwViewData['group'] = $group[0];

$thisTable = new Fw_Db_Table("letter_text");

$fwViewData['letterdata'] = $thisTable->getAllRows(); 

