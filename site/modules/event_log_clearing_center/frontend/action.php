<?php
header('Content-Type: application/json');

if (isset($_POST['action']) && $_POST['action'] == 'sync_row') {
    
    $user_name = $_SESSION['user']['user_username'];
    $elcc_row_id = $_POST['elcc_row_id'];
    $status_to_set = $_POST['status_to_set'];
    $updated_date = date("Y-m-d H:i:s");
	$bsn_id = $_POST['bsn_id'];
	$emailReceive = $_POST['emailReceive'];

    if ($elcc_row_id != '') {
        $checkSql = "SELECT elcc_row_id FROM event_log_clearing_center WHERE elcc_row_id = " . $elcc_row_id;
        $existing = $fwDb->query($checkSql); 
        
        $tableTask = new Fw_Db_Table('event_log_clearing_center');
        
        $detail = array();
        $detail['elcc_sync_status'] = $status_to_set;
        $detail['elcc_sync_updated_by'] = $user_name;
        $detail['elcc_sync_updated_date'] = $updated_date;

        if (!empty($existing)) {
            $tableTask->setWhere("elcc_row_id = $elcc_row_id");
            $opr = $tableTask->updateRow($detail);   
			$action_performed = "updated";
        }
        else
        {
            $detail['elcc_row_id'] = $elcc_row_id;
            $detail['elcc_reason'] = ''; 
            $opr = $tableTask->insertRow($detail);  
			$action_performed = "insert";
        } 

        if ($opr) {
			
			if (!empty($bsn_id) && $emailReceive === '1' && (int)$detail['elcc_sync_status'] === 1 ){
				require_once LIB_DIR . 'EmailClass.php';

				$query = "SELECT b.bsn_id, b.bsn_address, CONCAT(bc.bcust_fname, ' ', bc.bcust_lname) AS customer_name, bc.bcust_misc_email1 AS customer_email FROM `business` b JOIN `business_sellers` bs ON bs.bs_business_id = b.bsn_id JOIN `bus_customers` bc ON bc.bcust_id = bs.bs_customers_id WHERE b.bsn_id = ".$bsn_id;
				$results = $fwDb->query($query);
				
				$log_bsn = $results[0]['bsn_id'];;

				$customerProject = $results[0]['bsn_address'];
				$customerName = $results[0]['customer_name'];
				$customerEmail = $results[0]['customer_email'];

				if(!empty($customerEmail)) {
					$html = '';
					$html .= '<p>Hi ' . $customerName . ',</p>';
					$html .= '<p>I hope you are well.</p>';
					$html .= '<p>We would like to inform you that there has been an update to the construction schedule.</p>';
					$html .= '<p>You can view the full details of the changes via the link below:</p>';
					$html .= '<p><strong>Construction Calendar Link:</strong> <a href="https://constructioncalendar.com.au/eventchangelog/'.$log_bsn.'" target="_blank">Portal Link</a> </p>';
					$html .= '<p>Please log in using your registered contact number and email address. Once logged in, you will be able to view the details in the event change log.</p>';
					$html .= '<p>If you have any questions or require further clarification, please feel free to reach out.</p>';

					$html .= '<p>Kind regards,<br>Construction Team</p>';

					$emailObj = new EmailClass;
					$emailObj->addFrom('construction@cgfb.com.au ', 'Construction Team');
					
					$emailObj->subject = $customerProject." - Construction Schedule Update ";
					$emailObj->message = $html;
					
					//$emailObj->addTo($customerEmail, $customerName);
					$emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
					$emailObj->addTo('arun@ephpsolutions.com', 'Tester');
					$emailObj->attachments = [];
					
					$response = $emailObj->sendEmail();
					
					$statusText = $response['success'] ? 'Sent' : 'Failed: ' . $response['message'];

					$logData = array(
						'elcceh_client_name' => $customerName,
						'elcceh_client_contact' => $customerEmail,
						'elcceh_project' => $customerProject,
						'elcceh_message' => $html,
						'elcceh_status' => $statusText
					);

					$emailLogTable = new Fw_Db_Table('event_log_clearing_center_email_history');
					$emailLogTable->insertRow($logData);
				}
			}
			
            echo json_encode(array(
                "success" => true, 
                "new_date" => $updated_date,
                "current_status" => $status_to_set,
                "action_performed" => $action_performed
            ));
        } else {
            echo json_encode(array("success" => false, "message" => "Database operation failed"));
        }
    }
}

if (isset($_POST['action']) && $_POST['action'] === 'manage_project_status') {
    
	$bsn_id = isset($_POST['project_id']) ? (int)$_POST['project_id'] : 0;
	$current_status = isset($_POST['project_status_id']) ? (int)$_POST['project_status_id'] : 0;

	try {
	    $checkSql = "SELECT elccp_bsn_id FROM event_log_clearing_center_project WHERE elccp_bsn_id = " . $bsn_id;
	    $existing = $fwDb->query($checkSql); 
	    
	    $tableTask = new Fw_Db_Table('event_log_clearing_center_project');
	    
	    $detail = array();
	    $detail['elccp_bsn_id_status'] = $current_status;

	    if (!empty($existing)) {
	        $tableTask->setWhere("elccp_bsn_id = $bsn_id");
	        $opr = $tableTask->updateRow($detail);   
	        $action_performed = "updated";
	    } else {
	        $detail['elccp_bsn_id'] = $bsn_id;
	        $opr = $tableTask->insertRow($detail);  
	        $action_performed = "insert";
	    } 

	    if ($opr) {
	        echo json_encode([
	            'success' => true,
	            'new_status' => $current_status,
	            'action' => $action_performed
	        ]);
	    } else {
	        echo json_encode(['success' => false, 'message' => 'Database operation failed.']);
	    }

	} catch (Exception $e) {
	    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
	}
}

exit(0);
?>