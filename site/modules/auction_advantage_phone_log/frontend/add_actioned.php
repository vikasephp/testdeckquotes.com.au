<?php
$fwMainView = 'file:' . getcwd() . '/add_actioned.tpl';
$tableTask = new Fw_Db_Table('auction_advantage_phone_log_actioned');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('type', array());
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
	$tableTask = new Fw_Db_Table('auction_advantage_phone_log_actioned');
	$tableTask->setWhere("pa_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit Actioned Admin';//.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New Actioned Admin ';//.$MODULE_SINGULAR;
}	
