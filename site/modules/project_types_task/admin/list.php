<?php
$tablePages = new Fw_Db_Table($TABLE);
$busness_statusTable = new Fw_Db_Table('busness_status');
$business_status_task_ordersTable = new Fw_Db_Table('business_status_task_orders');
$busness_typesTable = new Fw_Db_Table('project_type');
$cbs = $fwRequest -> getParam('cbs',0);
$types = $fwRequest -> getParam('types',0);
$setids = $fwRequest -> getParam('setids','');
$saveord = $fwRequest->getParam('saveorder', '');
$opr = $fwRequest->getParam('opr', '');

if($saveord && $setids && !$opr)
	{
	$ids = explode("|", $setids);
	

	if(is_array($ids))
		{
		$business_status_task_ordersTable->setWhere("business_status_task_orders_type_id = {$types} AND business_status_task_orders_status_id = {$cbs}");
		
		$business_status_task_ordersTable->deleteRows();		
		$ids = remove_empty_element(array_unique($ids));
		foreach($ids as $k => $v)
			{
			if($v > 0):
				$data['business_status_task_orders_type_id'] = $types;
				$data['business_status_task_orders_status_id'] = $cbs;
				$data['business_status_task_orders_tasks_id'] = $v;
				$data['business_status_task_orders_tasks_oid'] = $k;
				$business_status_task_ordersTable->insertRow($data); 
			endif;
			}
		}	
	}
	
$where = " WHERE 1=1 ";
if($cbs > 0){$where .= " AND ".$TABLE.".bst_business_status_id = ".$cbs;}
if($types > 0){$where2 .= " AND business_status_task_orders.business_status_task_orders_type_id = ".$types;}

if($cbs > 0 )
/**** Begin task related to business status ***/

$bstasksql = "SELECT ".$TABLE.".*,busness_status.*, business_status_task_orders.business_status_task_orders_tasks_oid FROM ".$TABLE." 
LEFT JOIN busness_status ON ".$TABLE.".bst_business_status_id = busness_status.st_id
LEFT JOIN business_status_task_orders ON ".$TABLE.".bst_id = business_status_task_orders.business_status_task_orders_tasks_id ".$where2."
".$where." GROUP BY business_status_task_orders.business_status_task_orders_tasks_id ORDER BY business_status_task_orders.business_status_task_orders_tasks_oid ASC ";

$bstasksq2 = "SELECT ".$TABLE.".*,busness_status.* FROM ".$TABLE." 
LEFT JOIN busness_status ON ".$TABLE.".bst_business_status_id = busness_status.st_id
".$where." GROUP BY business_status_task_orders.business_status_task_orders_tasks_id ORDER BY ".$TABLE.".bst_order ASC ";

if($bstasksql){ $tasks = $fwDb->query($bstasksql); }

if(empty($tasks) && $cbs > 0){$tasks = $fwDb->query($bstasksq2);
if($tasks){foreach($tasks as $val){$fwViewData['dids'] .= $val['bst_id']."|";}}}else{
if($tasks){foreach($tasks as $val){$fwViewData['dids'] .= $val['bst_id']."|";}}

	if($tasks):
	 $data = array();
		foreach($tasks as $h):
			if($h['bst_business_types']):
				$seids = unserialize($h['bst_business_types']);
				if($seids[$types] == 1): $data[] =  $h;	endif;
			endif;
		endforeach;
	endif;
							
if(count($data) > 0): $tasks = $data; endif;
$fwViewData['task'] = $tasks;
}

$fwViewData['allbusiness_status'] = $busness_statusTable->getAllRows();
$fwViewData['allbusiness_types'] = $busness_typesTable->getAllRows();

$fwViewData['title'] = $MODULE_PLURAL;
$fwViewData['cbs_id'] = $cbs;
$fwViewData['types'] = $types;