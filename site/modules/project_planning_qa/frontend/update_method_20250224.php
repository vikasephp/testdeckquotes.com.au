<?php
$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20', ' ', $value);
$sql = "Update planning_approval_enquiries set  method  = '" . $value . "' where id = " . $id;
$fwDb->queryOne($sql);
exit;
