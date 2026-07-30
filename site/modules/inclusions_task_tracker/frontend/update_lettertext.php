<?php
$itt_bsn_id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($itt_bsn_id) && !empty($value)) {
	$itt_letter_text_at = date('Y-m-d');
	$itt_letter_text_by = $_SESSION['user']['user_id'];
	$this_table = new Fw_Db_Table('inclusions_task_tracker');

	$sql = 'SELECT * FROM inclusions_task_tracker WHERE itt_bsn_id = ' . $itt_bsn_id;
	$result = $fwDb->queryOne($sql);
	$detail = [
		'itt_letter_text' => $value,
		'itt_letter_text_at' => $itt_letter_text_at,
		'itt_letter_text_by' => $itt_letter_text_by,
	];
	if(!empty($result)) {
		$this_table->setWhere("itt_bsn_id = $itt_bsn_id");
		$this_table->updateRow($detail);
	}
	else {
		$detail['itt_bsn_id'] = $itt_bsn_id;
		$this_table->insertRow($detail);
	}

	// $sql = "UPDATE inclusions_task_tracker SET itt_letter_text  = '$value', itt_letter_text_at = '$bcust_itt_letter_text_at', itt_letter_text_by = '$bcust_itt_letter_text_by' WHERE bcust_id = $id";	 
	// $fwDb -> queryOne($sql);

	echo $_SESSION['user']['user_username'] . '<br>' . date('d-M-Y');
}

exit;