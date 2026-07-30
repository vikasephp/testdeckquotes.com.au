<?php
$fwMainView = 'file:' . getcwd() . '/add_status_nr.tpl';
$tableTask = new Fw_Db_Table('status_admin_nr');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['ns_id'];
	unset($detail['ns_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['ns_id']);
       		 $tableTask->setWhere("ns_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('ns_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('status_admin_nr');
	$tableTask->setWhere("ns_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
