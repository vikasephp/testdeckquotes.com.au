 <?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    if (!empty($postedData['action']) &&  $postedData['action'] == 'update_proposal_alert') {
        $record_id = $postedData['r_ID'];
        $column = $postedData['column'];
        $flag = $postedData['flag'];
        if (!empty($record_id)) {
            $tablebar = new Fw_Db_Table('proposal_alert');
            $update_data[$column] = $flag;
            $tablebar->setWhere("be_id = " . $record_id);
            $result = $tablebar->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => []];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'project_phase_toggle', 'data' => []];
        }
    }
    if (!empty($postedData['action']) &&  $postedData['action'] == 'update_document_checklist') {
        $this_id = $postedData['this_id'];
        $key = $postedData['key'];
        $value = $postedData['value'];
        if (!empty($this_id)) {
            if(in_array($key, ['doc_qr_code', 'doc_quality_checked'])) {
                $this_table = new Fw_Db_Table('document_check_list');
                $message = '';
                /* if($key == 'doc_qr_code') {
                    $update_data[$key] = 0;
                    if($value == 'true') {
                        $update_data[$key] = 1;
                        $message .= '<p>' . $_SESSION['user']['user_name'] . '</p>'; 
                        $message .= '<p>' . date('d-M-Y') . '</p>'; 
                    }
                    $update_data['doc_qr_code_by'] = $_SESSION['user']['user_id'];
                    $update_data['doc_qr_code_at'] = date('Y-m-d');
                }
                else */if($key == 'doc_quality_checked') {
                    $update_data[$key] = 0;
                    if($value == 'true') {
                        $update_data[$key] = 1;
                        $message .= '<p>' . $_SESSION['user']['user_name'] . '</p>'; 
                        $message .= '<p>' . date('d-M-Y') . '</p>'; 
                    }
                    $update_data['doc_quality_checked_by'] = $_SESSION['user']['user_id'];
                    $update_data['doc_quality_checked_at'] = date('Y-m-d');
                }
                $this_table->setWhere("doc_id = " . $this_id);
                $result = $this_table->updateRow($update_data);
                if ($result) {
                    $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'message' => $message];
                } else {
                    $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
                }
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'project_phase_toggle', 'data' => []];
        }
    }
    echo json_encode($response);
    exit;
