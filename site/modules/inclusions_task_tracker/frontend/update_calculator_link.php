<?php
$fwMainView = 'file:' . getcwd() . '/update_calculator_link.tpl';
$table = new Fw_Db_Table('inclusions_task_tracker');
$bsn_id = $fwRequest->getParam('bsn_id', 0); 
$submit = $fwRequest->getParam('submit', '');
$fwViewData['bsn_id']= $bsn_id;
if($submit)
{
	$itt_calculator_link = $fwRequest->getParam('text', '');
	$table->setWhere('itt_bsn_id = ' . $bsn_id);
	if($table->rowExists()) {
		$data['itt_calculator_link'] = $itt_calculator_link;
		$detail = $table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}

$sql = "SELECT itt_calculator_link FROM inclusions_task_tracker WHERE itt_bsn_id = $bsn_id";
$result = $fwDb->queryOne($sql);

$fwViewData['itt_calculator_link'] = $result['itt_calculator_link'];
