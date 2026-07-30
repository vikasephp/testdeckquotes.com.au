 <?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    if (!empty($postedData['action']) &&  $postedData['action'] == 'update_bsn_projecttype') {
        $record_id = $postedData['r_ID'];
        $project_type     = $postedData['project_type'];
        if (!empty($record_id)) {
            $tablebar = new Fw_Db_Table('business');
            $update_data['project_type'] = $project_type;
            $tablebar->setWhere("bsn_id = " . $record_id);
            $result = $tablebar->updateRow($update_data);

            $matsql = "SELECT  business.bsn_id,business.project_type, business.bsn_name from business where bsn_id = " . $record_id;

            if ($matsql) {
                $userData = $fwDb->query($matsql);

                foreach ($userData as $k => $v) {
                    $project_type = trim($v['project_type']);
                    $bsn_name = trim($v['bsn_name']);
                    $bsn_name_arr = explode("-", $bsn_name);
                    if (!empty($project_type)) {
                        if (count($bsn_name_arr) >= 2) {
                            $userData[$k]['bsn_name'] = $project_type . " - " . $bsn_name_arr[1];
                        } else {
                            $userData[$k]['bsn_name'] = $project_type . " - " . $bsn_name;
                        }
                    }
                }
            }

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, "user_data" => $userData, 'data' => []];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'update_mergeplan_date', 'data' => []];
        }
    }

    if (!empty($postedData['action']) &&  $postedData['action'] == 'update_checklist_on_off') {
        $record_id = $postedData['r_ID'];
        $activeStatus     = $postedData['activeStatus'];
        if (!empty($record_id)) {
            $tablebar = new Fw_Db_Table('document_proposal_name');
            $update_data['checklist_status'] = $activeStatus;
            $update_data['dpn_uid_enabler_name'] = $activeStatus == 1 ? $_SESSION['user']['user_name'] : '';
            $update_data['dpn_uid_enable_time'] = $activeStatus == 1 ? date('Y-m-d') : '';
            $tablebar->setWhere("dpn_id = " . $record_id);
            $result = $tablebar->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => []];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'update_checklist_on_off', 'data' => []];
        }
    }

    if (!empty($postedData['action']) &&  $postedData['action'] == 'update_checklist_reno_on_off') {
        $record_id = $postedData['r_ID'];
        $activeStatus     = $postedData['activeStatus'];
        if (!empty($record_id)) {
            $tablebar = new Fw_Db_Table('document_renovation_name');
            $update_data['checklist_status'] = $activeStatus;
            $update_data['dpn_uid_enabler_name'] = $activeStatus == 1 ? $_SESSION['user']['user_name'] : '';
            $update_data['dpn_uid_enable_time'] = $activeStatus == 1 ? date('Y-m-d') : '';
            $tablebar->setWhere("dpn_id = " . $record_id);
            $result = $tablebar->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => []];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'update_checklist_reno_on_off', 'data' => []];
        }
    }

    if (!empty($postedData['action']) &&  $postedData['action'] == 'project_display_toggle') {
        $record_id = $postedData['r_ID'];
        $activeStatus     = $postedData['activeStatus'];
        if (!empty($record_id)) {
            $tablebar = new Fw_Db_Table('business');
            $update_data['bsn_dpcr_hide'] = $activeStatus;
			$update_data['bsn_dpcr_hide_username'] = $activeStatus == 1 ? $_SESSION['user']['user_name'] : '';
            $update_data['bsn_dpcr_hide_date'] = $activeStatus == 1 ? date('Y-m-d') : '';
            $tablebar->setWhere("bsn_id = " . $record_id);
            $result = $tablebar->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => []];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'project_display_toggle', 'data' => []];
        }
    }

    if (!empty($postedData['action']) &&  $postedData['action'] == 'project_phase_toggle') {
        $record_id = $postedData['r_ID'];
        $column = $postedData['column'];
        $flag = $postedData['flag'];
        if (!empty($record_id)) {
            $tablebar = new Fw_Db_Table('business');
            $update_data[$column] = $flag;
            $tablebar->setWhere("bsn_id = " . $record_id);
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

    echo json_encode($response);
    exit;