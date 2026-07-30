<?php
$fwMainView = 'file:' . getcwd() . '/add_alert.tpl';
$tableTask = new Fw_Db_Table('paqr_alert_admin');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('alert', array());
	$this_id = (int)$detail['pa_id'];
	unset($detail['pa_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['pa_id']);
       		 $tableTask->setWhere("pa_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('pa_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('paqr_alert_admin');
	$tableTask->setWhere("pa_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
