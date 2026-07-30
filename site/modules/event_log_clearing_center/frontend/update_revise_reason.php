<?php

$elcc_row_id = $fwRequest->getParam('elcc_row_id', '');
$value = trim($fwRequest->getParam('value', ''));

if ($elcc_row_id != '') {

	$checkSql = "SELECT elcc_row_id FROM event_log_clearing_center WHERE elcc_row_id = ".$elcc_row_id;
	$existing = $fwDb->query($checkSql);
	
	$tableTask = new Fw_Db_Table('event_log_clearing_center');
	if (!empty($existing)) {
		$detail['elcc_reason'] = $value;
		$tableTask->setWhere("elcc_row_id = $elcc_row_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$detail['elcc_reason'] = $value;
		$detail['elcc_row_id'] = $elcc_row_id;
		$opr = $tableTask->insertRow($detail); 
	} 
}

exit('Success');