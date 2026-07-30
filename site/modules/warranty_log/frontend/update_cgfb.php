<?php

$id = $fwRequest->getParam('wa_id', '');
$value = (int)$fwRequest->getparam('value', '');

$sql = "UPDATE warranty_log SET wa_cgfb_resp = $value WHERE wa_id = $id;";
$fwDb->queryOne($sql);

$output = '';
if ($value > 0) {
	$dt = date('d-m-Y');
	$usr = $_SESSION['user']['user_name'];
	$sql_2 = "UPDATE warranty_log SET wa_cgfb_user = '$usr', wa_cgfb_date = '$dt' WHERE wa_id = $id;";
	$fwDb->queryOne($sql_2);

	$output = '
		<span>' . $usr . '</span>
		<span>' . $dt . '</span>
	';
} else {
	$sql_2 = "UPDATE warranty_log SET wa_cgfb_user = '', wa_cgfb_date  = '' WHERE wa_id = " . $id;
	$fwDb->queryOne($sql_2);
}

echo $output;

exit;
