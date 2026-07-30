<?php
$fwMainView = 'file:' . getcwd() . '/add_type.tpl';
$tableTask = new Fw_Db_Table('renovation_project_types');

$fwViewData['dt_id'] = (int)$fwRequest->getParam('dt_id', 0);

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('type', array());
	
	$this_id = (int)$detail['rpt_id'];
	unset($detail['rpt_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['rpt_id']);
       		 $tableTask->setWhere("rpt_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('rpt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('renovation_project_types');
	$tableTask->setWhere("rpt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
