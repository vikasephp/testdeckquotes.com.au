<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateRecord') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        if (!empty($primaryID) && in_array($column, ['wa_wlwd_id'])) {
            $tablebar = new Fw_Db_Table($TABLE);
            $update_data[$column] = $value;
			$update_data['wa_wlwd_user'] = $_SESSION['user']['user_name'];
			$update_data['wa_wlwd_date'] = date('d-m-Y');
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