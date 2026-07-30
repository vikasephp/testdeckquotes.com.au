<?php

$q = trim($_REQUEST['q'] ?? '');

if (strlen($q) >= 2) {
    $sql = "SELECT bsn_address, bsn_id FROM business WHERE bsn_address LIKE '%" . addslashes($q) . "%' LIMIT 50";
    $rows = $fwDb->query($sql);

    $result = [];
    foreach ($rows as $r) {
        $result[] = ['address' => $r['bsn_address'], 'bsn_id' => $r['bsn_id']];
    }

    echo json_encode($result);
    exit;
}

echo json_encode([]);
exit;
