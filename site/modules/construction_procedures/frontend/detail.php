<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$table = new Fw_Db_Table($TABLE);
// $pc_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');

if (!empty($submit)) {
    $detail = $fwRequest->getParam('doc', array());
    // db($_FILES); die();
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);

    if ($_FILES['cp_pdf_upload']['name']) {
		$docfile_1 = $_FILES['cp_pdf_upload']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['cp_pdf_upload']['tmp_name'];
		$detail['cp_pdf_upload'] = $docfile_1;
		$fileUploaded = upload($docfile_1, $temp_name_1);
        $detail['cp_pdf_upload_date'] = date('Y-m-d H:i:s');
	}
    
    if ($this_id > 0) {
        $table->setWhere("$ID = $this_id");
        $opr = $table->updateRow($detail);
    }
    else{
        $opr = $table->insertRow($detail);
    }

    $fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0) {
    $table = new Fw_Db_Table($TABLE);
    $table->setWhere("$ID = $this_id");
    $record = $table->getRow();
    
    $fwViewData['record'] = $record;
    $fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
    $fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}
