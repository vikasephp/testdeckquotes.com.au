<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'addWhereWeAreAt') {
        $pbnsr_checklist = $postedData['pbnsr_checklist'];
        $pbnsr_bsn_id = $postedData['pbnsr_bsn_id'];
        $pbnsr_changes = $postedData['pbnsr_changes'];
        if (!empty($pbnsr_checklist) && !empty($pbnsr_bsn_id) && !empty($pbnsr_changes)) {
            $table = new Fw_Db_Table('pbnsr_where_we_are_at');
            $insertData = [
                'pbnsr_checklist' => $pbnsr_checklist,
                'pbnsr_bsn_id' => $pbnsr_bsn_id,
                'pbnsr_changes' => $pbnsr_changes,
                'pbnsr_changed_user_id' => $_SESSION['user']['user_id'],
                'pbnsr_changed_date' => date('Y-m-d H:i:s')
            ];
            $result = $table->insertRow($insertData);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => $insertData];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => false, 'stage' => "else T", 'action' => 'displayToggle', 'data' => []];
        }
    }

    echo json_encode($response);
    exit;