<?php
$fwMainView = 'file:' . getcwd() . '/add_ppt.tpl';
$tableTask = new Fw_Db_Table('planning_project_types');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	
	$this_id = (int)$detail['pp_id'];
	unset($detail['pp_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['pp_id']);
       		 $tableTask->setWhere("pp_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('pp_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('planning_project_types');
	$tableTask->setWhere("pp_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
