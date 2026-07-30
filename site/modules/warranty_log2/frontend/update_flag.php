<?php

$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user  = $_SESSION['user']['user_name'];
$user_id  = $_SESSION['user']['user_id'];
$now = date('Y-m-d H:i:s');

if (!empty($value)) {
	$warranty_log_table = new Fw_Db_Table('warranty_log');
	$warranty_log_table->setWhere('wa_id = ' . $id);

	$updateData = [
		'wa_flag' => $value,
		'wa_flag_user' => $user,
		'wa_flag_date' => $dt,
	];

	if($value == 'Yes') {
		$updateData['wa_escalation_required_yes_at'] = $now;
		$updateData['wa_escalation_required_yes_by'] = $user_id;
	}
	elseif($value == 'No') {
		$updateData['wa_escalation_required_no_at'] = $now;
		$updateData['wa_escalation_required_no_by'] = $user_id;
	}

	$warranty_log_table->updateRow($updateData);
}
exit;
