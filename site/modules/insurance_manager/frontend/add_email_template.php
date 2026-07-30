<?php
$fwMainView = 'file:' . getcwd() . '/add_email_template.tpl';
$tableTask = new Fw_Db_Table('insurance_manager_email');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	
	
	$this_id = (int)$detail['ime_id'];
	unset($detail['ime_id']);
	
    if($this_id > 0){
		unset($detail['ime_id']);
		$tableTask->setWhere("ime_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}

$detail['ime_id']='';
$detail['ime_email_template']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('ime_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('insurance_manager_email');
	$tableTask->setWhere("ime_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	

$sql_email = "SELECT eml_code FROM emaillibrary ";
$fwViewData['emailData'] = $fwDb->query($sql_email);