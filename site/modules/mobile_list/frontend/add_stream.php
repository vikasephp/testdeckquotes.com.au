<?php
$fwMainView = 'file:' . getcwd() . '/add_stream.tpl';
$tableTask = new Fw_Db_Table('mobile_list_stream');

$fwViewData['ms_id'] = (int)$fwRequest->getParam('ms_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['ms_id'];
	unset($detail['ms_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['ms_id']);
       		 $tableTask->setWhere("ms_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('ms_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('mobile_list_stream');
	$tableTask->setWhere("ms_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	