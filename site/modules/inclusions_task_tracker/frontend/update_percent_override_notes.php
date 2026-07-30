<?php
$fwMainView = 'file:' . getcwd() . '/update_percent_override_notes.tpl';
$table = new Fw_Db_Table('business');
$bsn_id = $fwRequest->getParam('bsn_id', 0); 
$submit = $fwRequest->getParam('submit', '');
$fwViewData['bsn_id']= $bsn_id;
if($submit)
{
	$bsn_percentage_notes = $fwRequest->getParam('text', '');
	$table->setWhere('bsn_id = ' . $bsn_id);
	if($table->rowExists()) {
		$data['bsn_percentage_notes'] = $bsn_percentage_notes;
		$detail = $table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}

$sql = "SELECT bsn_percentage_notes FROM business WHERE bsn_id = $bsn_id";
$result = $fwDb->queryOne($sql);

$fwViewData['bsn_percentage_notes'] = $result['bsn_percentage_notes'];
