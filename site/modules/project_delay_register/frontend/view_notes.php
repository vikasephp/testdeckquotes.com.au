<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$docqa_id = (int)$fwRequest->getParam('docqa_id', 0);

$sql = "SELECT dual_occupancy_notes.*, users.user_name FROM `dual_occupancy_notes` Left JOIN users on dual_occupancy_notes.doc_created_by = users.user_id where dual_occupancy_notes.doc_docqa_id = ".$docqa_id ." order by dual_occupancy_notes.doc_created_at desc ";
$data = $fwDb->query($sql);

$fwViewData['docqa_id'] = $docqa_id;
$fwViewData['data'] = $data; 