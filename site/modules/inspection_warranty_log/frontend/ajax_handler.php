<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateRecord') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        $allowedColumn = ['wa_wlis_id', 'wa_inspection_acknowledgement_statement', 'wa_inspection_proposed_fees'];
        if (!empty($primaryID) && in_array($column, $allowedColumn)) {
            // if($column == 'ldd_type_id'){
            //     $value = implode(',', json_decode($value));
            //     // db($value);
            // }
            $tablebar = new Fw_Db_Table('warranty_log');
            $update_data[$column] = $value;
            $tablebar->setWhere("wa_id = " . $primaryID);
            $result = $tablebar->updateRow($update_data);

            if($column == 'wa_wlis_id') {
                $sql = 'INSERT INTO warranty_log_inspection_status_log(wlisl_wlis_id,wlisl_created_by,wlisl_created_table) VALUES(' . $value . ',' . $_SESSION['user']['user_id'] . ', "users")';
                $fwDb->queryOne($sql);
            }

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => []];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'updateRecord', 'data' => []];
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