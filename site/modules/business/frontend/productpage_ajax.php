<?php
    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateRecord') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        $allowedColumns = ['pi_is_visible', 'pi_is_cgfb_supplied', 'pi_is_checked', 'pi_warranty_expired_at', 'pi_installed_at'];
        if (!empty($primaryID) && in_array($column, $allowedColumns)) {
            $table = new Fw_Db_Table('project_item');
            $update_data[$column] = $value;
            if($column == 'pi_installed_at' || $column == 'pi_warranty_expired_at') {
				if (!empty($update_data[$column])) {
					$update_data[$column] = date('Y-m-d', strtotime($update_data[$column]));
				} else {
					$update_data[$column] = null;
				}
                //$update_data[$column] = date('Y-m-d', strtotime($update_data[$column]));
            }
            $table->setWhere('pi_id = ' . $primaryID);
            $result = $table->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => $update_data];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => $update_data];
            }
        }
    }
    
    echo json_encode($response);
    exit;