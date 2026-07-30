<?php
$fwMainView = 'file:' . getcwd() . '/completed_inspection_view.tpl';
$serviceObj = new ServiceClass;
require_once(MODULES_DIR . 'inspection_warranty_log/frontend/InspectionServiceClass.php');
$inspectionServiceClass = new InspectionServiceClass;

$wa_status = $fwRequest->getParam('wa_status', '');
if ($wa_status) {
	$keys_2 = array_keys($wa_status);
	$ky_2 = $keys_2[0];
	$val_2 = $wa_status[$ky_2];

	$detail['wa_status'] = $val_2;
    $warrantyTable = new Fw_Db_Table('warranty_log');
	$warrantyTable->setWhere("wa_id = " . $ky_2);
	if ($warrantyTable->rowExists()) {
        // db($ky_2);
        // db($val_2); die();
		$warrantyTable->updateRow([
            'wa_status' => $val_2
        ]);
	}
}

$bsn_id = $fwRequest->getParam('bsn_id', 0);

$query = $inspectionServiceClass->getCompletedInspectionQuery();
$records = $fwDb->query($query);
$wa_id_array = [];
foreach($records as $row) {
    $wa_id_array[] = $row['wa_id'];
}

$query = 'SELECT * FROM warranty_log_inspectors AS WLI INNER JOIN warranty_inspectors AS WI ON WI.wi_id = WLI.wli_wi_id WHERE WLI.wli_wa_id IN (' . implode(',', $wa_id_array) . ');';
$result = $fwDb->query($query);
$warranty_log_inspectors = [];
foreach($result as $row) {
    if(!isset($warranty_log_inspectors[$row['wli_wa_id']])) {
        $warranty_log_inspectors[$row['wli_wa_id']] = [];
    }
	$warranty_log_inspectors[$row['wli_wa_id']][] = ($row['wi_name'] . ' (' . $row['wi_email'] . ')');
}
$fwViewData['warranty_log_inspectors'] = $warranty_log_inspectors;


foreach($records as $index => $row) {
    $wli = '';
    if(isset($warranty_log_inspectors[$row['wa_id']])) {
        $wli = implode('<br>', $warranty_log_inspectors[$row['wa_id']]);
    }
    $records[$index]['warranty_log_inspectors'] = $wli;

    $records[$index]['wa_is_inspection_fee_required_completed_date'] = date('d-M-Y', strtotime($row['wa_is_inspection_fee_required_inspection_completed_at']));

    $wa_inspection_type = 'Complimentary';
    if($row['wa_inspection_proposed_fees'] == 75) {
        $wa_inspection_type = '$75';
    }
    $records[$index]['wa_inspection_type'] = $wa_inspection_type;
}
$fwViewData['list'] = $records;
$fwViewData['bsn_id'] = $bsn_id;


