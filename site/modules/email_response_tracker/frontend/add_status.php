<?php
$fwMainView = 'file:' . getcwd() . '/add_status.tpl';
$tableTask = new Fw_Db_Table('email_response_status');

$fwViewData['st_id'] = (int)$fwRequest->getParam('st_id', 0);
$fwViewData['opr'] =  false;
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['st_id'];
	unset($detail['st_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['st_id']);
       		 $tableTask->setWhere("st_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = true;	
}

$detail['st_id']='';
$detail['st_option']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('st_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('email_response_status');
	$tableTask->setWhere("st_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	