<?php

/**
 * Trigger a reminder in every 7 day after link is added on the portal.
 * business.detail Page -> Property Vustomer Page Tab -> Design Agreement Signed Field
 */

require_once LIB_DIR . 'EmailClass.php';

$query = "SELECT * FROM email_signature where es_id = 222";
$signatureRes = $fwDb->queryOne($query);
// db($signatureRes);
// exit;

// $sql = 'SELECT doc_bsn_id, doc_name_id, doc_file_name FROM document_check_list WHERE doc_name_id = 45 AND doc_file_name IS NOT NULL AND doc_file_name != ""';
// $result = $fwDb->query($sql);
// db($result);

$sql = 'SELECT CO.co_bsn_id, CO.co_design_agreement_sign_link, B.bsn_name, B.bsn_proj_salu, (SELECT doc_file_name FROM document_check_list WHERE doc_name_id = 45 AND doc_bsn_id = CO.co_bsn_id LIMIT 1) AS document FROM client_overview AS CO INNER JOIN business B ON B.bsn_id = CO.co_bsn_id WHERE co_design_agreement_sign_link IS NOT NULL AND co_design_agreement_sign_link != "" HAVING document IS NULL OR document = ""';
$result = $fwDb->query($sql);
db($result);
exit;
foreach ($result as $row) {
    $html = '';
    $emailObj = new EmailClass;
    // $emailObj->to = $row['co_bsn_id'];
    $emailObj->subject = 'Reminder: Please Sign Your Design Agreement';

    $salutation = 'Hi';
    if(!empty($row['bsn_proj_salu'])) {
        $salutation = $row['bsn_proj_salu'];
    }

    $html .= '<p>' . $salutation . '</p>';
    $html .= '<p>We hope you are doing well.</p>';
    $html .= '<p>This is a gentle reminder to kindly review and sign your Design Agreement using the secure Zoho Sign link provided below:</p>';
    $html .= '<p><a href="' . $row['co_design_agreement_sign_link'] . '" target="_blank">Sign Design Agreement</a></p>';
    $html .= '<p>Please take a moment to go through the document and complete the signing process at your earliest convenience. If you have any questions or need any clarification, please feel free to reach out—we’re more than happy to assist.</p>';
    $html .= '<p>Your prompt action will help us proceed to the next stage without delays.</p>';
    $html .= '<p>Kind regards,</p>';
    $html .= '<p>' . $signatureRes['es_signature'] . '</p>';

    $emailObj->message = $html;
    $emailObj->addFrom($signatureRes['es_reply_to'], $signatureRes['es_name']);
    db($emailObj);
    $emailObj->addTo('amans@ephpsolutions.com', 'Aman');
    // $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');

    $response = $emailObj->sendEmail();

    $emailObj->logSendEmail($response, [
        'module_name' => 'business.detail',
        'table_name' => 'client_overview',
        'column_name' => 'co_bsn_id',
        'column_id' => $row['co_bsn_id'],
    ]);
    if (!$response['success']) {
        $errorLog[] = [
            'to' => $emailObj->to,
            'subject' => $emailObj->subject,
            'error' => $response['message']
        ];
    }
    db($response); exit;
}

if (empty($errorLog)) {
    echo 'no error';
} else {
    db($errorLog);
}

exit;
