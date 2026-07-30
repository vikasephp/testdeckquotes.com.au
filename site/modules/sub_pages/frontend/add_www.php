<?php
$fwMainView = 'file:' . getcwd() . '/add_www.tpl';
$tableTask = new Fw_Db_Table('sub_pages_www');

 $fwViewData['opr'] = false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['sw_id'];
	unset($detail['sw_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['sw_id']);
       		 $tableTask->setWhere("sw_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$detail['sw_option']='';
$detail['sw_id']='';
$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('sw_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('sub_pages_www');
	$tableTask->setWhere("sw_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
