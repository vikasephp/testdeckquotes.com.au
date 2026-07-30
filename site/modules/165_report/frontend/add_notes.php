<?php
$fwMainView = 'file:' . getcwd() . '/add_notes.tpl';
$tableTask = new Fw_Db_Table('165_report_notes');
$os_id = (int)$fwRequest->getParam('os_id', 0);
$fwViewData['os_id'] = $os_id;
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['on_id'];
	unset($detail['on_id']);
	
	$detail['on_date'] = date('d-m-Y');
	$detail['on_os_id'] = $os_id;
	
    if($this_id > 0)
    	{
      		 unset($detail['on_id']);
       		 $tableTask->setWhere("on_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('on_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('165_report_notes');
	$tableTask->setWhere("on_id = $this_id");
	$detail = $tableTask->getRow();
   

	$fwViewData['detail'] = $detail;
     $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
