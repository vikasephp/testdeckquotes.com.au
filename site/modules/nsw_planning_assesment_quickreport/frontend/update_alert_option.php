<?php

$id = $fwRequest->getParam('bsn_id', 0);
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20', ' ', $value);

if (!empty($value) && $id > 0) {
	$now = date('Y-m-d');
	$user_id = $_SESSION['user']['user_id'];
	$sql = "UPDATE business_sellers SET bs_paqr_alertoption = $value, bs_paqr_alertoption_by = $user_id, bs_paqr_alertoption_at = '$now' WHERE bs_business_id = $id";
	$fwDb->queryOne($sql);

	echo $_SESSION['user']['user_username'] . "<br>" . date('d-M-Y');
}

exit;
