<?php
$fwMainView = 'file:' . getcwd() . '/view_reason.tpl';
$elccn_row_id = (int)$fwRequest->getParam('elccn_row_id', 0);

$sql = "SELECT event_log_clearing_center_notes.*, users.user_name FROM `event_log_clearing_center_notes` Left JOIN users on event_log_clearing_center_notes.elccn_created_by = users.user_id where event_log_clearing_center_notes.elccn_row_id = ".$elccn_row_id ." order by event_log_clearing_center_notes.elccn_created_at desc ";
$data = $fwDb->query($sql);

$fwViewData['elccn_row_id'] = $elccn_row_id;
$fwViewData['data'] = $data; 