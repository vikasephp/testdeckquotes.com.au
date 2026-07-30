<?php

include_once BASE_DIR . 'site/modules/lateletter_report/frontend/custom_function.php';
require_once LIB_DIR . 'EmailClass.php';
require_once LIB_DIR . 'CloudEphpClass.php';

$query = "SELECT * FROM email_signature where es_id = 195";
$signatureRes = $fwDb->queryOne($query);

$query = getLateLetterReportQuery() . ' AND PPD.ppd_default_int = 1';
$result = $fwDb->query($query);

$records = [];
foreach ($result as $row) {
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

    $records[] = [
        'bsn_id' => $row['bsn_id'],
        'bsn_name' => trim($row['bsn_name']),
        'progress_payment_stage' => trim($row['ppd_stage']),
        'amount' => '$' . number_format($value, 2, '.', ','),
        'interest_calculated' => '$' . number_format($interest_calculated, 2, '.', ','),
        'total_amount' => '$' . number_format($total_amount, 2, '.', ','),
        'days_late' => $row['days_late'],
        'invoice_file' => $row['ppd_invoice_sent'],
    ];
}

$bsnIDs = [];
foreach ($records as $record) {
    $bsnIDs[] = $record['bsn_id'];
}


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
$faqHIA = 'https://www.canberragrannyflatbuilders.com.au/faqs/hia-explained';
$cloudObj = new CloudEphpClass('lateletter_report.home');
foreach ($records as $record) {
    foreach ($customers[$record['bsn_id']] as $customer) {
        $emailObj = new EmailClass;
        $attachments = [];
        $email_date = date('d-m-Y');

        $subject = 'Late Letter - ' . $record['bsn_name'] . ' - ' . $record['progress_payment_stage'] . ' - '  . $email_date;
        $customerName = $customer['bcust_fname'] . ' ' . $customer['bcust_lname'];
        $html = '';
        $html .= '<p>' . $email_date . '</p>';
        $html .= '<p>' . $customerName . '</p>';
        $html .= '<p>' . 'RE: ' . $record['bsn_name'] . '</p>';
        $html .= '<br>';
        $html .= '<p>This email is to notify you that one or more of your progress payments have been made late. The invoice(s) are as follows:</p>';
        $html .= '<br>';
        $html .= '<table border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse">';
        $html .= '<tr>';
        $html .= '<th>Progress Payment Stage</th>';
        $html .= '<th>Amount</th>';
        $html .= '<th>Interest calculated</th>';
        $html .= '<th>Total Amount</th>';
        $html .= '<th>No. of Days Late</th>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<td>' . $record['progress_payment_stage'] . '</td>';
        $html .= '<td>' . $record['amount'] . '</td>';
        $html .= '<td>' . $record['interest_calculated'] . '</td>';
        $html .= '<td>' . $record['total_amount'] . '</td>';
        $html .= '<td>' . $record['days_late'] . '</td>';
        $html .= '</tr>';
        if ($record['invoice_file'] && $record['invoice_file'] != '') {
            $attachments[] = $cloudObj->download($record['invoice_file'], false);
        }
        $html .= '</table>';
        $html .= '<br>';
        $html .= '<p>Per the terms of our HIA agreement, we have the right to apply 14% interest and extend the completion time of the project. We may also put a caveat on the house.</p>';
        $html .= '<p>This email is formal notice that we reserve our rights to apply interest and add days to the project completion time equivalent to the days the payment is delayed.</p>';
        $html .= '<p>For your reference, please find the reference to the relevant clauses of the signed HIA agreement.</p>';
        $html .= '<br>';
        $html .= '<p><img src="' . BASE_URL . 'site/modules/lateletter_report/frontend/lateletter_report_ref_01.png"></p>';
        $html .= '<br>';
        $html .= '<p><img src="' . BASE_URL . 'site/modules/lateletter_report/frontend/lateletter_report_ref_02.png"></p>';
        $html .= '<br>';
        $html .= '<p><img src="' . BASE_URL . 'site/modules/lateletter_report/frontend/lateletter_report_ref_03.png"></p>';
        $html .= '<br>';
        $html .= '<p>Link to the HIA FAQs section of our website.</p>';
        $html .= '<p>' . $faqHIA . '</p>';
        $html .= '<br>';
        $html .= '<p>Our business partners are other small businesses who, in turn, employ tradespeople and apprentices across Canberra. We appreciate prompt payment so they can pay their staff on time.</p>';
        $html .= '<p>If you have reached a written agreement with our business to delay this payment, or if the payment has been paid after this has been created and sent, thank you and please disregard this email.</p>';
        $html .= '<p>If payment has been made, then interest accumulation will cease from the date of payment.</p>';
        $html .= '<p>If you have not made payment, please do so to avoid further interest payment accumulation and added days to the project timeline.</p>';
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
            'column_id' => $record['bsn_id'],
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
if (empty($errorLog)) {
    echo 'no error';
} else {
    db($errorLog);
}

exit;