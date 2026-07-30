<?php
$fwMainView = 'file:' . getcwd() . '/sync.tpl';

$bd_id = $fwRequest->getParam('bd_id', '');


//db($data);

$save = $fwRequest->getParam('save', '');
if (!empty($save)) {
	$phase = $fwRequest->getParam('phase', '');
	
	if($phase) {
		$phase_data = implode("|",$phase);
	}
	
	//db($phase);
	//db($bd_id);
	//db($phase_data);
	
	$sql = "update business_documents set bd_sync_planning = '".$phase_data."' where bd_id = ".$bd_id;
	$fwDb->queryOne($sql);
	$fwViewData['msg'] = "Sync of Document Done";
	
}

$sqlbd = "select bd_sync_planning from business_documents where bd_id = ".$bd_id;

$data = $fwDb->queryOne($sqlbd);
$fwViewData['phase_string'] =  $data['bd_sync_planning'];
