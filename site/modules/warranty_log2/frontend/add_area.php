<?php
$fwMainView = 'file:' . getcwd() . '/add_area.tpl';
$tableTask = new Fw_Db_Table('warranty_log_area');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('area', array());
	$this_id = (int)$detail['wa_id'];
	unset($detail['wa_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['wa_id']);
       		 $tableTask->setWhere("wa_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('wa_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('warranty_log_area');
	$tableTask->setWhere("wa_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
