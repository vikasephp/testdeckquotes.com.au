<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateBusinessSellers') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        $allowedColumns = ['bs_planning_login_flag', 'bs_calendar_login_flag', 'bs_alert_login_flag', 'bs_warranty_login_flag'];
        if (!empty($primaryID) && in_array($column, $allowedColumns)) {
            $table = new Fw_Db_Table('business_sellers');
            $update_data[$column] = $value;
            $table->setWhere('bs_id = ' . $primaryID);
            $result = $table->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => $update_data];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        }
    }
    elseif (!empty($postedData['action']) &&  $postedData['action'] == 'toggleLogin') {
        $bcust_id = $postedData['bcust_id'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        $allowedColumns = ['bs_planning_login_flag', 'bs_calendar_login_flag', 'bs_alert_login_flag', 'bs_warranty_login_flag'];
        if (!empty($bcust_id) && in_array($column, $allowedColumns)) {
            $table = new Fw_Db_Table('business_sellers');
            $update_data[$column] = $value;
            $table->setWhere('bs_customers_id = ' . $bcust_id);
            $result = $table->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => $update_data];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        }
    }
    
    echo json_encode($response);
    exit;