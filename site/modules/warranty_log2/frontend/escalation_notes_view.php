<?php
$fwMainView = 'file:' . getcwd() . '/escalation_notes_view.tpl';
$wa_id = (int)$fwRequest->getParam('wa_id', 0);

$query = 'SELECT * FROM users';
$result = $fwDb->query($query);
$users_array = [];
foreach ($result as $row) {
	$users_array[$row['user_id']] = $row['user_name'];
}

$query = "SELECT * FROM warranty_log_escalation_notes WHERE elsn_wa_id = $wa_id ORDER BY elsn_created_at DESC";
$result = $fwDb->query($query);
foreach($result as $index => $row) {
    $result[$index]['user'] = $users_array[$row['elsn_created_by']];
    $result[$index]['date'] = date('d-M-Y', strtotime($row['elsn_created_at']));
}
$fwViewData['records'] = $result;