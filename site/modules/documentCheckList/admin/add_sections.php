<?php
$fwMainView = 'file:' . getcwd() . '/add_sections.tpl';
$tableTask = new Fw_Db_Table('dc_sections');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('section', array());
	
	$this_id = (int)$detail['dc_id'];
	unset($detail['dc_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['dc_id']);
       		 $tableTask->setWhere("dc_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('dc_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('dc_sections');
	$tableTask->setWhere("dc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
