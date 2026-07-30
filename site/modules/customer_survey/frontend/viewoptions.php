<?php
$fwMainView = 'file:' . getcwd() . '/viewoptions.tpl';

//$submit = $fwRequest->getParam('subAddDetail', '');

  $group = array_keys($_SESSION['user']['::groups::']);
  $fwViewData['group'] = $group[0];

$thisTable = new Fw_Db_Table("survey_options");

$fwViewData['taskdata'] = $thisTable->getAllRows(); 

