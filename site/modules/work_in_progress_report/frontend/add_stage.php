<?php
$fwMainView = 'file:' . getcwd() . '/add_stage.tpl';
$tableTask = new Fw_Db_Table('wip_stage_options');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('stage', array());
	
	$this_id = (int)$detail['so_id'];
	unset($detail['so_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['so_id']);
       		 $tableTask->setWhere("so_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('so_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('wip_stage_options');
	$tableTask->setWhere("so_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
