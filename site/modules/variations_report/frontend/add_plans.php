<?php
$fwMainView = 'file:' . getcwd() . '/add_plans.tpl';
$tableTask = new Fw_Db_Table('variation_report_plans');

$fwViewData['vp_id'] = (int)$fwRequest->getParam('vp_id', 0);
$fwViewData['opr'] =  false;
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['vp_id'];
	unset($detail['vp_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['vp_id']);
       		 $tableTask->setWhere("vp_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = true;	
}

$detail['vp_id']='';
$detail['vp_option']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('vp_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('variation_report_plans');
	$tableTask->setWhere("vp_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	