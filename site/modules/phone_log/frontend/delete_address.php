<?php

$ph_id = (int)$fwRequest->getparam('ph_id', 0);
//$ph_id = intval($_POST['ph_id'] ?? 0);
//$ph_bsn_id = intval($_POST['ph_bsn_id'] ?? 0);

if ($ph_id) {
    $sql = "UPDATE phone_log SET ph_bsn_id = 0 WHERE ph_id = $ph_id";
    $fwDb->queryOne($sql);
}

Location(BASE_URL . "phone_log.home");
exit;