<?php
$fwMainView = 'file:' . getcwd() . '/view_logs.tpl';
$serviceObj = new ServiceClass;
require_once(MODULES_DIR . 'inspection_warranty_log/frontend/InspectionServiceClass.php');
$inspectionServiceClass = new InspectionServiceClass;

$bsn_id = $fwRequest->getParam('bsn_id', 0);
$update_wa_inspection_acknowledgement_statement = $fwRequest->getParam('update_wa_inspection_acknowledgement_statement', '');

$error_wa_inspection_acknowledgement_statement = '';
if($update_wa_inspection_acknowledgement_statement != '' && ($wa_id = $fwRequest->getParam('wa_id', 0)) && !empty($_FILES['wa_inspection_acknowledgement_statement']['name'])) {
    try {
        $docfile_1 = $_FILES['wa_inspection_acknowledgement_statement']['name'];
        $docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
        $temp_name_1 = $_FILES['wa_inspection_acknowledgement_statement']['tmp_name'];
        $fileUploaded = upload($docfile_1, $temp_name_1, 'inspection_warranty_log.acknowledgement_statement');
        if($fileUploaded) {
            $record['wa_inspection_acknowledgement_statement'] = $docfile_1;
            $this_table = new Fw_Db_Table('warranty_log');
            $this_table->setWhere('wa_id = ' . $wa_id);
            $res = $this_table->updateRow($record);
        }
        else {
            $error_wa_inspection_acknowledgement_statement = 'Problem coming while uploading';
        }
    } catch (\Throwable $th) {
        $error_wa_inspection_acknowledgement_statement = $th->getMessage();
    }    
}
$fwViewData['error_wa_inspection_acknowledgement_statement'] = $error_wa_inspection_acknowledgement_statement;

$query = 'SELECT * FROM users';
$result = $fwDb->query($query);
$users_array = [];
foreach($result as $row) {
    $users_array[$row['user_id']] = $row['user_name'];
}

$query = $serviceObj->getLogsByBsnIdQuery($bsn_id);
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

    $wa_is_inspection_fee_required_user = $wa_is_inspection_fee_required_date = '';
    if(isset($users_array[$row['wa_is_inspection_fee_required_by']])) {
        $wa_is_inspection_fee_required_user = $users_array[$row['wa_is_inspection_fee_required_by']];
        $wa_is_inspection_fee_required_date = date('d-M-Y', strtotime($row['wa_is_inspection_fee_required_at']));
    }
    $records[$index]['wa_is_inspection_fee_required_user'] = $wa_is_inspection_fee_required_user;
    $records[$index]['wa_is_inspection_fee_required_date'] = $wa_is_inspection_fee_required_date;

    $wa_is_inspection_fee_required_accepted_date = '';
    if($row['wa_is_inspection_fee_required_accepted']) {
        $wa_is_inspection_fee_required_accepted_date = date('d-M-Y', strtotime($row['wa_is_inspection_fee_required_accepted_at']));
    }
    $records[$index]['wa_is_inspection_fee_required_accepted_date'] = $wa_is_inspection_fee_required_accepted_date;

    $wa_is_inspection_fee_required_cancelled_date = '';
    if($row['wa_is_inspection_fee_required_cancelled']) {
        $wa_is_inspection_fee_required_cancelled_date = date('d-M-Y', strtotime($row['wa_is_inspection_fee_required_cancelled_at']));
    }
    $records[$index]['wa_is_inspection_fee_required_cancelled_date'] = $wa_is_inspection_fee_required_cancelled_date;

    if(strtotime($row['bs_warranty_last_login_date']) > 0) {
        $records[$index]['last_login_date'] = date('d-M-Y', strtotime($row['bs_warranty_last_login_date']));
    }

    $wa_is_inspection_fee_required_scheduled_at = '';
    if(strtotime($row['wa_is_inspection_fee_required_scheduled_at']) > 0) {
        $wa_is_inspection_fee_required_scheduled_at = date('d-M-Y', strtotime($row['wa_is_inspection_fee_required_scheduled_at']));
    }
    $records[$index]['wa_is_inspection_fee_required_scheduled_at'] = $wa_is_inspection_fee_required_scheduled_at;

    if(strtotime($row['wa_is_inspection_fee_required_scheduled_date']) > 0) {
        $records[$index]['wa_is_inspection_fee_required_scheduled_date'] = date('d-M-Y', strtotime($row['wa_is_inspection_fee_required_scheduled_date']));
    }
    $records[$index]['inspection_schedule'] = setInspectionDatetime($row);

    $wa_is_inspection_fee_required_status_update_at = '';
    if(strtotime($row['wa_is_inspection_fee_required_status_update_at']) > 0) {
        $wa_is_inspection_fee_required_status_update_at = date('d-M-Y', strtotime($row['wa_is_inspection_fee_required_status_update_at']));
    }
    $records[$index]['wa_is_inspection_fee_required_status_update_at'] = $wa_is_inspection_fee_required_status_update_at;

    $records[$index]['status_history_table'] = $inspectionServiceClass->createStatusHistoryTable($row);
    // db($row);
    // db(setInspectionDatetime($row));
    $wa_inspection_type = 'Complimentary';
    if($row['wa_inspection_proposed_fees'] == 75) {
        $wa_inspection_type = '$75';
    }
    $records[$index]['wa_inspection_type'] = $wa_inspection_type;
}
$fwViewData['list'] = $records;
$fwViewData['bsn_id'] = $bsn_id;


