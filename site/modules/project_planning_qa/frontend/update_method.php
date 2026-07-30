<?php
$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20', ' ', $value);
$sql = "UPDATE business_qa SET bqa_method  = '" . $value . "' where bqa_id = " . $id;
$fwDb->queryOne($sql);
exit;
