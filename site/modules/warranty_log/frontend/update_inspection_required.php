<?php

$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');

if (in_array($value, ['', 'Yes', 'No'])) {
    $sql = "UPDATE warranty_log SET wa_inspection_required = '$value' WHERE wa_id = $id;";
    $fwDb->queryOne($sql);

    // $wa_wlis_id = 0;
    // if($value == 'Yes') {
    //     $wa_wlis_id = 1;
    // }
    // $sql = "UPDATE warranty_log SET wa_inspection_required = '$value', wa_wlis_id = $wa_wlis_id WHERE wa_id = $id;";
    // $fwDb->queryOne($sql);

    // $sql = 'INSERT INTO warranty_log_inspection_status_log(wlisl_wlis_id,wlisl_created_by,wlisl_created_table) VALUES(' . $wa_wlis_id . ',' . $_SESSION['user']['user_id'] . ', "users")';
    // $fwDb->queryOne($sql);

    // $query = 'SELECT B.bsn_id, BC.bcust_id FROM business AS B INNER JOIN warranty_log AS WL ON WL.wa_project = B.bsn_name INNER JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE WL.wa_id = ' . $id . ';';
    // $result = $fwDb->queryOne($query);
    // $bsn_id = $result['bsn_id'] ?? 0;
    // $bcust_id = $result['bcust_id'] ?? 0;

    // if($bsn_id > 0 && $bcust_id > 0) {
    //     $serviceClass = new ServiceClass;
    //     if($value == 'Yes') {
    //         $serviceClass->findOrCreateInspectionRecord([
    //             'wa_id' => $id,
    //             'bsn_id' => $bsn_id,
    //             'bcust_id' => $bcust_id,
    //         ]);
    //     }
    //     elseif($value == 'No') {
    //         $serviceClass->deleteInspectionRecord([
    //             'wa_id' => $id,
    //         ]);
    //     }
    // }    
}

exit;
