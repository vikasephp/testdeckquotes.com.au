<?php
$fwMainView = 'file:' . getcwd() . '/add_specific_event.tpl';
$tableTask = new Fw_Db_Table('specific_event');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('event', array());
	$this_id = (int)$detail['se_id'];
	unset($detail['se_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['se_id']);
       		 $tableTask->setWhere("se_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('se_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('specific_event');
	$tableTask->setWhere("se_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
