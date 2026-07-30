<?php
$fwMainView = 'file:' . getcwd() . '/view_notes.tpl';
$tableTask = new Fw_Db_Table('business_sellers');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['bs_business_id'];
	unset($detail['bs_business_id']);
	
	db($detail);
	
    if($this_id > 0)
    	{
      		 unset($detail['bs_business_id']);
       		 $tableTask->setWhere("bs_business_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	   	
	    $fwViewData['opr'] = $opr;
	
}

$this_id = (int)$fwRequest->getParam('bsn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('business_sellers');
	$tableTask->setWhere("bs_business_id = $this_id");
	$detail = $tableTask->getRow();
   

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
