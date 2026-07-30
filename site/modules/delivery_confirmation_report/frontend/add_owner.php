<?php
$fwMainView = 'file:' . getcwd() . '/add_owner.tpl';
$tableTask = new Fw_Db_Table('delivery_conf_owner');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('owner', array());
	$this_id = (int)$detail['ow_id'];
	unset($detail['ow_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['ow_id']);
       		 $tableTask->setWhere("ow_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('ow_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('delivery_conf_owner');
	$tableTask->setWhere("ow_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
