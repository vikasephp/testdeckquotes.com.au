<?php

$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$wa_wlea_id = (int)$fwRequest->getparam('wa_wlea_id', 0);

$date = date('Y-m-d');
$user_id  = $_SESSION['user']['user_id'];

if ($wa_id > 0) {
    $sql = "UPDATE warranty_log SET wa_wlea_id = $wa_wlea_id, wa_wlea_by = $user_id, wa_wlea_at = '$date' WHERE wa_id = $wa_id;";
    $fwDb->queryOne($sql);
}

exit;
