<?php
$fwMainView = 'file:' . getcwd() . '/add_feature.tpl';
$tableTask = new Fw_Db_Table('design_interface_keyfeatures');

//$fwViewData['dt_id'] = (int)$fwRequest->getParam('dt_id', 0);


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('feature', array());
	
	$this_id = (int)$detail['dik_id'];
	unset($detail['dik_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['dik_id']);
       		 $tableTask->setWhere("dik_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('dik_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('design_interface_keyfeatures');
	$tableTask->setWhere("dik_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
