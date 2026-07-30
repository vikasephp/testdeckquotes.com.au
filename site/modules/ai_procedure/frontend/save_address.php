<?php

$ph_id = intval($_POST['ph_id'] ?? 0);
$ph_bsn_id = intval($_POST['ph_bsn_id'] ?? 0);

if ($ph_id && $ph_bsn_id) {
    $sql = "UPDATE phone_log SET ph_bsn_id = $ph_bsn_id WHERE ph_id = $ph_id";
    $fwDb->query($sql);
}

exit;