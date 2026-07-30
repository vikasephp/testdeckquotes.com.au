<?php

$fwMainView = 'file:' . getcwd() . '/view_position_explained.tpl';
$p_id = (int)$fwRequest->getParam('p_id', 0);
$fwViewData['p_id'] = $p_id;

$query = "SELECT * FROM `positions` where p_id = ".$p_id;
$result = $fwDb->query($query);

$fwViewData['data'] = $result;