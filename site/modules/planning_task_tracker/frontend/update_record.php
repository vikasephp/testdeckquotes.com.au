<?php

$bsn_id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$col = $fwRequest->getparam('col', '');

if (!empty($bsn_id) && !empty($col)) {
    db($bsn_id);
    db($value);
    db($col);
    // $value = addslashes($value);
    $sql = "UPDATE business SET `$col` = '$value' WHERE bsn_id = $bsn_id";
    db($sql);
    $fwDb->queryOne($sql);
}
exit;
