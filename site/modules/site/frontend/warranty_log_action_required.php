<?php

/**
 * Send Email to customers for Warranty Log Action Required 
 */

require_once LIB_DIR . 'EmailClass.php';

$query = "SELECT bc.bcust_id, CONCAT(bc.bcust_fname, ' ', bc.bcust_lname) AS customer_name, bc.bcust_misc_email1 AS customer_email, bc.bcust_misc_moble as customer_phone, b.bsn_id, b.bsn_name AS project_name, wl.wa_id, wl.wa_problem, wl.wa_status, wl.wa_is_inspection_fee_required, wl.wa_id AS warranty_log_number, wl.wa_inspection_proposed_fees, wl.wa_is_inspection_fee_required_accepted, wl.wa_wlis_id as warranty_log_inspection_status FROM `warranty_log` wl JOIN `business` b ON b.bsn_name = wl.wa_project JOIN `business_sellers` bs ON bs.bs_business_id = b.bsn_id JOIN `bus_customers` bc ON bc.bcust_id = bs.bs_customers_id WHERE wl.wa_is_inspection_fee_required = 1 and wl.wa_is_inspection_fee_required_inspection_completed = 0 AND wl.wa_is_inspection_fee_required_cancelled = 0 AND wl.wa_wlis_id in (1, 5) AND wl.wa_status != 'Closed' GROUP BY wl.wa_id ORDER BY bc.bcust_id, wl.wa_id";
$results = $fwDb->query($query);

$groupedData = [];
foreach ($results as $row) {
	$groupedData[$row['customer_email']][] = $row;
}


foreach ($groupedData as $email => $logs) {
	
	$log_bsn = $logs[0]['bsn_id'];
	
	$customerName = $logs[0]['customer_name'];
    $customerEmail = $logs[0]['customer_email'];
    $customerMobile = $logs[0]['customer_phone'];
	
	$tableRows = "";
    foreach ($logs as $log) {

		if ($log['wa_inspection_proposed_fees'] == 0 && $log['warranty_log_inspection_status'] == 1 ){
			$inspectionText = 'Complimentary';
		} elseif ($log['wa_inspection_proposed_fees'] == 75 && $log['warranty_log_inspection_status'] == 1) {
			$inspectionText = 'Authorise $75 Inspection';
		} elseif ($log['wa_is_inspection_fee_required_accepted'] == 1 && $log['warranty_log_inspection_status'] == 5){
			$inspectionText = 'Schedule Inspection';
		}

        $tableRows .= "
            <tr>
                <td style='border: 1px solid #dddddd; padding: 8px;'>" .$log['warranty_log_number']. "</td>
                <td style='border: 1px solid #dddddd; padding: 8px;'>" .$log['project_name']. "</td>
                <td style='border: 1px solid #dddddd; padding: 8px;'>" .$log['wa_problem']. "</td>
                <td style='border: 1px solid #dddddd; padding: 8px; color: #d9534f; font-weight: bold;'>" .$inspectionText. "</td>
            </tr>";
    }

    if(!empty($customerEmail)) {
        $html = '';
        $html .= '<p>Good morning ' . $customerName . ',</p>';
        $html .= '<p>This is a follow-up to advise that there are <strong>one or more warranty items pending your action</strong>. </p>';
        $html .= '<p>To allow us to attend site and investigate the issue(s), <strong>you must select an inspection time in the warranty portal</strong>. We are unable to proceed until an inspection schedule is confirmed. </p>';
		$html .= '<p>Please log in to the warranty portal using the link below. <br/>Use the <strong>email address or mobile number registered with us for your project</strong> to access the portal.</p>';
		$html .= '<p><strong>Warranty Portal</strong>: <a href="https://warrantyreport.com.au/login" target="_blank">Portal Link</a> </p>';
		$html .= '<p style="font-size: 18px;"><strong>Where to Take Action</strong></p>';
		$html .= '<p>After logging in, you can access the required actions in either of the following ways: </p>';
		$html .= '<p>A <strong>pop-up notification</strong> will appear directing you to the <strong>Customer Action Required</strong> section, or Navigate directly to <strong>Customer Action Required</strong> from your dashboard. </p>';
		$html .= '<p>From there, select the relevant warranty item and <strong>choose an available inspection date and time</strong>. </p>';
		$html .= '<p style="font-size: 18px;"><strong>Items Requiring Your Action</strong></p>';
		$html .= "<table style='width: 100%; border-collapse: collapse;'>
            <thead>
                <tr style='background-color: #f2f2f2;'>
                    <th style='border: 1px solid #dddddd; padding: 8px; text-align: left;'>Log ID</th>
                    <th style='border: 1px solid #dddddd; padding: 8px; text-align: left;'>Project Name</th>
                    <th style='border: 1px solid #dddddd; padding: 8px; text-align: left;'>Problem</th>
                    <th style='border: 1px solid #dddddd; padding: 8px; text-align: left;'>Action Required</th>
                </tr>
            </thead>
            <tbody>
                $tableRows
            </tbody>
        </table>";
		$html .= '<p style="font-size: 18px;"><strong>Important </strong></p>';
		$html .= '<p>An inspection cannot proceed until a time is selected. <br/>This email is sent daily as a reminder. <br/>Once the inspection is scheduled, these reminders will automatically stop. </p>';
		$html .= '<p>If you have already scheduled your inspection, please disregard this message. <br/>If you have any questions or need assistance, feel free to reply to this email. </p>';

        $html .= '<p>Best regards,<br>CGFB Warranty Team</p>';
		
		//echo $html; exit('Checking');

		$emailObj = new EmailClass;
		$emailObj->addFrom('warranty@cgfb.com.au', 'CGFB Warranty');
		
		$emailObj->subject = "Action Required - Please Schedule Your Warranty Inspection";
        $emailObj->message = $html;
		
        $emailObj->addTo($customerEmail, $customerName);
		/* if ((int)$log_bsn === 3486) {
			$emailObj->addTo('coo@cgfb.com.au', 'Oliver');
		} */
        //$emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
        //$emailObj->addTo('designer@ephpsolutions.com', 'Vivek');
        $emailObj->attachments = [];
		
		$response = $emailObj->sendEmail();
        $emailObj->logSendEmail($response, [
            'module_name' => 'inspection_warranty_log.home',
            'table_name' => 'business',
            'column_name' => 'bsn_id',
            'column_id' => $log_bsn,
        ]);
        if (!$response['success']) {
            $emailErrorLog[] = [
                'to' => $emailObj->to,
                'subject' => $emailObj->subject,
                'error' => $response['message']
            ];
        }
        // db($emailObj);
        echo $html; 
    }
}

        
if (!empty($emailErrorLog)) {
    db($emailErrorLog);
}

exit;