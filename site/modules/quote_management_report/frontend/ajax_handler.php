<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateRecord') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        if (!empty($primaryID)) {
            $tablebar = new Fw_Db_Table($TABLE);
            $update_data[$column] = $value;

            $tablebar->setWhere($ID . " = " . $primaryID);
            $result = $tablebar->updateRow($update_data);

            if ($result) {
                $log_table = new Fw_Db_Table('quote_management_report_status_log'); 
                $log_table->insertRow([
                    'qmrsl_qm_id' => $primaryID,
                    'qmrsl_qmrs_id' => $value,
                    'qmrsl_user_id' => $_SESSION['user']['user_id'],
                ]);
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => $update_data];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'displayToggle', 'data' => []];
        }
    }

    if (!empty($postedData['action']) &&  $postedData['action'] == 'displayToggle') {
        $dm_id = $postedData['r_ID'];
        $activeStatus     = $postedData['activeStatus'];
        if (!empty($dm_id)) {
            $tablebar = new Fw_Db_Table($TABLE);
            $update_data['ldd_hide'] = $activeStatus;
            $tablebar->setWhere($ID . " = " . $dm_id);
            $result = $tablebar->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => []];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'displayToggle', 'data' => []];
        }
    }

    echo json_encode($response);
    exit;