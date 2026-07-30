<?php
$fwMainView = 'file:' . getcwd() . '/add_type.tpl';
$tableTask = new Fw_Db_Table('variation_report_type');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['vt_id'];
	unset($detail['vt_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['vt_id']);
       		 $tableTask->setWhere("vt_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = true;
			
}

$detail['vt_id']='';
$detail['vt_option']='';

$fwViewData['detail'] = $detail;


$this_id = (int)$fwRequest->getParam('vt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('variation_report_type');
	$tableTask->setWhere("vt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
