<?php

/**
 * If the client has not signed the Workmanship Guarantee Agreement, they will receive a weekly reminder email until the agreement is signed.
 */

require_once LIB_DIR . 'EmailClass.php';


$query = 'SELECT * FROM procedure_panel_warranty WHERE pr_id = 30';
$result = $fwDb->queryOne($query);
$customerWarrantySignedZohoLink = $result['pr_link'];

$query = 'SELECT WL.wa_id, WL.wa_project, WL.wa_problem, WL.wa_is_inspection_fee_required, WL.wa_is_inspection_fee_required_accepted, B.bsn_name, B.bsn_id, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble, (SELECT doc_file_name FROM document_check_list WHERE doc_name_id = 779 AND doc_bsn_id = B.bsn_id LIMIT 1) AS doc_file_name FROM warranty_log AS WL LEFT JOIN business AS B ON B.bsn_name = WL.wa_project INNER JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE WL.wa_status != "Closed" GROUP BY WL.wa_project HAVING doc_file_name = "" OR doc_file_name IS NULL;';
$records = $fwDb->query($query);

foreach($records as $row) {
    $customerName = $row['bcust_fname'] . ' ' . $row['bcust_lname'];
    $customerEmail = $row['bcust_misc_email1'];
    $customerMobile = $row['bcust_misc_moble'];

    if(!empty($customerEmail)) {
        $html = '';
        $html .= '<p>Dear ' . $customerName . ',</p>';
        $html .= '<p>We hope you are doing well.</p>';
        $html .= '<p>This is a friendly reminder that we have not yet received the signed <strong>Workmanship Guarantee Agreement</strong> for your project. To ensure everything proceeds smoothly and to provide you with full coverage under our workmanship guarantee, we kindly request that you review and sign the agreement at your earliest convenience.</p>';
        $html .= '<p>You can access and sign the agreement using the link below:<br><a href="' . $customerWarrantySignedZohoLink . '" target="_blank">Agreement Link</a></p>';
        $html .= '<p>If you have already signed the agreement, please disregard this message. Otherwise, completing this step will help us finalize our records and continue providing you with the best possible service.</p>';
        $html .= '<p>Should you have any questions or need assistance, feel free to reply to this email - we\'re happy to help.</p>';
        $html .= '<p>Thank you for your time and cooperation.</p>';
        $html .= '<p>Best regards,<br>CGFB Warranty Team</p>';

        $emailObj = new EmailClass;
        $emailObj->subject = 'Workmanship Guarantee Not Signed';
        $emailObj->message = $html;
        $emailObj->addFrom('warranty@cgfb.com.au', 'CGFB Warranty');
        // $emailObj->addTo($customerEmail, $customerName);
        $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
        $emailObj->addTo('designer@ephpsolutions.com', 'Vivek');
        $emailObj->addTo('amans@ephpsolutions.com', 'Aman');
        $emailObj->attachments = [];
        // $response = $emailObj->sendEmail();
        // $emailObj->logSendEmail($response, [
        //     'module_name' => 'site.workmanship-guarantee-not-signed',
        //     'table_name' => 'business',
        //     'column_name' => 'bsn_id',
        //     'column_id' => $row['bsn_id'],
        // ]);
        // if (!$response['success']) {
        //     $emailErrorLog[] = [
        //         'to' => $emailObj->to,
        //         'subject' => $emailObj->subject,
        //         'error' => $response['message']
        //     ];
        // }
        // db($emailObj);
    }
}

        

exit;