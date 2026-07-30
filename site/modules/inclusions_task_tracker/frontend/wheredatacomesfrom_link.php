<?php
$fwMainView = 'file:' . getcwd() . '/wheredatacomesfrom_link.tpl';
$table = new Fw_Db_Table('inclusions_task_tracker');
$bsn_id = $fwRequest->getParam('bsn_id', 0); 
$submit = $fwRequest->getParam('submit', '');
$fwViewData['bsn_id']= $bsn_id;
if($submit)
{
	$itt_where_data_comes_from = $fwRequest->getParam('text', '');
	$table->setWhere('itt_bsn_id = ' . $bsn_id);
	if($table->rowExists()) {
		$data['itt_where_data_comes_from'] = $itt_where_data_comes_from;
		$detail = $table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}

$sql = "SELECT itt_where_data_comes_from FROM inclusions_task_tracker WHERE itt_bsn_id = $bsn_id";
$result = $fwDb->queryOne($sql);

$fwViewData['itt_where_data_comes_from'] = $result['itt_where_data_comes_from'];
