<?php
$fwMainView = 'file:' . getcwd() . '/add_project_type.tpl';
$tableTask = new Fw_Db_Table('ptt_project_type');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	
	$this_id = (int)$detail['pt_id'];
	unset($detail['pt_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['pt_id']);
       		 $tableTask->setWhere("pt_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('pt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('ptt_project_type');
	$tableTask->setWhere("pt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
