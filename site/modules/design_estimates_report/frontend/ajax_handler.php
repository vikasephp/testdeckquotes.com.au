<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateNextMeeting') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        if (!empty($primaryID)) {
            $table = new Fw_Db_Table('document_proposal_name');
            $update_data[$column] = $value;
            // if($update_data['dpn_dr_next_date']){
            //     $update_data['dpn_dr_next_date'] = date('Y-m-d', strtotime($update_data['dpn_dr_next_date']));
            // }
            $table->setWhere('dpn_bsn_id=' . $primaryID);
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