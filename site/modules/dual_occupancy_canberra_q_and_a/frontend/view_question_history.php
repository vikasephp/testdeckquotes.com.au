<?php
$fwMainView = 'file:' . getcwd() . '/view_question_history.tpl';
$docqa_id = (int)$fwRequest->getParam('docqa_id', 0);

$sql = "SELECT * from dual_occupancy_canberra_question_history where docqh_docqa_id = ".$docqa_id ." order by docqh_id desc ";
$data = $fwDb->query($sql);

$fwViewData['docqa_id'] = $docqa_id;
$fwViewData['data'] = $data; 