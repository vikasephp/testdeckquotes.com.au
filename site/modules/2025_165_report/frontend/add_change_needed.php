<?php
$fwMainView = 'file:' . getcwd() . '/add_change_needed.tpl';
$tableTask = new Fw_Db_Table('165_report_change_needed');


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['cn_id'];
	unset($detail['cn_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['cn_id']);
       		 $tableTask->setWhere("cn_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('cn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('165_report_change_needed');
	$tableTask->setWhere("cn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
