<?php
$fwMainView = 'file:' . getcwd() . '/add_they_want.tpl';
$tableTask = new Fw_Db_Table('roofing_they_want');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('they_want', array());
	
	$this_id = (int)$detail['rt_id'];
	unset($detail['rt_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['rt_id']);
       		 $tableTask->setWhere("rt_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	         $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('rt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('roofing_they_want');
	$tableTask->setWhere("rt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
