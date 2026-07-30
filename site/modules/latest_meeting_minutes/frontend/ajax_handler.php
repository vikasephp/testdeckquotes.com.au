<?php
$postedData = $_POST;
$response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
if (!empty($postedData['action']) &&  $postedData['action'] == 'update_meetingminute_date') {
    $record_id = $postedData['r_ID'];
    $date     = $postedData['date'];
    if (!empty($record_id) && !empty($date)) {
        $tablebar = new Fw_Db_Table('last_meeting_minutes');
        $update_data['lmm_doc_date_uploaded'] = date("d-m-Y", strtotime($date));
        $tablebar->setWhere("lmm_id = " . $record_id);
        $result = $tablebar->updateRow($update_data);

        if ($result) {
            $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => []];
        } else {
            $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
        }
    } else {
        $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'update_meetingminute_date', 'data' => []];
    }
}

echo json_encode($response);
exit;
