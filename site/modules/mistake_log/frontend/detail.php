<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
require_once(LIB_DIR . 'CloudEphpClass.php');

$tableqa = new Fw_Db_Table($TABLE);

$fwViewData['user'] = $_SESSION['user']['user_name'];
$fwViewData['currdate'] = date('d-m-Y');

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);
	// db($_FILES); exit;
	if ($_FILES['ml_image']['name']) {

		$cloudObj = new CloudEphpClass('mistake_log.home');
		$docfile_1 = $_FILES['ml_image']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['ml_image']['tmp_name'];
		
		$result = $cloudObj->upload($docfile_1, $temp_name_1);
		if ($result) {
			$detail['ml_image'] = $docfile_1;
		} else {
			echo "Some error in image upload";
			exit;
		}						
	}


	if ($this_id > 0) {
		$tableqa->setWhere("$ID = $this_id");
		$opr = $tableqa->updateRow($detail);
	} else {
		$opr = $tableqa->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;

	//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0) {
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
	$fwViewData['this_id'] = $this_id;
} else {
	$fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}

$sqlowner = "Select * from email_signature order by es_name ASC ";
$fwViewData['owner'] = $fwDb->query($sqlowner);

$sql = "select * from mistake_log_priority";
$fwViewData['prioritydata'] = $fwDb->query($sql);
