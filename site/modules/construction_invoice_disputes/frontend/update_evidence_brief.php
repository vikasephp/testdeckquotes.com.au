<?php
$fwMainView = 'file:' . getcwd() . '/update_evidence_brief.tpl';
$this_table = new Fw_Db_Table($TABLE);
$this_id = $fwRequest->getParam($ID, 0); 
$submit = $fwRequest->getParam('submit', '');
$fwViewData['this_id']= $this_id;
if($submit && $this_id > 0) {
	$ldd_evidence_brief_link = $fwRequest->getParam('text', '');
	$this_table->setWhere($ID . ' = ' . $this_id);
	if($this_table->rowExists()) {
		$data['ldd_evidence_brief_link'] = $ldd_evidence_brief_link;
		$detail = $this_table->updateRow($data);
	}	
	$fwViewData['opr'] = "Close";	
}

$sql = "SELECT ldd_evidence_brief_link FROM $TABLE WHERE $ID = $this_id";
$result = $fwDb->queryOne($sql);

$fwViewData['ldd_evidence_brief_link'] = $result['ldd_evidence_brief_link'];
