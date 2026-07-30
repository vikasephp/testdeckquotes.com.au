<?php
$fwMainView = 'file:' . getcwd() . '/add_status.tpl';
$tableTask = new Fw_Db_Table('cou_comp_status');

$fwViewData['st_id'] = (int)$fwRequest->getParam('st_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['st_id'];
	unset($detail['st_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['st_id']);
       		 $tableTask->setWhere("st_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('st_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('cou_comp_status');
	$tableTask->setWhere("st_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	