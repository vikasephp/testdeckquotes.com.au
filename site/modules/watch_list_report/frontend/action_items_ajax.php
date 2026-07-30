<?php
    require_once LIB_DIR . 'EmailClass.php';

    $postedData = $_POST;
    $response = ['status' => false, 'errorList' => [], 'success' => true, 'action' => '', 'data' => []];
    
    if (!empty($postedData['action']) &&  $postedData['action'] == 'updateRecord') {
        $primaryID = $postedData['primaryID'];
        $column = $postedData['column'];
        $value = $postedData['value'];
        if (!empty($primaryID)) {
            $tablebar = new Fw_Db_Table('watch_list_action_items');
            $update_data[$column] = $value;
            $tablebar->setWhere('wlai_id' . " = " . $primaryID);
            $result = $tablebar->updateRow($update_data);

            if ($result) {
                $response = ['status' => true, 'errorList' => [], 'stage' => "if", 'success' => true, 'data' => $update_data];
            } else {
                $response = ['status' => false, 'errorList' => [], 'stage' => "else", 'success' => "", 'data' => []];
            }
        } else {
            $response = ['status' => false, 'errorList' => [], 'success' => true, 'stage' => "else T", 'action' => 'updateRecord', 'data' => []];
        }
    }
    elseif (!empty($postedData['action']) &&  $postedData['action'] == 'mergeAndEmail'){
        $wlai_bsn_id = $postedData['wlai_bsn_id'];

        $query = 'SELECT bsn_name FROM business WHERE bsn_id = ' . $wlai_bsn_id;
        $result = $fwDb->queryOne($query);
        $bsn_name = $result['bsn_name'];

        $query = "SELECT * FROM watch_list_action_items WHERE wlai_action_status = 'Incomplete' AND wlai_bsn_id = " . $wlai_bsn_id;
        $watch_list_action_items = $fwDb->query($query);

        $emailObj = new EmailClass;
        $attachments = [];
        $invoiceUrl = '';
        $email_date = date('d-m-Y');
        $subject = 'Incomplete Action Items - ' . $bsn_name . '';
        $html = '';
        $html .= '<p>Please find below the list of action items that remain incomplete.</p>';
        $html .= '<p>Review and take the necessary steps to address them at your earliest convenience.</p>';

        $html .= '<table border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse">';
        $html .= '<tr>';
        $html .= '<th>Action Name</th>';
        $html .= '<th>Status</th>';
        $html .= '<th>Who</th>';
        $html .= '</tr>';
        foreach($watch_list_action_items as $row) {
            $html .= '<tr>';
            $html .= '<td>' . $row['wlai_action_name'] . '</td>';
            $html .= '<td>' . $row['wlai_action_status'] . '</td>';
            $html .= '<td>' . $row['wlai_who'] . '</td>';
            $html .= '</tr>';
        }
        $html .= '</table>';
        $html .= '<p>Thank you for your attention.</p>';
        $html .= '<p>- CGFB and FPE Team.</p>';
        
        $emailObj->subject = $subject;
        $emailObj->message = $html;
        $emailObj->addFrom('info@cgfb.com.au', 'Watch List CGFB');
        // $emailObj->addTo('amans@ephpsolutions.com', 'Aman');
        // $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
        $emailObj->addTo('clientservices@cgfb.com.au', 'Client Services');
        $emailObj->addTo('supportsales@cgfb.com.au', 'Support Sales');


        /* if($customer['bcust_misc_email1']) {
            $emailObj->addTo($customer['bcust_misc_email1'], $customerName);
        }
        if($customer['bcust_misc_email2']) {
            $emailObj->addTo($customer['bcust_misc_email2'], $customerName);
        }
        if($customer['bcust_misc_email3']) {
            $emailObj->addTo($customer['bcust_misc_email3'], $customerName);
        }
        if($customer['bcust_misc_email4']) {
            $emailObj->addTo($customer['bcust_misc_email4'], $customerName);
        }
        if($customer['bcust_misc_email5']) {
            $emailObj->addTo($customer['bcust_misc_email5'], $customerName);
        }
        $emailObj->addCC('contract@cgfb.com.au', 'contract@cgfb.com.au'); */

        $emailObj->attachments = $attachments;
        $response = $emailObj->sendEmail();
        $emailObj->logSendEmail($response, [
            'module_name' => 'watch_list_report.action_items',
            'table_name' => 'watch_list_action_items',
            'column_name' => 'wlai_bsn_id',
            'column_id' => $wlai_bsn_id,
        ]);
        if (!$response['success']) {
            $errorLog[] = [
                'to' => $emailObj->to,
                'subject' => $emailObj->subject,
                'error' => $response['message']
            ];
            $response = ['status' => false, 'error' => $response['message']];
        }
        else {
            $response = ['status' => true, 'message' => 'Email sent successfully'];
        }        
    }

    echo json_encode($response);
    exit;