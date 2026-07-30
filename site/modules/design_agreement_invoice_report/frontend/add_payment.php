<?php
$fwMainView = 'file:' . getcwd() . '/add_payment.tpl';
$tableTask = new Fw_Db_Table('design_agr_inv_pament');

$fwViewData['dp_id'] = (int)$fwRequest->getParam('dp_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['dp_id'];
	unset($detail['dp_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['dp_id']);
       		 $tableTask->setWhere("dp_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('dp_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('design_agr_inv_pament');
	$tableTask->setWhere("dp_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	