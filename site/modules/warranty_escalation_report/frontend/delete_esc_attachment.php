<?php

$elsn_id = (int)$fwRequest->getparam('elsn_id', 0);
$attach_1 = (int)$fwRequest->getparam('attach_1', 0);
$attach_2 = (int)$fwRequest->getparam('attach_2', 0);
$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id'] = $wa_id;

if ($elsn_id && $attach_1) {
    $sql = "UPDATE warranty_log_escalation_notes SET elsn_attachment_1 = '' WHERE elsn_id = $elsn_id";
    $fwDb->queryOne($sql);
}

if ($elsn_id && $attach_2) {
    $sql = "UPDATE warranty_log_escalation_notes SET elsn_attachment_2 = '' WHERE elsn_id = $elsn_id";
    $fwDb->queryOne($sql);
}

Location(BASE_URL . "warranty_escalation_report.add_esc_notes/elsn_id/".$elsn_id."/wa_id/".$wa_id);
exit;