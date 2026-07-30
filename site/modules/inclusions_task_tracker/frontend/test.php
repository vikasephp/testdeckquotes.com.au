<?php
// Datacenter - US
// Organization portal ID - 904034957
// Request ID - 521525000000047325
// Document ID - 35E27A8D-UPFDKQ58FS9JQOY6OZ1PSRCJLYHU-ACGFPINAJKVEZ8
// Created on - Oct 28, 2025 22:05

/*
Datacenter - US
Organization portal ID - 904034957
Request ID - 521525000000047227
Document ID - 35E27A8D-JW560IPNSFPMZZ56XX9FAMM-X4C40WHVR5_KPZ4NLJQ
Created on - Oct 28, 2025 20:58
*/
$createdRequestId = '521525000000047227';
$action_id = '521525000000045362';

$POST_DATA = array(
    'host' => 'https://sign.zoho.com'
);
$curl = curl_init("https://sign.zoho.com/api/v1/requests/".$createdRequestId."/actions/".$action_id."/embedtoken?host=https://www.deckquotes.com.au");
curl_setopt($curl, CURLOPT_TIMEOUT, 30);
curl_setopt($curl, CURLOPT_HTTPHEADER, array(
    'Authorization:Zoho-oauthtoken 1000.cc6691ad82ecc829fdbd8622d299dbaf.6e5ac0755cf1e15a892b0aff2f977b0e',
));
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, $POST_DATA);
$response = curl_exec($curl);
echo $response;
$jsonbody = json_decode($response); // contain filed tyes response
if ($jsonbody->status == "success") {
    $signingURL = $jsonbody->sign_url;
    echo $signingURL;
} 
else //Error check for error
{
    echo $jsonbody->message;
}
curl_close($curl);

exit;