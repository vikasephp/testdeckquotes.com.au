<?php
$fwMainView = 'file:' . getcwd() . '/add_occupancy.tpl';
$tableTask = new Fw_Db_Table('roofing_occupancy');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('occupancy', array());
	
	$this_id = (int)$detail['ro_id'];
	unset($detail['ro_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['ro_id']);
       		 $tableTask->setWhere("ro_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	         $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('ro_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('roofing_occupancy');
	$tableTask->setWhere("ro_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
