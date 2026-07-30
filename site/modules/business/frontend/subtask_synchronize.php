<?php
$start_time = microtime(true);
$fwMainView = 'file:' . getcwd() . '/subtask_synchronize.tpl';

$bid = $fwRequest->getparamget('bsn_id', 0);
try{
	$business_tasksTable = new Fw_Db_Table('business_tasks');
	$business_tasksTable->setWhere('bt_bsn_id = ' . $bid);
	
	if ($business_tasksTable->rowExists()) {
		$business_status_subtaskTable = new Fw_Db_Table('busness_status_subtask');
		$subtaskdetail = $business_status_subtaskTable->getRows();
		$bsst_id_arr = [];
		foreach ($subtaskdetail as $stv) {
			$bsst_id_arr[] = (int)$stv['bsst_id'];
		}
	
		$business_tasks_subTable = new Fw_Db_Table('business_tasks_sub');
		$business_tasks_subTable->setWhere('bts_bsn_id = ' . $bid);
		$stman = $business_tasks_subTable->getRows();

		$business_tasks_subTable->setWhere('bts_bsn_id = ' . (int)$bid . ' AND bts_bsst_id IN (' . implode(',', $bsst_id_arr) . ')');
		$existingSubTasks = $business_tasks_subTable->getRows();
		$existingSubTasksBtsBsnIDArr = [];
		$bts_id_array = [];
		foreach($existingSubTasks as $subTasks){
			$existingSubTasksBtsBsnIDArr[] = $subTasks['bts_bsst_id'];
			$bts_id_array[$subTasks['bts_bsst_id']] = $subTasks['bts_id'];
		}

		$insertSQL = 'INSERT INTO business_tasks_sub (bts_bsst_id, bts_bsn_id, bts_task_status_id, bts_task_id, bts_task_name) VALUES ';
		$insertCount = 0;
		$updateSQL = 'INSERT INTO business_tasks_sub (bts_id, bts_task_name) VALUES ';
		$updateCount = 0;
		foreach($subtaskdetail as $stv){
			if(in_array((int)$stv['bsst_id'], $existingSubTasksBtsBsnIDArr)){
				$updateSQL .= '("' . (int)$bts_id_array[$stv['bsst_id']] . '", "' . addslashes($stv['bsst_task_name']) . '"),';
				$updateCount++;
			}
			else{
				$insertSQL .= '("' . (int)$stv['bsst_id'] . '", "' . (int)$bid . '", "' . (int)$stv['bsst_business_status_id'] . '", "' . (int)$stv['bsst_bst_id'] . '", "' . addslashes($stv['bsst_task_name']) . '"),';
				$insertCount++;
			}
		}

		if($insertCount > 0){
			$insertSQL = substr($insertSQL, 0, strlen($insertSQL) - 1) . ';';
			mysqli_multi_query($MySqliCon, $insertSQL);
		}
		if($updateCount > 0){
			$updateSQL = substr($updateSQL, 0, strlen($updateSQL) - 1) . ' ON DUPLICATE KEY UPDATE bts_task_name = VALUES(bts_task_name);';
			// mysqli_multi_query($MySqliCon, $updateSQL);
		}

		echo '
			<p><strong>Total Subtasks: </strong> ' . ( count($subtaskdetail) ) . '</p>
			<p><strong>Total Existing Subtasks: </strong> ' . ( count($stman) ) . '</p>
			<p><strong>Total Synced Subtasks: </strong> ' . ( count($subtaskdetail) - count($stman) ) . '</p>
		';
		echo "<h3> Subtask is updated.... Now you can close the window </h3>";
	}
	
}
catch(Exception $exp){
	db($exp, 'exp');
}

