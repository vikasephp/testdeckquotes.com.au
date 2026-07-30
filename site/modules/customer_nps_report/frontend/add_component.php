<?php
$fwMainView = 'file:' . getcwd() . '/add_component.tpl';
$tableTask = new Fw_Db_Table('quote_builder_component');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('component', array());
	
	$this_id = (int)$detail['qb_id'];
	unset($detail['qb_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['qb_id']);
       		 $tableTask->setWhere("qb_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('qb_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('quote_builder_component');
	$tableTask->setWhere("qb_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
