<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateRecord') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        
        if (!empty($primaryID) && in_array($column, ['ps_stage', 'ps_auction_date'])) {
            $tablebar = new Fw_Db_Table($TABLE);
            if($column == 'ps_auction_date') {
                $value = date('Y-m-d', strtotime($value));
            }
            $update_data[$column] = $value;
            $tablebar->setWhere($ID . " = " . $primaryID);
            $result = $tablebar->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => []];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'updateRecord', 'data' => []];
        }
    }

    echo json_encode($response);
    exit;