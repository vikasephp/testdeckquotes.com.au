<?php
$fwMainView = 'file:' . getcwd() . '/view_options.tpl';

$tm_id = $fwRequest->getParam('tm_id', '');

//$keyword = $listdata['keyword'];

$fwViewData['tm_id'] = $tm_id;
$_SESSION['tm_id'] = $tm_id;

$sql_1 = "Select * from type_options where to_type_id  = ". $tm_id;

$optionsdata = $fwDb->query($sql_1);
$fwViewData['optionsdata'] =  $optionsdata;

