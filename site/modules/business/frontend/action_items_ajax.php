<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateSalesAction') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        if (!empty($primaryID)) {
            $table = new Fw_Db_Table('sales_action_items');
            $update_data[$column] = $value;
            $table->setWhere('sai_id = ' . $primaryID);
            $result = $table->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => $update_data];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        }
    }

    if (!empty($postedData['action']) && $postedData['action'] == 'updateShowOnPortal') {
        $sai_id = (int) $postedData['sai_id'];
        $sai_show_on_portal = ((int) $postedData['sai_show_on_portal'] === 1) ? 1 : 0;
        if ($sai_id > 0) {
            $table = new Fw_Db_Table('sales_action_items');
            $update_data = ['sai_show_on_portal' => $sai_show_on_portal];
            $table->setWhere('sai_id = ' . $sai_id);
            $result = $table->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'success' => true, 'data' => $update_data];
            } else {
                $response = ['status' => false, 'errorList' => [], 'success' => false, 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => false, 'data' => []];
        }
    }
    
    echo json_encode($response);
    exit;