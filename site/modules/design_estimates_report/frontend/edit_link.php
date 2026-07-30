<?php
$fwMainView = 'file:' . getcwd() . '/edit_link.tpl';
$table = new Fw_Db_Table('document_proposal_name');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['dpn_unique_id'];
	unset($detail['dpn_unique_id']);
	
    if($this_id > 0){
		unset($detail['dpn_unique_id']);
		$table->setWhere("dpn_unique_id = $this_id");
		$opr = $table->updateRow($detail);   
	}
	else
	{
		$opr = $table->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('dpn_unique_id', 0);
if ($this_id > 0)
{
	$table = new Fw_Db_Table('document_proposal_name');
	$table->setWhere("dpn_unique_id = $this_id");
	$detail = $table->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
