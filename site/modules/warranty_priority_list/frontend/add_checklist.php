<?php
$fwMainView = 'file:' . getcwd() . '/add_checklist.tpl';
$tableTask = new Fw_Db_Table('warranty_checklist_admin');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['wc_id'];
	unset($detail['wc_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['wc_id']);
       		 $tableTask->setWhere("wc_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;			
}

$this_id = (int)$fwRequest->getParam('wc_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('warranty_checklist_admin');
	$tableTask->setWhere("wc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql_2  = "select eml_code from emaillibrary";
$fwViewData['emailcode'] = $fwDb->query($sql_2);