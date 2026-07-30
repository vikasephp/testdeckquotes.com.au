<?php
$fwMainView = 'file:' . getcwd() . '/add_task.tpl';
$tablest = new Fw_Db_Table('support_task');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('task', array());
	$this_id = (int)$detail['st_id'];

	unset($detail['st_id']);
		
	
    if($this_id > 0)
    	{
       		 $tablest->setWhere("st_id = $this_id");
	     	 $opr = $tablest->updateRow($detail);   
    	}
	else
	{
		 $opr = $tablest->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('st_id', 0);
if ($this_id > 0)
{
	$tablest = new Fw_Db_Table('support_task');
	$tablest->setWhere("st_id = $this_id");
	$detail = $tablest->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	