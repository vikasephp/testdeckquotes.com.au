<?php
$fwMainView = 'file:' . getcwd() . '/add_procedure.tpl';
$tableTask = new Fw_Db_Table('pp_pcr');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
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
	$tableTask = new Fw_Db_Table('pp_pcr');
	$tableTask->setWhere("pr_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
