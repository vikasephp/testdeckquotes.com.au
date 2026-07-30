<?php
$fwMainView = 'file:' . getcwd() . '/view_slug.tpl';
$docqa_id = (int)$fwRequest->getParam('docqa_id', 0);

$sql = "SELECT docqa_slug from dual_occupancy_canberra_qanda where docqa_id = ".$docqa_id;
$data = $fwDb->queryOne($sql);

$fwViewData['docqa_id'] = $docqa_id;
$fwViewData['data'] = $data['docqa_slug']; 