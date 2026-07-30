<?php
$fwMainView = 'file:' . getcwd() . '/add_why_not.tpl';
$tableTask = new Fw_Db_Table('warranty_log_why_not');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('why_not', array());
	$this_id = (int)$detail['ww_id'];
	unset($detail['ww_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['ww_id']);
       		 $tableTask->setWhere("ww_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('ww_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('warranty_log_why_not');
	$tableTask->setWhere("ww_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
