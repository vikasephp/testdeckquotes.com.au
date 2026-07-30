<?php
$fwMainView = 'file:' . getcwd() . '/add_lvc_type.tpl';
$tableTask = new Fw_Db_Table('lvc_ut_lvc_type');

$fwViewData['lv_id'] = (int)$fwRequest->getParam('lv_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['lv_id'];
	unset($detail['lv_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['lv_id']);
       		 $tableTask->setWhere("lv_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('lv_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('lvc_ut_lvc_type');
	$tableTask->setWhere("lv_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	