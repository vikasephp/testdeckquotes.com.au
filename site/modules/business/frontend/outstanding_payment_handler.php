<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    if (!empty($postedData['action']) &&  $postedData['action'] == 'outstandingToggle') {
        $record_id = $postedData['r_ID'];
        $column = $postedData['column'];
        $flag = $postedData['flag'];
        if (!empty($record_id)) {
            $tablebar = new Fw_Db_Table('business');
            $update_data[$column] = $flag;
            $tablebar->setWhere("bsn_id = " . $record_id);
            $result = $tablebar->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => []];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'outstandingToggle', 'data' => []];
        }
    }
    echo json_encode($response);
    exit;