<?php
$fwMainView = 'file:' . getcwd() . '/add_priority.tpl';
$tableTask = new Fw_Db_Table('warranty_log_priority');

//$fwViewData['dt_id'] = (int)$fwRequest->getParam('dt_id', 0);
//$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('priority', array());
	
	$this_id = (int)$detail['pr_id'];
	unset($detail['pr_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['pr_id']);
       		 $tableTask->setWhere("pr_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('pr_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('warranty_log_priority');
	$tableTask->setWhere("pr_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
