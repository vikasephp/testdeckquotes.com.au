<?php

$bsn_id = $fwRequest->getparam('bsn_id', 0);

if($bsn_id > 0 && isset($_SESSION['user']) && isset($_SESSION['user']['user_id']) && $user_id = $_SESSION['user']['user_id']) {
    // $sql = "SELECT bcust_user_id FROM bus_customers AS BC INNER JOIN business_sellers AS BS ON BS.bs_customers_id = BC.bcust_id WHERE BS.bs_business_id = $bsn_id";
    // $bus_customers = $fwDb->queryOne($sql);
    // $user_id = (int)$bus_customers['bcust_user_id'];

    $table = new Fw_Db_Table('login_tokens');
    $token = bin2hex(random_bytes(32));
    $data = [
        'user_id' => (int)$user_id,
        'bsn_id' => (int)$bsn_id,
        'token' => $token,
        'website' => 'planningapprovalscanberra.com.au',
        'expires_at' => date('Y-m-d H:i:s', strtotime('+5 minutes')),
    ];
    $result = $table->insertRow($data);
    if($result) {
        $url = 'https://planningapprovalscanberra.com.au/auto-login/' . $token;
        header("location:" . $url);
        exit;
    }
}

echo 'Problem in redirecting to the planning website';
exit;
