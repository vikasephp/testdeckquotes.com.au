<?php
$fwMainView = 'file:' . getcwd() . '/view_feature.tpl';

//$submit = $fwRequest->getParam('subAddDetail', '');

  $group = array_keys($_SESSION['user']['::groups::']);
  $fwViewData['group'] = $group[0];

$thisTable = new Fw_Db_Table("design_interface_keyfeatures");

$fwViewData['feature'] = $thisTable->getAllRows(); 

