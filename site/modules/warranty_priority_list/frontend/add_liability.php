<?php
$fwMainView = 'file:' . getcwd() . '/add_liability.tpl';
$tableTask = new Fw_Db_Table('warranty_log_liability');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['wl_id'];
	unset($detail['wl_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['wl_id']);
       		 $tableTask->setWhere("wl_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('wl_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('warranty_log_liability');
	$tableTask->setWhere("wl_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
