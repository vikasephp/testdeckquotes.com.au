<?php
$fwMainView = 'file:' . getcwd() . '/add_sent.tpl';
$tableTask = new Fw_Db_Table('deposite_report_sent');

$fwViewData['ds_id'] = (int)$fwRequest->getParam('ds_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['ds_id'];
	unset($detail['ds_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['ds_id']);
       		 $tableTask->setWhere("ds_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('ds_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('deposite_report_sent');
	$tableTask->setWhere("ds_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	