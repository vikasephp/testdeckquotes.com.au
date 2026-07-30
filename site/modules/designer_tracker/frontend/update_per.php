<?php
$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$from = $fwRequest->getparam('from', '');

if(!empty($value)) {
	$sql = "UPDATE business SET bsn_per_complete = " . $value . " WHERE bsn_id = " . $id;	 
	$fwDb->queryOne($sql);
	if($from != '') {
		$tracker_choices_changed_log = new Fw_Db_Table('tracker_choices_changed_log');
		$tracker_choices_changed_log->insertRow([
			'tccl_bsn_id' => $id,
			'tccl_type' => $from,
			'tccl_changed_per' => $value,
			'tccl_changed_by' => $_SESSION['user']['user_id'],
		]);

		$inclusions_task_tracker_choices_7_day = new Fw_Db_Table('inclusions_task_tracker_choices_7_day');
		$inclusions_task_tracker_choices_7_day->setWhere('bsn_id = ' . $id);
		$result = $inclusions_task_tracker_choices_7_day->getRow();
		if(empty($result)) {
			$inclusions_task_tracker_choices_7_day->insertRow([
				'bsn_id' => $id,
				'this_week' => $value
			]);
		}
		else {
			$inclusions_task_tracker_choices_7_day->updateRow([
				'this_week' => $value
			]);
		}

		echo $_SESSION['user']['user_username'] . '<br>' . date('d-M-Y');
	}
}

exit;