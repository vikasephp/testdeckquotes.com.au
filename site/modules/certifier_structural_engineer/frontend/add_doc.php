<?php
$fwMainView = 'file:' . getcwd() . '/add_doc.tpl';
$tableTask = new Fw_Db_Table('ss_required_doc');

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail2 = $fwRequest->getParam('type', array());
	

	$data = explode('|',$detail2['ss_document']);

	
	$detail['ss_document'] = $data[0];
	$detail['ss_doc_id'] = $data[1];

	
	$this_id = (int)$detail['ss_id'];
	unset($detail['ss_id']);
	
    if($this_id > 0){
		unset($detail['ss_id']);
		$tableTask->setWhere("ss_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}

$detail['ss_id']='';
$detail['ime_email_template']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('ss_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('ss_required_doc');
	$tableTask->setWhere("ss_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	

$sql_doc = "SELECT admin_doc_id, admin_doc_name FROM admin_document_check_list ";
$fwViewData['docData'] = $fwDb->query($sql_doc);