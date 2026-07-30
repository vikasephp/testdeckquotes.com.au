<?php
$fwMainView = 'file:' . getcwd() . '/add_banner_action.tpl';
$tableTask = new Fw_Db_Table('street_sign_banner_design');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['sa_id'];
	unset($detail['sa_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['sa_id']);
       		 $tableTask->setWhere("sa_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('sa_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('street_sign_banner_design');
	$tableTask->setWhere("sa_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
