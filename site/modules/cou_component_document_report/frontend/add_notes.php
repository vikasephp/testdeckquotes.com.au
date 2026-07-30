<?php
$fwMainView = 'file:' . getcwd() . '/add_notes.tpl';

$bsn_id = $fwRequest->getparam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;
$cou_component_document_report_notes_table = new Fw_Db_Table('cou_component_document_report_notes');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit)) {
    $detail = $fwRequest->getParam('task', array());
	
	$bsn_id = (int)$detail['ccdrn_bsn_id'];
	$this_id = (int)$detail['ccdrn_id'];
	unset($detail['ccdrn_id']);
	// unset($detail['bsn_id']);
	// db($detail); exit;
	
	$detail['ccdrn_created_by'] = $_SESSION['user']['user_id'];
	
	if($bsn_id > 0) {
		if($this_id > 0){             
			unset($detail['ccdrn_id']);
			$cou_component_document_report_notes_table->setWhere("ccdrn_id = $this_id");
			$opr = $cou_component_document_report_notes_table->updateRow($detail);   
		} else{
			$opr = $cou_component_document_report_notes_table->insertRow($detail); 
		}
		$fwViewData['opr'] = $opr;
	}
	
    /* if($bsn_id > 0) {
        $detail['ccdrn_created_by'] = $_SESSION['user']['user_id'];
        $opr = $cou_component_document_report_notes_table->insertRow($detail);
	 	
	    $fwViewData['opr'] = $opr;
    } */
	
}

$this_id = (int)$fwRequest->getParam('ccdrn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('cou_component_document_report_notes');
	$tableTask->setWhere("ccdrn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit ';
}
else
{
    $fwViewData['title'] = 'Add ';
}	