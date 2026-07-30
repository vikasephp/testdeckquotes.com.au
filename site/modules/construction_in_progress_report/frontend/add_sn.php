<?php
$fwMainView = 'file:' . getcwd() . '/add_sn.tpl';
$tableTask = new Fw_Db_Table('cipr_sn_th');

$fwViewData['sn_id'] = (int)$fwRequest->getParam('sn_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('option', array());
	
	$this_id = (int)$detail['sn_id'];
	unset($detail['sn_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['sn_id']);
       		 $tableTask->setWhere("sn_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('sn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('cipr_sn_th');
	$tableTask->setWhere("sn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
