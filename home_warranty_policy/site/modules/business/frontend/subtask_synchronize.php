<?php
$fwMainView = 'file:' . getcwd() . '/subtask_synchronize.tpl';

$bid = $fwRequest->getparamget('bsn_id', 0);



$business_tasksTable = new Fw_Db_Table('business_tasks');
$business_tasksTable->setWhere('bt_bsn_id = '.$bid);

if($business_tasksTable->rowExists())
{
	$business_status_subtaskTable = new Fw_Db_Table('busness_status_subtask');
	$subtaskdetail = $business_status_subtaskTable->getRows();
	
	$business_tasks_subTable = new Fw_Db_Table('business_tasks_sub');
	$business_tasks_subTable->setWhere('bts_bsn_id = '. $bid);
	$stman = $business_tasks_subTable->getRows();

		foreach($subtaskdetail as $stv)
		{
			
			$business_tasks_subTable->setWhere('bts_bsn_id = '. $bid. ' And bts_bsst_id = '.$stv['bsst_id'] );
			if(!$business_tasks_subTable->rowExists())
			{
					
					unset($std);
					$std['bts_bsst_id'] = $stv['bsst_id'];
					$std['bts_bsn_id'] = $bid;
					$std['bts_task_status_id'] = $stv['bsst_business_status_id'];
					$std['bts_task_id'] = $stv['bsst_bst_id'];
					$std['bts_task_name'] = $stv['bsst_task_name'];
													
					$business_tasks_subTable->insertRow($std);
					
			}
			else
			{
				unset($std2);
				$std2['bts_task_name'] = $stv['bsst_task_name'];
				$business_tasks_subTable->updateRow($std2);
			}	
	  }
	echo "<h3> Subtask is updated.... Now you can close the window </h3>";	
}
