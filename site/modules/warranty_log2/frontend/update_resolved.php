<?php
$wn_id = $fwRequest->getParam('wn_id', '');
$ws_id = $fwRequest->getParam('ws_id', '');
$value = $fwRequest->getparam('value', '');

$table = $fwRequest->getParam('table', '');
$id = $fwRequest->getParam('id', '');
	
	
	if(!empty($wn_id)) {
		$sql_1 = "Update warranty_log_notes set  wn_resolved  = ".$value." where wn_id = ".$wn_id;	 
		$fwDb -> queryOne($sql_1);
	}
	
	if(!empty($ws_id)) {
		$sql_2 = "Update warranty_supplier_update set  ws_resolved  = ".$value." where ws_id = ".$ws_id;	 
		$fwDb -> queryOne($sql_2);
	}
	
	if(!empty($table) && !empty($id)) {
		if($table == 'warranty_log_notes') {
			$sql_3 = "Update warranty_log_notes set wn_resolved = ".$value." where wn_id = ".$id;
		} elseif ($table == 'warranty_supplier_update') {
			$sql_3 = "Update warranty_supplier_update set ws_resolved = ".$value." where ws_id = ".$id;
		}
		$fwDb -> queryOne($sql_3);
	}
	
exit;