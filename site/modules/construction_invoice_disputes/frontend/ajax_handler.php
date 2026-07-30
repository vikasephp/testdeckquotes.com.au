<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateRecord') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        /* if($column == 'ldd_type_id'){
            db($postedData);
            db($primaryID);
            db($value);
            db(implode(',', json_decode($value)));
            exit;
            $value = implode(',', json_decode($value));
        } */
        if (!empty($primaryID)) {
            if($column == 'ldd_type_id'){
                $value = implode(',', json_decode($value));
                // db($value);
            }
            elseif($column == 'ldd_status_id') {
                $update_data['ldd_hide'] = $value == '2' ? 1 : 0;
            }
            $tablebar = new Fw_Db_Table($TABLE);
            $update_data[$column] = $value;
            if($update_data['ldd_email_date']){
                $update_data['ldd_email_date'] = date('Y-m-d', strtotime($update_data['ldd_email_date']));
            }
            $tablebar->setWhere($ID . " = " . $primaryID);
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