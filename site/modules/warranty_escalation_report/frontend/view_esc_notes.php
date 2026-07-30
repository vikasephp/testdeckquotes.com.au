<?php
$fwMainView = 'file:' . getcwd() . '/view_esc_notes.tpl';
$wa_id = (int)$fwRequest->getParam('wa_id', 0);

$sql = "SELECT warranty_log_escalation_notes.*, users.user_name FROM `warranty_log_escalation_notes` Left JOIN users on warranty_log_escalation_notes.elsn_created_by = users.user_id where warranty_log_escalation_notes.elsn_wa_id = ".$wa_id ." order by warranty_log_escalation_notes.elsn_created_at desc ";
$data = $fwDb->query($sql);

$fwViewData['wa_id'] = $wa_id;
$fwViewData['data'] = $data; 