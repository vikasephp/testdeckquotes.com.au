<?php
$fwMainView = 'file:' . getcwd() . '/add_type.tpl';
$tableTask = new Fw_Db_Table('di_2_type_admin');

$fwViewData['ta_id'] = (int)$fwRequest->getParam('ta_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['ta_id'];
	unset($detail['ta_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['ta_id']);
       		 $tableTask->setWhere("ta_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('ta_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('di_2_type_admin');
	$tableTask->setWhere("ta_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	