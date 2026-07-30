<?php
$fwMainView = 'file:' . getcwd() . '/letter_text_read.tpl';
$table = new Fw_Db_Table('inclusions_task_tracker');
$bsn_id = $fwRequest->getParam('bsn_id', 0); 
$submit = $fwRequest->getParam('submit', '');
$fwViewData['bsn_id']= $bsn_id;
if($submit)
{
	$itt_letter_text_read = $fwRequest->getParam('text', '');
	$table->setWhere('itt_bsn_id = ' . $bsn_id);
	if($table->rowExists()) {
		$data['itt_letter_text_read'] = $itt_letter_text_read;
		$detail = $table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}

$sql = "SELECT itt_letter_text_read FROM inclusions_task_tracker WHERE itt_bsn_id = $bsn_id";
$result = $fwDb->queryOne($sql);

$fwViewData['itt_letter_text_read'] = $result['itt_letter_text_read'];
