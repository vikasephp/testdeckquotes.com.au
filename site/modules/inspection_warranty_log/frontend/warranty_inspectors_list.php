<?php
$fwMainView = 'file:' . getcwd() . '/warranty_inspectors_list.tpl';

$wi_is_active = $fwRequest->getParam('wi_is_active', '');
if ($wi_is_active) {
    $keys = array_keys($wi_is_active);
	$id = $keys[0];
	$value = $wi_is_active[$id];

    $query = 'UPDATE warranty_inspectors SET wi_is_active = ' . $value . ' WHERE wi_id = ' . $id . ';';
    $fwDb->queryOne($query);
    // db($query); exit;
}

$query = 'SELECT * FROM warranty_inspectors';
$result = $fwDb->query($query);
$fwViewData['list'] = $result;
