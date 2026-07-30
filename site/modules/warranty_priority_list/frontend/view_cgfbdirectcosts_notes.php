<?php
$fwMainView = 'file:' . getcwd() . '/view_cgfbdirectcosts_notes.tpl';

$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id'] = $wa_id;

$sql = "SELECT * FROM `warranty_log_cgfbdirectcosts_notes` where cdcn_wa_id =  ". $wa_id ." Order by cdcn_added_date DESC";
$result = $fwDb->query($sql);
$fwViewData['typedata'] = $result;