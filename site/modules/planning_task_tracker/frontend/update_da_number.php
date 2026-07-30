<?php

$bsn_id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

if (!empty($bsn_id)) {
    $sql = "UPDATE business SET bsn_da_number = '" . $value . "' WHERE bsn_id = " . $bsn_id;
    $fwDb->queryOne($sql);
}
