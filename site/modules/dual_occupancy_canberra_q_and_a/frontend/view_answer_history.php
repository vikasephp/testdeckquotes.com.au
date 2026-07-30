<?php
$fwMainView = 'file:' . getcwd() . '/view_answer_history.tpl';
$docqa_id = (int)$fwRequest->getParam('docqa_id', 0);

$sql = "SELECT * from dual_occupancy_canberra_answer_history where docah_docqa_id = ".$docqa_id ." order by docah_id desc ";
$data = $fwDb->query($sql);

$fwViewData['docqa_id'] = $docqa_id;
$fwViewData['data'] = $data; 