<?php

$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');

if (in_array($value, ['', 'Yes', 'No'])) {
    $sql = "UPDATE warranty_log SET wa_inspection_required = '$value' WHERE wa_id = $id;";
    $fwDb->queryOne($sql);
}

exit;
