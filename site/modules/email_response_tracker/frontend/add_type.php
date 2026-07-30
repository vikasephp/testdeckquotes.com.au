<?php
$fwMainView = 'file:' . getcwd() . '/add_type.tpl';
$tableTask = new Fw_Db_Table('email_response_type');

$fwViewData['et_id'] = (int)$fwRequest->getParam('et_id', 0);
$fwViewData['opr'] =  false;
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['et_id'];
	unset($detail['et_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['et_id']);
       		 $tableTask->setWhere("et_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = true;	
}
$detail['et_id']='';
$detail['et_option']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('et_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('email_response_type');
	$tableTask->setWhere("et_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	