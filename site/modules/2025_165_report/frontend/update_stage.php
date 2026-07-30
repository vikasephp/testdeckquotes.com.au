<?php

$id = $fwRequest->getParam('os2_id', '');
$value = $fwRequest->getparam('value', '');

if ($value != '') {
	$sql = "UPDATE 2025_165_report SET os2_stage = " . $value . " WHERE os2_id = " . $id;
	$fwDb->queryOne($sql);
}

exit;
