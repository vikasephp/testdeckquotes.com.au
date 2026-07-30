<?php
$start_time = microtime(true);
$fwMainView = 'file:' . getcwd() . '/subtask_synchronize.tpl';

$bid = $fwRequest->getparamget('bsn_id', 0);
try{
	$business_tasksTable = new Fw_Db_Table('business_tasks');
	$business_tasksTable->setWhere('bt_bsn_id = ' . $bid);
	
	// $end_time = microtime(true);
	// $execution_time = ($end_time - $start_time);
	// echo "<br><br>before business_tasksTable rowExists Script Execution Time = " . $execution_time . " sec";
	
	if ($business_tasksTable->rowExists()) {
		$business_status_subtaskTable = new Fw_Db_Table('busness_status_subtask');
		$subtaskdetail = $business_status_subtaskTable->getRows();
	
		// $end_time = microtime(true);
		// $execution_time = ($end_time - $start_time);
		// echo "<br><br>" . count($subtaskdetail) . " records subtaskdetail Script Execution Time = " . $execution_time . " sec";
	
		$business_tasks_subTable = new Fw_Db_Table('business_tasks_sub');
		$business_tasks_subTable->setWhere('bts_bsn_id = ' . $bid);
		$stman = $business_tasks_subTable->getRows();
	
		// $end_time = microtime(true);
		// $execution_time = ($end_time - $start_time);
		// echo "<br><br>" . count($stman) . " records business_tasks_subTable Script Execution Time = " . $execution_time . " sec";
		
		$bsst_id_arr = [];
		foreach ($subtaskdetail as $stv) {
			$bsst_id_arr[] = (int)$stv['bsst_id'];
		}
		// db($bsst_id_arr, 'bsst_id_arr');
		// db($business_tasks_subTable, 'business_tasks_subTable');

		$business_tasks_subTable->setWhere('bts_bsn_id = ' . (int)$bid . ' AND bts_bsst_id IN (' . implode(',', $bsst_id_arr) . ')');
		// db($business_tasks_subTable, 'business_tasks_subTable');
		$existingSubTasks = $business_tasks_subTable->getRows();
		$existingSubTasksBtsBsnIDArr = [];
		foreach($existingSubTasks as $subTasks){
			$existingSubTasksBtsBsnIDArr[] = $subTasks['bts_bsst_id'];
		}

		// $end_time = microtime(true);
		// $execution_time = ($end_time - $start_time);
		// echo "<br><br>" . count($existingSubTasks) . " records existingSubTasks Script Execution Time = " . $execution_time . " sec";

		// $business_tasks_subTable->setWhere('bts_bsn_id = ' . (int)$bid . ' AND bts_bsst_id NOT IN (' . implode(',', $bsst_id_arr) . ')');
		// db($business_tasks_subTable, 'business_tasks_subTable');
		// $nonExistingSubTasks = $business_tasks_subTable->getRows();
		// $nonExistingSubTasksBtsBsnIDArr = [];
		// foreach($nonExistingSubTasks as $subTasks){
		// 	$nonExistingSubTasksBtsBsnIDArr[] = $subTasks['bts_bsst_id'];
		// }

		// $end_time = microtime(true);
		// $execution_time = ($end_time - $start_time);
		// echo "<br><br>" . count($nonExistingSubTasks) . " records nonExistingSubTasks Script Execution Time = " . $execution_time . " sec";

		$insertSQL = 'INSERT INTO business_tasks_sub (bts_bsst_id, bts_bsn_id, bts_task_status_id, bts_task_id, bts_task_name) VALUES ';
		$insertCount = 0;
		$updateSQL = 'INSERT INTO business_tasks_sub (bts_id, bts_task_name) VALUES ';
		$updateCount = 0;
		foreach($subtaskdetail as $stv){
			// if(in_array((int)$stv['bsst_id'], $nonExistingSubTasksBtsBsnIDArr)){
			// 	$insertSQL .= '("' . (int)$stv['bsst_id'] . '", "' . (int)$bid . '", "' . (int)$stv['bsst_business_status_id'] . '", "' . (int)$stv['bsst_bst_id'] . '", "' . addslashes($stv['bsst_task_name']) . '"),';
			// 	$insertCount++;
			// }
			if(in_array((int)$stv['bsst_id'], $existingSubTasksBtsBsnIDArr)){
				$updateSQL .= '("' . (int)$row['bts_id'] . '", "' . addslashes($stv['bsst_task_name']) . '"),';
				$updateCount++;
			}
			else{
				$insertSQL .= '("' . (int)$stv['bsst_id'] . '", "' . (int)$bid . '", "' . (int)$stv['bsst_business_status_id'] . '", "' . (int)$stv['bsst_bst_id'] . '", "' . addslashes($stv['bsst_task_name']) . '"),';
				$insertCount++;
			}
		}

		if($insertCount > 0){
			$insertSQL = substr($insertSQL, 0, strlen($insertSQL) - 1) . ';';
			// echo "<br><br>$insertCount Insert. "/*  . $insertSQL */;
			// $fwDb = new Fw_Db();
			// $fwDb->query($insertSQL);
			mysqli_multi_query($MySqliCon, $insertSQL);
		}
		if($updateCount > 0){
			$updateSQL = substr($updateSQL, 0, strlen($updateSQL) - 1) . ' ON DUPLICATE KEY UPDATE bts_task_name = VALUES(bts_task_name);';
			// echo "<br><br>$updateCount Update. "/*  . $updateSQL */;
			// $fwDb = new Fw_Db();
			// $fwDb->query($updateSQL);
			mysqli_multi_query($MySqliCon, $updateSQL);
		}

		// $end_time = microtime(true);
		// $execution_time = ($end_time - $start_time);
		// echo "<br><br>End Time = " . $execution_time . " sec";

		// db($fwDb, 'fwDb');
	
		echo "<h3> Subtask is updated.... Now you can close the window </h3>";
	}
	
}
catch(Exception $exp){
	db($exp, 'exp');
}

