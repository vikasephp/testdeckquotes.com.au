<?php

/**
 * Send SMS Notification to Trades for Due Date Passed. 
 * Only 1 sms to be sent after due date
 */

require_once LIB_DIR . 'SmsClass.php';

$query = "SELECT car.car_id, car.car_bsn_id, car.car_status, car.car_new_date, se.se_email, c.cs_id, c.cs_first_name, c.cs_surname, c.cs_mobile, b.bsn_name FROM construction_alert_report car INNER JOIN supplier_email se ON se.se_car_id = car.car_id INNER JOIN contacts c ON c.cs_primary_email = se.se_email INNER JOIN business b ON b.bsn_id = car.car_bsn_id WHERE car.car_status IN ('Open', 'Pending') AND car.car_new_date IS NOT NULL AND car.car_new_date <> '' AND STR_TO_DATE(car.car_new_date, '%d-%m-%Y') = CURDATE() - INTERVAL 1 DAY AND c.cs_active = 1 LIMIT 1;";
$results = $fwDb->query($query);

//echo "<pre>"; print_r($results); exit();

foreach ($results as $result) {

    if (empty($result['cs_mobile'])) {
        continue;
    }

    $smsMessage = "Hi\n\n"
    . "Please help provide an update for this alert that has been allocated to you.\n\n"
    . "Address: {$result['bsn_name']}\n\n"
    . "Alert number: {$result['car_id']}\n\n"
    . "Please provide an update using the below link:\n\n"
    . "Link: https://www.deckquotes.com.au/site.car_comment_update_form/car_id/{$result['car_id']}\n\n"
    . "Below is a link to help explain how the system works, and what is required:\n\n"
    . "Link: https://www.deckquotes.com.au/business_document/ai-procedure/did-2260-how-to-close-construction-alert\n\n";


    $smsMessage .= "- Canberra Fixed Price Extensions and Granny Flat Builders";
	
	echo "<pre>"; echo $smsMessage; //exit;
 
    /* $to = preg_replace('/\D/', '', $result['cs_mobile']);
    if (strpos($to, '04') === 0) {
        $to = '61' . substr($to, 1);
    } */
	
    // Testing Number
    //$to = "61485982524";
	//$to = "61407237765";
	$to = "61485900531";

    $smsObj = new SmsClass($to, $smsMessage);
    $response = $smsObj->send();
	
	//$smsObj1 = new SmsClass($to1, $smsMessage);
    //$response1 = $smsObj1->send();
}

exit;