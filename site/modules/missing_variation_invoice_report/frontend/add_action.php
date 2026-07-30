<?php
$fwMainView = 'file:' . getcwd() . '/add_action.tpl';
$tableTask = new Fw_Db_Table('missing_variations_action');

$fwViewData['ma_id'] = (int)$fwRequest->getParam('ma_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['ma_id'];
	unset($detail['ma_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['ma_id']);
       		 $tableTask->setWhere("ma_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('ma_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('missing_variations_action');
	$tableTask->setWhere("ma_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	