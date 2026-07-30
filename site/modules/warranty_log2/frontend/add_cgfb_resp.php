<?php
$fwMainView = 'file:' . getcwd() . '/add_cgfb_resp.tpl';
$tableTask = new Fw_Db_Table('warranty_log_cgfb');
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('cgfb', array());
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
	$tableTask = new Fw_Db_Table('warranty_log_cgfb');
	$tableTask->setWhere("wc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
