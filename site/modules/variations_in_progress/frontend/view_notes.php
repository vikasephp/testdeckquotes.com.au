<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$id = (int)$fwRequest->getParam('vipn_va_id', 0);

$query = "SELECT * FROM variations_in_progress_notes where vipn_va_id = $id Order by vipn_added_date desc";
$result = $fwDb->query($query);

$fwViewData['data'] = $result;
$fwViewData['vipn_va_id'] = $id;