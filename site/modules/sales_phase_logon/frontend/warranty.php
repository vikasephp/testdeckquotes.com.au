<?php

$bsn_id = $fwRequest->getparam('bsn_id', 0);
$wa_id = $fwRequest->getparam('wa_id', 0);
$login_type = $fwRequest->getparam('login_type', '');
$type = $fwRequest->getparam('type', '');

if($bsn_id > 0 && isset($_SESSION['user']) && isset($_SESSION['user']['user_id']) && $user_id = $_SESSION['user']['user_id']) {
    $table = new Fw_Db_Table('login_tokens');
    $token = bin2hex(random_bytes(32));
    $data = [
        'user_id' => (int)$user_id,
        'bsn_id' => (int)$bsn_id,
        'token' => $token,
        'website' => 'warrantyreport.com.au',
        'expires_at' => date('Y-m-d H:i:s', strtotime('+5 minutes')),
    ];
    if($login_type != '') {
        $data['login_type'] = $login_type;
        $meta = [];
        if($wa_id > 0) {
            $meta['wa_id'] = $wa_id;
        }
        if($type != '') {
            $meta['type'] = $type;
        }
        $data['meta'] = json_encode($meta);
    }
    $result = $table->insertRow($data);
    if($result) {
        $url = 'https://warrantyreport.com.au/auto-login/' . $token;
        header("location:" . $url);
        exit;
    }
}

echo 'Problem in redirecting to the warranty website';
exit;
