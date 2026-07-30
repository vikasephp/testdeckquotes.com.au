<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';

$fwViewData['title'] = $MODULE_PLURAL;
$fwViewData['this_id'] = $this_id = (int)$fwRequest->getParam($ID, '0');

$this_table = new Fw_Db_Table($TABLE);
$this_table->setWhere("$ID = $this_id");
$fwViewData['detail'] = $this_table->getRow();

$query = 'SELECT * FROM item_categories ORDER BY ic_name ASC';
$result = $fwDb->query($query);
$fwViewData['categories'] = $result;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit)) {
	$data = $fwRequest->getParam('data', []);
	$this_id = (int)$data[$ID];
	unset($data[$ID]);
	$data['il_name'] = trim($data['il_name']);

	if ($this_id > 0) {
		$this_table->setWhere("$ID = $this_id");
		$opr = $this_table->updateRow($data);
	} else {
		$opr = $this_table->insertRow($data);
	}
	$fwViewData['opr'] = $opr;
}
