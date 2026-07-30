<?php
$fwMainView = 'file:' . getcwd() . '/read_reason.tpl';

$this_table = new Fw_Db_Table($TABLE);
$this_id = $fwRequest->getParam($ID, 0); 
$submit = $fwRequest->getParam('submit', '');
$fwViewData['this_id']= $this_id;

if($submit && $this_id > 0) {
	$ldd_read_reason = $fwRequest->getParam('text', '');
	$this_table->setWhere($ID . ' = ' . $this_id);
	if($this_table->rowExists()) {
		$data['ldd_read_reason'] = $ldd_read_reason;
		$detail = $this_table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}

$sql = "SELECT ldd_read_reason FROM $TABLE WHERE $ID = $this_id";
$result = $fwDb->queryOne($sql);

$fwViewData['ldd_read_reason'] = $result['ldd_read_reason'];
