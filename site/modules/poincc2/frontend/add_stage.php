<?php
$fwMainView = 'file:' . getcwd() . '/add_stage.tpl';
$tableTask = new Fw_Db_Table('poincc2_invoice_stage');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['is_id'];
	unset($detail['is_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['is_id']);
       		 $tableTask->setWhere("is_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('is_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('poincc2_invoice_stage');
	$tableTask->setWhere("is_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
