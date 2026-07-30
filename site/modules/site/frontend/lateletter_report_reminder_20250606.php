

<?php
include_once BASE_DIR . 'site/modules/lateletter_report/frontend/custom_function.php';
require_once LIB_DIR . 'EmailClass.php';
require_once LIB_DIR . 'CloudEphpClass.php';

$query = "SELECT * FROM email_signature where es_id = 195";
$signatureRes = $fwDb->queryOne($query);

$query = getLateLetterReportQuery() . ' AND PPD.ppd_default_int = 1 HAVING days_late = 10';
$result = $fwDb->query($query);

$records = [];
foreach ($result as $row) {
    if (!isset($records[$row['bsn_id']])) {
        $records[$row['bsn_id']] = [];
    }

    $interest_calculated = 0;
    $total_amount = 0;
    $value = 0;
    if (!empty($row['ppd_hia_value'])) {
        $value = str_replace('$', '', $row['ppd_hia_value']);
        $value = str_replace(',', '', $value);
        $annual = ($value * 14) / 100;
        $daily = $annual / 365;
        $interest_calculated = $daily * $row['days_late'];
        $total_amount = $value + $interest_calculated;
    }

    $records[$row['bsn_id']][] = [
        'bsn_name' => trim($row['bsn_name']),
        'progress_payment_stage' => trim($row['ppd_stage']), // Invoice Stage
        'invoice_due_date' => $row['ppd_inv_due_date'], // Invoice Due Date
        'amount' => '$' . number_format($value, 2, '.', ','), // Outstanding Amount
        'interest_calculated' => '$' . number_format($interest_calculated, 2, '.', ','), // Late Fee Applied
        'total_amount' => '$' . number_format($total_amount, 2, '.', ','), // New Total Due
        'invoice_file' => $row['ppd_invoice_sent'],
    ];
}

$bsnIDs = array_keys($records);

$customers = [];
$query = 'SELECT B.bsn_id, BS.bs_business_id, BS.bs_customers_id, BC.bcust_id, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_email2, BC.bcust_misc_email3, BC.bcust_misc_email4, BC.bcust_misc_email5 FROM business B INNER JOIN business_sellers BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers BC ON BC.bcust_id = BS.bs_customers_id WHERE bsn_id IN (' . implode(',', $bsnIDs) . ')';
$customerRes = $fwDb->query($query);
foreach ($customerRes as $row) {
    if (!isset($customers[$row['bsn_id']])) {
        $customers[$row['bsn_id']] = [];
    }
    $customers[$row['bsn_id']][] = $row;
}

$errorLog = [];
foreach ($records as $bsn_id => $payment_records) {
    $cloudObj = new CloudEphpClass('lateletter_report.home');
    foreach ($customers[$bsn_id] as $customer) {
        $customerName = $customer['bcust_fname'] . ' ' . $customer['bcust_lname'];

        foreach ($payment_records as $record) {
            $emailObj = new EmailClass;
            $attachments = [];
            $invoiceUrl = '';
            $email_date = date('d-m-Y');
            $subject = 'Payment Reminder: ' . $record['progress_payment_stage'] . ' Invoice is overdue';
            $html = '';
            $html .= '<p>Dear ' . $customerName . ',</p>';
            $html .= '<br>';
            $html .= '<p>We hope this email finds you well.</p>';
            if ($record['invoice_file'] && $record['invoice_file'] != '') {
                $invoiceUrl = $cloudObj->download($record['invoice_file'], false);
                $attachments[] = $invoiceUrl;
            }
            $html .= '<p>This is a friendly reminder that ' . $record['progress_payment_stage'] . ' Invoice, originally due on ' . $record['invoice_due_date'] . ', remains unpaid.</p>';
            $html .= '<p>As per our payment terms, a late fee of ' . $record['interest_calculated'] . ' has now been applied to the outstanding balance.</p>';
            $html .= '<br>';
            $html .= '<p>Invoice Summary: </p>';
            $html .= '<p><strong>Invoice Stage:</strong> ' . $record['progress_payment_stage'] . '</p>';
            $html .= '<p><strong>Invoice Due Date:</strong> ' . $record['invoice_due_date'] . '</p>';
            $html .= '<p><strong>Outstanding Amount:</strong> ' . $record['amount'] . '</p>';
            $html .= '<p><strong>Late Fee Applied:</strong> ' . $record['interest_calculated'] . '</p>';
            $html .= '<p><strong>New Total Due:</strong> ' . $record['total_amount'] . '</p>';
            $html .= '<p>Also please find attached the <a href="' . $invoiceUrl . '" target="_blank">invoice</a></p>';
            $html .= '<p>We kindly request that payment be made as soon as possible to avoid further charges or service disruption. </p>';
            $html .= '<br>';
            $html .= '<p>If you\'ve already made this payment, please disregard this email. Should you have any questions or concerns, feel free to reach out to us.</p>';
            $html .= '<br>';
            $html .= '<p>Thank you for your attention to this matter. </p>';
            $html .= '<br>';
            $html .= '<p>Kind Regards,</p>';
            $html .= '<p><img src="' . BASE_URL . 'files/email_library/' . $signatureRes['es_logo'] . '"></p>';
            $html .= $signatureRes['es_signature'];

            $emailObj->subject = $subject;
            $emailObj->message = $html;
            $emailObj->addFrom($signatureRes['es_reply_to'], $signatureRes['es_name']);
            $emailObj->addTo('amans@ephpsolutions.com', 'Aman');
            $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');

            // if($customer['bcust_misc_email1']) {
            //     $emailObj->addTo($customer['bcust_misc_email1'], $customerName);
            // }
            // if($customer['bcust_misc_email2']) {
            //     $emailObj->addTo($customer['bcust_misc_email2'], $customerName);
            // }
            // if($customer['bcust_misc_email3']) {
            //     $emailObj->addTo($customer['bcust_misc_email3'], $customerName);
            // }
            // if($customer['bcust_misc_email4']) {
            //     $emailObj->addTo($customer['bcust_misc_email4'], $customerName);
            // }
            // if($customer['bcust_misc_email5']) {
            //     $emailObj->addTo($customer['bcust_misc_email5'], $customerName);
            // }

            // $emailObj->addCC('contract@cgfb.com.au', 'contract@cgfb.com.au');
            $emailObj->attachments = $attachments;
            $response = $emailObj->sendEmail();
            $emailObj->logSendEmail($response, [
                'module_name' => 'lateletter_report.home',
                'table_name' => 'progress_payment_detail',
                'column_name' => 'ppd_bsn_id',
                'column_id' => $bsn_id,
            ]);
            if (!$response['success']) {
                $errorLog[] = [
                    'to' => $emailObj->to,
                    'subject' => $emailObj->subject,
                    'error' => $response['message']
                ];
            }
            // db($response);
            // die();
        }
    }
}
if (empty($errorLog)) {
    echo 'no error';
} else {
    db($errorLog);
}

exit;
